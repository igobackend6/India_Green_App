import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../../l10n/app_localizations.dart';
import '../widgets/agrimart_category_card.dart';
import 'package:go_router/go_router.dart';
import '../delegates/product_search_delegate.dart';

/// AgriMart main screen: Marketplace for inputs and equipment.
class AgriMartScreen extends ConsumerWidget {
  const AgriMartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          // ── Search & Header ──
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.navMarket,
                      style: theme.textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.forestGreen)),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () async {
                      final result = await showSearch(
                        context: context,
                        delegate: ProductSearchDelegate(),
                      );
                      if (result != null && context.mounted) {
                        context.push(result.route);
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search_rounded, color: AppColors.textMuted),
                          const SizedBox(width: 12),
                          Text(
                            l10n.searchProducts,
                            style: theme.textTheme.bodyLarge?.copyWith(color: AppColors.textMuted),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ── Category Grid (Replacing Featured Products) ──
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.75,
              ),
              delegate: SliverChildListDelegate(
                [
                  AgriMartCategoryCard(
                    title: l10n.seedsCategory.replaceAll('\n', ' '),
                    subtitle: 'Seeds, Nutrition & Protection',
                    imagePath: 'assets/images/projects/Vegetable Cultivation Projects.png',
                    routePath: Routes.seeds,
                    accentColor: Colors.green,
                  ).animate(delay: 50.ms).fadeIn().slideY(begin: 0.1),
                  AgriMartCategoryCard(
                    title: l10n.polyhouseCategory.replaceAll('\n', ' '),
                    subtitle: 'Greenhouse & Structures',
                    imagePath: 'assets/images/services/Polyhouse Installation.webp',
                    routePath: Routes.polyhouse,
                    accentColor: Colors.blue,
                  ).animate(delay: 100.ms).fadeIn().slideY(begin: 0.1),
                  AgriMartCategoryCard(
                    title: l10n.horticultureCatalogCategory.replaceAll('\n', ' '),
                    subtitle: 'Exotics, Fruits & Flowers',
                    imagePath: 'assets/images/projects/Floriculture Projects.png',
                    routePath: Routes.horticultureCatalog,
                    accentColor: Colors.purple,
                  ).animate(delay: 150.ms).fadeIn().slideY(begin: 0.1),
                  AgriMartCategoryCard(
                    title: l10n.controlAutomationCategory.replaceAll('\n', ' '),
                    subtitle: 'Dosing & Automation Systems',
                    imagePath: 'assets/images/services/Equipment Maintenance.webp',
                    routePath: Routes.controlAutomation,
                    accentColor: Colors.orange,
                  ).animate(delay: 200.ms).fadeIn().slideY(begin: 0.1),
                  AgriMartCategoryCard(
                    title: l10n.digitalAgriCategory.replaceAll('\n', ' '),
                    subtitle: 'IoT Hardware & Software',
                    imagePath: 'assets/images/services/GIS Mapping.webp',
                    routePath: Routes.digitalAgri,
                    accentColor: Colors.teal,
                  ).animate(delay: 250.ms).fadeIn().slideY(begin: 0.1),
                  AgriMartCategoryCard(
                    title: l10n.postHarvestLegacyCategory.replaceAll('\n', ' '),
                    subtitle: 'Cold Chain & Ecosystems',
                    imagePath: 'assets/images/services/Cold Storage Construction.jpeg',
                    routePath: Routes.postHarvestLegacy,
                    accentColor: Colors.indigo,
                  ).animate(delay: 300.ms).fadeIn().slideY(begin: 0.1),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
