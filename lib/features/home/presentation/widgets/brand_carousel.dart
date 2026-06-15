import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/theme/app_colors.dart';

class BrandCarousel extends StatelessWidget {
  const BrandCarousel({super.key});

  static const _brands = [
    (name: 'IGO Agri Mart',  tag: 'RECOMMENDED', desc: 'Agri Inputs retail network', emoji: '🏪'),
    (name: 'Farm Gate Mandi', tag: 'POPULAR',     desc: 'Direct farmer-to-buyer network', emoji: '⚖️'),
    (name: 'IGO Nursery',    tag: '',             desc: 'Plant saplings & micro-greens', emoji: '🌱'),
    (name: 'IGO Farmlands',  tag: 'PREMIUM',     desc: 'Modern lease farming system', emoji: '🌾'),
    (name: 'IGO Fintech',    tag: '',             desc: 'Credit & loans for agriculture', emoji: '💳'),
    (name: 'Palm Cafe',      tag: '',             desc: 'Organic farm-to-table chain', emoji: '☕'),
    (name: 'IGO Academy',    tag: '',             desc: 'Agritech education & certifications', emoji: '🎓'),
    (name: 'IGO Biotech',    tag: '',             desc: 'Organic farming formulations', emoji: '🧬'),
    (name: 'IGO Exports',    tag: '',             desc: 'Global organic distribution', emoji: '🌍'),
    (name: 'IGO Logistics',  tag: '',             desc: 'Refrigerated supply chain', emoji: '🚛'),
    (name: 'Soil Sense',     tag: 'NEW',          desc: 'IoT sensors for soil analytics', emoji: '📡'),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _brands.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final brand = _brands[index];
          return Container(
            width: 160,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.softGray),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(brand.emoji, style: const TextStyle(fontSize: 22)),
                    if (brand.tag.isNotEmpty) ...[
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.harvestGold.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(brand.tag,
                            style: theme.textTheme.labelSmall?.copyWith(
                                color: AppColors.harvestGold,
                                fontWeight: FontWeight.bold,
                                fontSize: 8)),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 8),
                Text(brand.name,
                    style: theme.textTheme.titleSmall
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: 2),
                Text(brand.desc,
                    style: theme.textTheme.labelSmall
                        ?.copyWith(color: AppColors.textMuted),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
              ],
            ),
          )
              .animate(delay: (50 * index).ms)
              .fadeIn(duration: 300.ms)
              .slideX(begin: 0.1);
        },
      ),
    );
  }
}
