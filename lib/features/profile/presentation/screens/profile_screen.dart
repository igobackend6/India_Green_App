import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import 'about_app_screen.dart';
import '../../../../core/theme/theme_provider.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/l10n/locale_provider.dart';
import '../../../onboarding/providers/auth_provider.dart';
import '../../../../l10n/app_localizations.dart';

/// Language options available for switching from within the app.
const _languages = [
  ('Tamil',     'தமிழ்'),
  ('Hindi',     'हिन्दी'),
  ('Telugu',    'తెలుగు'),
  ('Kannada',   'ಕನ್ನಡ'),
  ('Malayalam', 'മലയാളം'),
  ('Marathi',   'मराठी'),
  ('Bengali',   'বাংলা'),
  ('Gujarati',  'ગુજરાતી'),
  ('Punjabi',   'ਪੰਜਾਬੀ'),
  ('Odia',      'ଓଡ଼ିଆ'),
  ('Assamese',  'অসমীয়া'),
  ('English',   'English'),
];

/// Profile & Settings screen with user info, role badges, and action tiles.
class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  File? _previewImage;  // local preview while uploading
  bool _uploading = false;
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    // ── Step 1: pick a file from camera / gallery ──
    XFile? picked;
    try {
      picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 512,
      );
    } catch (e) {
      if (mounted) {
        _showError('Could not open ${source == ImageSource.camera ? 'camera' : 'gallery'}: $e');
      }
      return;
    }

    if (picked == null) return; // user cancelled

    final file = File(picked.path);
    setState(() {
      _previewImage = file;
      _uploading = true;
    });

    // ── Step 2: upload to Supabase ──
    try {
      await ref.read(authProvider.notifier).uploadAvatar(file);
      if (mounted) {
        setState(() => _uploading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('✅ Profile photo updated!'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _previewImage = null;
          _uploading = false;
        });
        // Show the actual Supabase error so it's easy to diagnose
        _showError(e.toString().replaceFirst('Exception: ', ''));
      }
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('❌ $message'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 6),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () =>
              ScaffoldMessenger.of(context).hideCurrentSnackBar(),
        ),
      ),
    );
  }

  Widget _buildAvatarContent(ThemeData theme, AuthState authState) {
    // 1. Local preview file (just picked, uploading)
    if (_previewImage != null) {
      return ClipOval(
        child: Image.file(
          _previewImage!,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
        ),
      );
    }

    // 2. Persisted network URL from Supabase
    final url = authState.profile?.avatarUrl;
    if (url != null && url.isNotEmpty) {
      return ClipOval(
        child: CachedNetworkImage(
          imageUrl: url,
          width: 90,
          height: 90,
          fit: BoxFit.cover,
          placeholder: (_, __) => CircleAvatar(
            radius: 43,
            backgroundColor: AppColors.forestGreen.withValues(alpha: 0.1),
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: AppColors.forestGreen,
            ),
          ),
          errorWidget: (_, __, ___) => _initialsAvatar(theme, authState),
        ),
      );
    }

    // 3. Initials fallback
    return _initialsAvatar(theme, authState);
  }

  Widget _initialsAvatar(ThemeData theme, AuthState authState) {
    return CircleAvatar(
      radius: 43,
      backgroundColor: AppColors.forestGreen.withValues(alpha: 0.1),
      child: Text(
        authState.profile?.name.isNotEmpty == true
            ? authState.profile!.name.substring(0, 1).toUpperCase()
            : 'F',
        style: theme.textTheme.headlineMedium?.copyWith(
          color: AppColors.forestGreen,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Text(
                'Update Profile Photo',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 12),
              ListTile(
                leading: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.forestGreen.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.camera_alt_rounded,
                      color: AppColors.forestGreen),
                ),
                title: const Text('Take Photo'),
                subtitle: const Text('Open camera'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFF3B82F6).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.photo_library_rounded,
                      color: Color(0xFF3B82F6)),
                ),
                title: const Text('Choose from Gallery'),
                subtitle: const Text('Pick an existing photo'),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              if (ref.read(authProvider).profile?.avatarUrl != null ||
                  _previewImage != null)
                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(Icons.delete_outline_rounded,
                        color: AppColors.error),
                  ),
                  title: const Text('Remove Photo'),
                  onTap: () async {
                    Navigator.pop(context);
                    setState(() {
                      _previewImage = null;
                      _uploading = true;
                    });
                    await ref.read(authProvider.notifier).removeAvatar();
                    if (mounted) {
                      setState(() => _uploading = false);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Profile photo removed.'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerLowest,
      appBar: AppBar(
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        title: Text(
          l10n.myProfile,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: BackButton(color: Colors.white),
      ),
      body: SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        children: [
          const SizedBox(height: 16),

          // ── Profile Card ────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: _showPhotoOptions,
                        child: Stack(
                          children: [
                            // ── Avatar ──
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: AppColors.forestGreen.withValues(alpha: 0.35),
                                  width: 2.5,
                                ),
                              ),
                              child: _buildAvatarContent(theme, authState),
                            ),
                            // ── Camera badge / upload spinner ──
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 28,
                                height: 28,
                                decoration: BoxDecoration(
                                  color: _uploading
                                      ? Colors.white
                                      : AppColors.forestGreen,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2),
                                ),
                                child: _uploading
                                    ? Padding(
                                        padding: const EdgeInsets.all(5),
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: AppColors.forestGreen,
                                        ),
                                      )
                                    : const Icon(
                                        Icons.camera_alt_rounded,
                                        color: Colors.white,
                                        size: 14,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),  // GestureDetector
                      const SizedBox(height: 16),
                      Text(
                        authState.profile?.name ?? 'Farmer',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+91 ${authState.profile?.phone ?? ''}',
                        style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pincode: ${authState.profile?.pincode ?? ''}',
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  alignment: WrapAlignment.center,
                  children: authState.selectedRoles
                      .map((role) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.harvestGold.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.harvestGold.withValues(alpha: 0.3)),
                            ),
                            child: Text(role,
                                style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.harvestGold,
                                    fontWeight: FontWeight.bold)),
                          ))
                      .toList(),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),

          const SizedBox(height: 24),

          // ── Settings Tiles ──────────────
          _SettingsTile(
            icon: Icons.translate_rounded,
            label: l10n.language,
            value: authState.selectedLanguage,
            onTap: () => _showLanguagePicker(authState.selectedLanguage),
          ).animate().fadeIn(delay: 200.ms),

          _SettingsTile(
            icon: Icons.dark_mode_rounded,
            label: l10n.darkMode,
            trailing: Switch(
              value: ref.watch(themeModeProvider) == ThemeMode.dark,
              onChanged: (val) {
                ref.read(themeModeProvider.notifier).toggleTheme(val);
              },
              activeThumbColor: AppColors.growthGreen,
            ),
          ).animate().fadeIn(delay: 250.ms),

          const SizedBox(height: 16),

          // ── Location Access Instructions ──
          Container(
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Location Access',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.forestGreen,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '1. Go to settings ->\n'
                  '2. Apps ->\n'
                  '3. INDIA GREEN APP ->\n'
                  '4. Permissions ->\n'
                  '5. Allow Location(Toggle ON).',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 300.ms),

          const SizedBox(height: 16),

          _SettingsTile(
            icon: Icons.info_outline_rounded,
            label: l10n.aboutApp,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AboutAppScreen()),
            ),
          ).animate().fadeIn(delay: 320.ms),

          const SizedBox(height: 24),

          // ── Logout ──────────────────────
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  context.go(Routes.splash);
                }
              },
              icon: const Icon(Icons.logout_rounded, color: AppColors.error),
              label: Text(l10n.logout,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColors.error, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ).animate().fadeIn(delay: 350.ms),

          const SizedBox(height: 32),
        ],
      ),
    ));
  }

  /// Bottom sheet language picker — always rendered in English so the user
  /// can read it regardless of the currently active locale.
  void _showLanguagePicker(String currentLang) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Localizations.override(
        context: ctx,
        locale: const Locale('en'),
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, scrollCtrl) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Row(
                  children: [
                    const Icon(Icons.translate_rounded, color: AppColors.forestGreen),
                    const SizedBox(width: 8),
                    Text(
                      'Select Language',
                      style: Theme.of(ctx).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  controller: scrollCtrl,
                  itemCount: _languages.length,
                  itemBuilder: (_, i) {
                    final (name, native) = _languages[i];
                    final isSelected = name == currentLang;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected
                            ? AppColors.forestGreen
                            : AppColors.softGray,
                        child: Text(
                          native.substring(0, 1),
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        native,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? AppColors.forestGreen
                              : AppColors.textPrimary,
                        ),
                      ),
                      subtitle: Text(name,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textMuted)),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded,
                              color: AppColors.forestGreen)
                          : null,
                      onTap: () {
                        // Apply to the whole app immediately
                        ref.read(localeProvider.notifier).setLanguage(name);
                        ref.read(authProvider.notifier).setLanguage(name);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Reusable settings tile.
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.label,
    this.value,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.forestGreen, size: 20),
        ),
        title: Text(label,
            style: theme.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w600)),
        subtitle: value != null
            ? Text(value!,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: AppColors.textMuted))
            : null,
        trailing: trailing ??
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
