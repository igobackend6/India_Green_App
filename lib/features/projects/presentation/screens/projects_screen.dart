import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_spacing.dart';
import '../../../../../core/router/route_names.dart';
import '../../../../../l10n/app_localizations.dart';

/// Projects hub — shows the four project category cards.
class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n  = AppLocalizations.of(context);

    final categories = [
      _ProjectCategory(
        title: l10n.agriFarmingProjects,
        subtitle: 'Crops, orchards & greenhouse farming',
        icon: Icons.grass_rounded,
        color: const Color(0xFF2E7D32),
        gradientEnd: const Color(0xFF1B5E20),
        route: Routes.agriProjects,
      ),
      _ProjectCategory(
        title: l10n.aquacultureProjects,
        subtitle: 'Fish, shrimp & aquatic farming',
        icon: Icons.water_rounded,
        color: const Color(0xFF0277BD),
        gradientEnd: const Color(0xFF01579B),
        route: Routes.aquacultureProjects,
      ),
      _ProjectCategory(
        title: l10n.livestockFarmingProjects,
        subtitle: 'Cattle, poultry & dairy farming',
        icon: Icons.pets_rounded,
        color: const Color(0xFFE65100),
        gradientEnd: const Color(0xFFBF360C),
        route: Routes.livestockProjects,
      ),
      _ProjectCategory(
        title: l10n.farmEngineeringProjects,
        subtitle: 'Irrigation, machinery & infrastructure',
        icon: Icons.engineering_rounded,
        color: const Color(0xFF6A1B9A),
        gradientEnd: const Color(0xFF4A148C),
        route: Routes.farmEngineeringProjects,
      ),
    ];

    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),

          // Header
          Text(
            l10n.projectsTitle,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.forestGreen,
            ),
          ).animate().fadeIn(duration: 400.ms),

          const SizedBox(height: 4),

          Text(
            'Select a category to explore projects',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: AppColors.textMuted,
            ),
          ).animate().fadeIn(delay: 100.ms),

          const SizedBox(height: 20),

          // Category cards
          ...categories.asMap().entries.map((entry) {
            final i    = entry.key;
            final cat  = entry.value;
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _ProjectCategoryCard(category: cat)
                  .animate()
                  .fadeIn(delay: Duration(milliseconds: 150 + i * 80))
                  .slideY(begin: 0.15),
            );
          }),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

// ── Data model ──────────────────────────────────────────────────────────────

class _ProjectCategory {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final Color gradientEnd;
  final String? route;

  const _ProjectCategory({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.gradientEnd,
    required this.route,
  });
}

// ── Category card widget ─────────────────────────────────────────────────────

class _ProjectCategoryCard extends StatelessWidget {
  final _ProjectCategory category;
  const _ProjectCategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 3,
      shadowColor: category.color.withValues(alpha: 0.3),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          if (category.route != null) {
            context.go(category.route!);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${category.title} — coming soon'),
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [category.color, category.gradientEnd],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              // Icon circle
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(category.icon, color: Colors.white, size: 32),
              ),

              const SizedBox(width: 20),

              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      category.subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),

              // Arrow
              const Icon(Icons.arrow_forward_ios_rounded,
                  color: Colors.white54, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}
