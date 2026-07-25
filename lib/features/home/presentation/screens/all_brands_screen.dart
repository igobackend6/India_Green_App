import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';

class AllBrandsScreen extends ConsumerWidget {
  const AllBrandsScreen({super.key});

  static const _brands = [
    (name: 'IGO Agri Mart',   tag: 'RECOMMENDED', desc: 'Agri Inputs retail network',          emoji: '🏪'),
    (name: 'Farm Gate Mandi', tag: 'POPULAR',      desc: 'Direct farmer-to-buyer network',      emoji: '⚖️'),
    (name: 'IGO Nursery',     tag: '',             desc: 'Plant saplings & micro-greens',        emoji: '🌱'),
    (name: 'IGO Farmlands',   tag: 'PREMIUM',      desc: 'Modern lease farming system',          emoji: '🌾'),
    (name: 'IGO Fintech',     tag: '',             desc: 'Credit & loans for agriculture',       emoji: '💳'),
    (name: 'Palm Cafe',       tag: '',             desc: 'Organic farm-to-table chain',           emoji: '☕'),
    (name: 'IGO Academy',     tag: '',             desc: 'Agritech education & certifications',  emoji: '🎓'),
    (name: 'IGO Biotech',     tag: '',             desc: 'Organic farming formulations',         emoji: '🧬'),
    (name: 'IGO Exports',     tag: '',             desc: 'Global organic distribution',          emoji: '🌍'),
    (name: 'IGO Logistics',   tag: '',             desc: 'Refrigerated supply chain',            emoji: '🚛'),
    (name: 'Soil Sense',      tag: 'NEW',          desc: 'IoT sensors for soil analytics',       emoji: '📡'),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.igoBrands),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.85,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: _brands.length,
        itemBuilder: (context, index) {
          final brand = _brands[index];
          return GestureDetector(
            onTap: () async {
              if (brand.name == 'IGO Agri Mart') {
                final url = Uri.parse('https://igoagri-mart-website.vercel.app/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                }
              } else if (brand.name == 'Farm Gate Mandi') {
                final url = Uri.parse('https://farmgatemandi.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                }
              } else if (brand.name == 'IGO Nursery') {
                final url = Uri.parse('https://igonursery.com/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                }
              } else if (brand.name == 'Palm Cafe') {
                final url = Uri.parse('https://palmcafe-landingpage.vercel.app/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                }
              } else if (brand.name == 'IGO Academy') {
                final url = Uri.parse('https://igoacademy.in/');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url, mode: LaunchMode.inAppWebView);
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: theme.colorScheme.surface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.softGray,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(brand.emoji, style: const TextStyle(fontSize: 28)),
                      if (brand.tag.isNotEmpty) ...[
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.harvestGold.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            brand.tag,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: AppColors.harvestGold,
                              fontWeight: FontWeight.bold,
                              fontSize: 8,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    brand.name,
                    style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    brand.desc,
                    style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
