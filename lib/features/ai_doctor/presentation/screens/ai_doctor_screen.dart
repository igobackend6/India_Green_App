import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

class AiDoctorScreen extends ConsumerStatefulWidget {
  const AiDoctorScreen({super.key});

  @override
  ConsumerState<AiDoctorScreen> createState() => _AiDoctorScreenState();
}

class _AiDoctorScreenState extends ConsumerState<AiDoctorScreen> {
  File? _capturedImage;
  bool _isAnalyzing = false;

  Future<void> _openCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (picked != null && mounted) {
      setState(() {
        _capturedImage = File(picked.path);
        _isAnalyzing = true;
      });

      // Simulate AI analysis delay (replace with real Gemini call later)
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() => _isAnalyzing = false);
      }
    }
  }

  void _reset() {
    setState(() {
      _capturedImage = null;
      _isAnalyzing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(l10n.cropDoctor),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        actions: [
          if (_capturedImage != null)
            IconButton(
              icon: const Icon(Icons.refresh_rounded),
              tooltip: 'Scan again',
              onPressed: _reset,
            ),
        ],
      ),
      body: _capturedImage == null
          ? _buildScanPrompt(context, theme, l10n)
          : _isAnalyzing
              ? _buildAnalyzing(context, theme, l10n)
              : _buildResult(context, theme, l10n),
    );
  }

  // ── Initial scan prompt ──────────────
  Widget _buildScanPrompt(BuildContext context, ThemeData theme, AppLocalizations l10n) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: AppColors.error.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.document_scanner_rounded,
                  size: 64, color: AppColors.error),
            ).animate().fadeIn(duration: 500.ms).scale(),
            const SizedBox(height: 24),
            Text(l10n.scanCropDisease,
                style: theme.textTheme.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center)
                .animate()
                .fadeIn(delay: 200.ms),
            const SizedBox(height: 16),
            Text(l10n.scanCropDiseaseDesc,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium
                    ?.copyWith(color: AppColors.textMuted))
                .animate()
                .fadeIn(delay: 300.ms),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: ElevatedButton.icon(
                onPressed: _openCamera,
                icon: const Icon(Icons.camera_alt_rounded),
                label: Text(l10n.openCamera),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.forestGreen,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final picker = ImagePicker();
                  final picked = await picker.pickImage(
                    source: ImageSource.gallery,
                    imageQuality: 85,
                  );
                  if (picked != null && mounted) {
                    setState(() {
                      _capturedImage = File(picked.path);
                      _isAnalyzing = true;
                    });
                    await Future.delayed(const Duration(seconds: 2));
                    if (mounted) setState(() => _isAnalyzing = false);
                  }
                },
                icon: const Icon(Icons.photo_library_rounded),
                label: const Text('Choose from Gallery'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppColors.forestGreen,
                  side: const BorderSide(color: AppColors.forestGreen),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
          ],
        ),
      ),
    );
  }

  // ── Analyzing state ──────────────────
  Widget _buildAnalyzing(BuildContext context, ThemeData theme, AppLocalizations l10n) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(_capturedImage!,
                width: 220, height: 220, fit: BoxFit.cover),
          ),
          const SizedBox(height: 32),
          const CircularProgressIndicator(color: AppColors.forestGreen),
          const SizedBox(height: 16),
          Text(l10n.analyzing,
              style: theme.textTheme.titleMedium
                  ?.copyWith(color: AppColors.forestGreen)),
        ],
      ),
    );
  }

  // ── Result display ───────────────────
  Widget _buildResult(BuildContext context, ThemeData theme, AppLocalizations l10n) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Captured image
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.file(_capturedImage!,
                width: double.infinity, height: 220, fit: BoxFit.cover),
          ).animate().fadeIn(),

          const SizedBox(height: 20),

          // Diagnosis card (placeholder — replace with Gemini response)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.warning.withValues(alpha: 0.4)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded,
                        color: AppColors.warning),
                    const SizedBox(width: 8),
                    Text('Diagnosis',
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                const Divider(height: 20),
                Text('Leaf Blight (Suspected)',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.error)),
                const SizedBox(height: 8),
                Text(
                  'Yellowing and browning of leaf edges detected. This may indicate early-stage bacterial leaf blight. Ensure proper drainage and avoid overhead irrigation.',
                  style: theme.textTheme.bodyMedium
                      ?.copyWith(color: AppColors.textSecondary),
                ),
                const SizedBox(height: 16),
                Text('Recommended Treatment',
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                _TreatmentRow(icon: Icons.water_drop_rounded, color: AppColors.info,
                    text: 'Apply copper-based bactericide spray'),
                _TreatmentRow(icon: Icons.agriculture_rounded, color: AppColors.growthGreen,
                    text: 'Remove and destroy infected leaves'),
                _TreatmentRow(icon: Icons.wb_sunny_rounded, color: AppColors.harvestGold,
                    text: 'Improve field drainage and air circulation'),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),

          const SizedBox(height: 16),

          // Scan again button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: _openCamera,
              icon: const Icon(Icons.camera_alt_rounded),
              label: Text(l10n.openCamera),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.forestGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ).animate().fadeIn(delay: 200.ms),
        ],
      ),
    );
  }
}

class _TreatmentRow extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _TreatmentRow(
      {required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: Theme.of(context).textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
