-- ============================================================
-- Run this in Supabase Dashboard → SQL Editor
-- ============================================================

-- 1. Add avatar_url column to profiles table
ALTER TABLE profiles
  ADD COLUMN IF NOT EXISTS avatar_url TEXT;

-- 2. Create the avatars storage bucket (public)
--    If you already created it manually, this is a no-op.
INSERT INTO storage.buckets (id, name, public)
VALUES ('avatars', 'avatars', true)
ON CONFLICT (id) DO UPDATE SET public = true;

-- 3. Storage RLS policies
--    Allow authenticated users to upload/update/delete their own avatar.
--    Allow everyone to read (public bucket).

-- Drop existing policies first to avoid conflicts on re-run
DROP POLICY IF EXISTS "avatar_insert" ON storage.objects;
DROP POLICY IF EXISTS "avatar_update" ON storage.objects;
DROP POLICY IF EXISTS "avatar_delete" ON storage.objects;
DROP POLICY IF EXISTS "avatar_select" ON storage.objects;

-- Upload own avatar
CREATE POLICY "avatar_insert" ON storage.objects
  FOR INSERT TO authenticated
  WITH CHECK (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

-- Overwrite own avatar (upsert needs UPDATE as well)
CREATE POLICY "avatar_update" ON storage.objects
  FOR UPDATE TO authenticated
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

-- Delete own avatar
CREATE POLICY "avatar_delete" ON storage.objects
  FOR DELETE TO authenticated
  USING (
    bucket_id = 'avatars'
    AND (storage.foldername(name))[1] = auth.uid()::text
  );

-- Public read (anyone can view profile pictures)
CREATE POLICY "avatar_select" ON storage.objects
  FOR SELECT TO public
  USING (bucket_id = 'avatars');
