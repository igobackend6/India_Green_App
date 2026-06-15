import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../l10n/app_localizations.dart';

/// Mandi Pricing screen: Live agricultural commodity prices.
class MandiScreen extends ConsumerWidget {
  const MandiScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(l10n.liveMandiPrices),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Location Selector ──
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              children: [
                const Icon(Icons.location_on_rounded, color: AppColors.harvestGold),
                const SizedBox(width: 8),
                Text(l10n.salemApmcMarket,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const Spacer(),
                Text(l10n.change,
                    style: const TextStyle(
                        color: AppColors.forestGreen,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // ── Commodities List ──
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 10,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                return _CommodityTile(arrivalLabel: l10n.arrival)
                    .animate(delay: (50 * index).ms)
                    .fadeIn()
                    .slideX(begin: 0.1);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CommodityTile extends StatelessWidget {
  final String arrivalLabel;
  const _CommodityTile({required this.arrivalLabel});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isUp = DateTime.now().millisecond % 2 == 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Crop icon
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.softGray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
                child: Text('🌾', style: TextStyle(fontSize: 24))),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Paddy (IR-8)',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text('$arrivalLabel: 120 Tons',
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: AppColors.textMuted)),
              ],
            ),
          ),

          // Price
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('₹2,450 / Qtl',
                  style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.forestGreen)),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(
                    isUp
                        ? Icons.arrow_upward_rounded
                        : Icons.arrow_downward_rounded,
                    color: isUp ? AppColors.growthGreen : AppColors.error,
                    size: 14,
                  ),
                  Text(
                    '₹50',
                    style: theme.textTheme.labelSmall?.copyWith(
                        color: isUp ? AppColors.growthGreen : AppColors.error,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
