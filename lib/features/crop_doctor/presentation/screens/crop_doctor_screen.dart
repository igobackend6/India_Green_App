import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/theme/app_colors.dart';

class CropDoctorScreen extends StatefulWidget {
  const CropDoctorScreen({super.key});

  @override
  State<CropDoctorScreen> createState() => _CropDoctorScreenState();
}

class _CropDoctorScreenState extends State<CropDoctorScreen> {
  File? _selectedImage;
  bool _isLoading = false;
  final _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    try {
      setState(() => _isLoading = true);
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 85,
        maxWidth: 1080,
      );
      if (picked != null) {
        setState(() => _selectedImage = File(picked.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not access ${source == ImageSource.camera ? 'camera' : 'gallery'}: $e'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _clearImage() => setState(() => _selectedImage = null);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: AppColors.error,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Crop Doctor',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'AI-powered crop disease diagnosis',
              style: theme.textTheme.labelSmall?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Hero illustration / image preview ──
            _selectedImage == null
                ? _buildUploadPlaceholder(theme)
                : _buildImagePreview(theme),

            const SizedBox(height: 28),

            // ── Action buttons ──
            if (_selectedImage == null) ...[
              _buildActionButton(
                icon: Icons.camera_alt_rounded,
                label: 'Open Camera',
                subtitle: 'Take a photo of the affected crop',
                color: AppColors.forestGreen,
                onTap: () => _pickImage(ImageSource.camera),
                index: 0,
              ),
              const SizedBox(height: 14),
              _buildActionButton(
                icon: Icons.photo_library_rounded,
                label: 'Upload from Gallery',
                subtitle: 'Choose an existing photo',
                color: const Color(0xFF3B82F6),
                onTap: () => _pickImage(ImageSource.gallery),
                index: 1,
              ),
            ] else ...[
              // ── Analyse / retake buttons shown after image selected ──
              FilledButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('AI diagnosis coming soon…'),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                icon: const Icon(Icons.biotech_rounded),
                label: const Text('Analyse Crop'),
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.forestGreen,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ).animate().fadeIn(duration: 300.ms).slideY(begin: 0.15),
              const SizedBox(height: 12),
              OutlinedButton.icon(
                onPressed: _clearImage,
                icon: const Icon(Icons.refresh_rounded),
                label: const Text('Choose Different Photo'),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ).animate(delay: 80.ms).fadeIn(duration: 300.ms),
            ],

            const SizedBox(height: 28),

            // ── Tips card ──
            _buildTipsCard(theme).animate(delay: 200.ms).fadeIn(duration: 400.ms),
          ],
        ),
      ),
    );
  }

  Widget _buildUploadPlaceholder(ThemeData theme) {
    return Center(
      child: Column(
        children: [
          // ── Outer dashed-style ring ──
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.error.withValues(alpha: 0.05),
              border: Border.all(
                color: AppColors.error.withValues(alpha: 0.25),
                width: 2,
              ),
            ),
            child: Center(
              // ── Middle ring ──
              child: Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.error.withValues(alpha: 0.08),
                  border: Border.all(
                    color: AppColors.error.withValues(alpha: 0.18),
                    width: 1.5,
                  ),
                ),
                child: Center(
                  // ── Inner icon circle ──
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.error.withValues(alpha: 0.12),
                    ),
                    child: Icon(
                      Icons.local_hospital_rounded,
                      color: AppColors.error,
                      size: 48,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Upload a crop photo',
            style: theme.textTheme.titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Use camera or gallery below',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withValues(alpha: 0.5),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 400.ms)
        .scale(begin: const Offset(0.85, 0.85));
  }

  Widget _buildImagePreview(ThemeData theme) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Outer decorative ring ──
          Container(
            width: 210,
            height: 210,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.forestGreen.withValues(alpha: 0.3),
                width: 2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: ClipOval(
                child: Image.file(
                  _selectedImage!,
                  width: 198,
                  height: 198,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // ── Close / retake button ──
          Positioned(
            top: 4,
            right: 4,
            child: GestureDetector(
              onTap: _clearImage,
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close_rounded, color: Colors.white, size: 18),
              ),
            ),
          ),
        ],
      ),
    )
        .animate()
        .fadeIn(duration: 350.ms)
        .scale(begin: const Offset(0.85, 0.85));
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
    required int index,
  }) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: _isLoading ? null : onTap,
      child: AnimatedOpacity(
        opacity: _isLoading ? 0.5 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: color.withValues(alpha: 0.3)),
          ),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: _isLoading
                    ? Padding(
                        padding: const EdgeInsets.all(14),
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: color,
                        ),
                      )
                    : Icon(icon, color: color, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: color,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                color: color.withValues(alpha: 0.6),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: index * 80))
        .fadeIn(duration: 350.ms)
        .slideX(begin: 0.08);
  }

  Widget _buildTipsCard(ThemeData theme) {
    const tips = [
      'Ensure the affected leaf or area is clearly visible',
      'Capture in good natural lighting for best results',
      'Include both healthy and affected parts for comparison',
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.harvestGold.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.harvestGold.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.lightbulb_rounded,
                  color: AppColors.harvestGold, size: 18),
              const SizedBox(width: 8),
              Text(
                'Tips for better diagnosis',
                style: theme.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: AppColors.harvestGold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ...tips.map(
            (tip) => Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      width: 5,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.harvestGold,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(tip, style: theme.textTheme.bodySmall),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
