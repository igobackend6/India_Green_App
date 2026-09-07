import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/utils/url_launcher_helper.dart';

/// "What Drives IGO Agritech Farms" — mirrors the OUR VISION & MISSION
/// section on https://www.igoagritechfarms.com/
class VisionMissionSection extends StatelessWidget {
  const VisionMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ── Section header ──────────────────
        Center(
          child: Column(
            children: [
              Text(
                'OUR VISION & MISSION',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  color: AppColors.harvestGold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'What Drives IGO Agritech Farms',
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ── Our Vision card (dark) ──────────
        Container(
          width: double.infinity,
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: AppColors.forestGreen,
            borderRadius: AppRadius.cardRadius,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColors.harvestGold.withValues(alpha: 0.4)),
                ),
                child: Text(
                  'OUR VISION',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    color: AppColors.harvestGold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Icon(Icons.format_quote_rounded,
                  color: Colors.white.withValues(alpha: 0.25), size: 32),
              const SizedBox(height: 4),
              Text(
                "To become India's most trusted and innovative agri-tech "
                'brand, transforming every available space into sustainable '
                'and high-yield farming ecosystems.',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Container(width: 20, height: 2, color: AppColors.harvestGold),
                  const SizedBox(width: 8),
                  Text(
                    'IGO AGRITECH FARMS',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.6,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 16),

        // ── Our Mission card (light) ────────
        Container(
          width: double.infinity,
          padding: AppSpacing.cardPadding,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: AppRadius.cardRadius,
            border: Border.all(color: AppColors.forestGreen.withValues(alpha: 0.12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.softGray,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'OUR MISSION',
                  style: theme.textTheme.labelSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.6,
                    color: AppColors.textSecondary,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'To win lifetime loyal customers across pan-India by farming '
                'every square metre of fertile and non-fertile open land, '
                'indoor space, and rooftop space of buildings.',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Our mission is to generate sustainable profits and passive '
                'income for our customers through various precision farming '
                'techniques — combining high-tech engineering, professional '
                'consulting, and smart livestock ecosystems.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 14),
              GestureDetector(
                onTap: () => launchInAppWebView(
                  context,
                  'https://www.igoagritechfarms.com/about',
                  'About IGO Agritech Farms',
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Discover Our Story',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.forestGreen,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.forestGreen,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.arrow_forward_rounded,
                        size: 16, color: AppColors.forestGreen),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(delay: 320.ms).slideY(begin: 0.06);
  }
}
