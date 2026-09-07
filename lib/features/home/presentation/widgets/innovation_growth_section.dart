import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/utils/url_launcher_helper.dart';

/// "Innovation & Profitable Growth" — mirrors the WHY CHOOSE IGO section
/// on https://www.igoagritechfarms.com/
class InnovationGrowthSection extends StatelessWidget {
  const InnovationGrowthSection({super.key});

  static const _stats = <({String value, String label})>[
    (value: '10+', label: 'Years of Experience'),
    (value: '15,000+', label: 'Successful Projects'),
    (value: '15,000+', label: 'Happy Clients'),
    (value: '2,000+', label: 'Team Members'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
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
          // ── "WHY CHOOSE IGO" tag ──────────
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'WHY CHOOSE IGO',
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 0.6,
                color: AppColors.textSecondary,
              ),
            ),
          ),

          const SizedBox(height: 10),

          Text(
            'Innovation & Profitable Growth',
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "At IGO Agritech Farms, we don't just build farms — we build "
            'profitable agricultural ecosystems designed for the future. We '
            'offer a range of innovative and sustainable agricultural '
            'solutions, including polyhouse projects, hydroponics projects, '
            'open cultivation, floriculture, goat farming, aquaculture, '
            'vertical farming, gardening, and rooftop gardens.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          // ── Stat tiles (2x2) ──────────────
          Row(
            children: [
              Expanded(child: _StatTile(stat: _stats[0])),
              const SizedBox(width: 12),
              Expanded(child: _StatTile(stat: _stats[1])),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(child: _StatTile(stat: _stats[2])),
              const SizedBox(width: 12),
              Expanded(child: _StatTile(stat: _stats[3])),
            ],
          ),

          const SizedBox(height: 16),

          // ── Learn More ────────────────────
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => launchInAppWebView(
                context,
                'https://www.igoagritechfarms.com/',
                'IGO Agritech Farms',
              ),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.textPrimary,
                side: BorderSide(color: AppColors.textPrimary.withValues(alpha: 0.3)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Learn More', style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(width: 6),
                  Icon(Icons.arrow_forward_rounded, size: 16),
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 260.ms).slideY(begin: 0.06);
  }
}

class _StatTile extends StatelessWidget {
  final ({String value, String label}) stat;
  const _StatTile({required this.stat});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.lightGreenBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            stat.value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            stat.label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
