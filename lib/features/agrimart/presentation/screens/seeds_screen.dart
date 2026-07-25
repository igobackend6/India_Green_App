import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';

class SeedsScreen extends ConsumerWidget {
  const SeedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final seedCategories = [
      (
        title: 'Vegetable Seeds',
        icon: Icons.eco_rounded,
        description: 'High-yield hybrid and open-pollinated vegetable seeds.',
      ),
      (
        title: 'Fruit Seeds',
        icon: Icons.apple_rounded,
        description: 'Premium quality seeds for various fruit-bearing plants.',
      ),
      (
        title: 'Leafy & Herb Seeds',
        icon: Icons.grass_rounded,
        description: 'Nutrient-rich leafy greens and aromatic herb seeds.',
      ),
      (
        title: 'Growing Media & Substrates',
        icon: Icons.layers_rounded,
        description: 'Coco peat, perlite, vermiculite, and specialized potting mixes.',
      ),
      (
        title: 'Plant Nutrition & Fertilizers',
        icon: Icons.science_rounded,
        description: 'Organic fertilizers, micronutrients, and growth promoters.',
      ),
      (
        title: 'Plant Protection (IPM)',
        icon: Icons.security_rounded,
        description: 'Bio-pesticides, traps, and integrated pest management solutions.',
      ),
      (
        title: 'Plant Growth Regulators',
        icon: Icons.auto_graph_rounded,
        description: 'Hormones and stimulants for enhanced plant growth and yield.',
      ),
      (
        title: 'Mulching & Weed Control',
        icon: Icons.layers_clear_rounded,
        description: 'Mulch films and weed mats for moisture retention and weed management.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Agri Farming Inputs'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: seedCategories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final category = seedCategories[index];
          return _SeedCategoryCard(
            title: category.title,
            description: category.description,
            icon: category.icon,
            onTap: () {
              if (index == 0) {
                context.go(Routes.vegetableSeeds);
              } else if (index == 1) {
                context.go(Routes.fruitSeeds);
              } else if (index == 2) {
                context.go(Routes.leafyHerbSeeds);
              } else if (index == 3) {
                context.go(Routes.growingMedia);
              } else if (index == 4) {
                context.go(Routes.plantNutrition);
              } else if (index == 5) {
                context.go(Routes.plantProtection);
              } else if (index == 6) {
                context.go(Routes.plantGrowthRegulators);
              } else if (index == 7) {
                context.go(Routes.mulchingWeedControl);
              } else {
                // TODO: Navigate to other seed types
              }
            },
          );
        },
      ),
    );
  }
}

class _SeedCategoryCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _SeedCategoryCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_SeedCategoryCard> createState() => _SeedCategoryCardState();
}

class _SeedCategoryCardState extends State<_SeedCategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Listener(
      onPointerDown: (_) => setState(() => _isPressed = true),
      onPointerUp: (_) => setState(() => _isPressed = false),
      onPointerCancel: (_) => setState(() => _isPressed = false),
      child: GestureDetector(
        onTap: widget.onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: _isPressed ? AppColors.forestGreen : Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 8,
                offset: const Offset(0, 3),
              ),
            ],
            border: Border.all(
              color: _isPressed 
                  ? AppColors.forestGreen 
                  : AppColors.forestGreen.withValues(alpha: 0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: _isPressed 
                      ? Colors.white.withValues(alpha: 0.2) 
                      : AppColors.forestGreen.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  widget.icon, 
                  color: _isPressed ? Colors.white : AppColors.forestGreen, 
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: _isPressed ? Colors.white : AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.description,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: _isPressed ? Colors.white70 : AppColors.textMuted,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded, 
                size: 14, 
                color: _isPressed ? Colors.white : AppColors.forestGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
