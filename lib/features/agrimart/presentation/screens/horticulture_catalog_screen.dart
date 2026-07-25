import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';

class HorticultureCatalogScreen extends ConsumerWidget {
  const HorticultureCatalogScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final categories = [
      (
        title: 'Vegetable Crops',
        icon: Icons.eco_rounded,
        description: 'Explore our catalog of hybrid and high-yielding vegetable crop varieties.',
      ),
      (
        title: 'Flower Crops',
        icon: Icons.local_florist_rounded,
        description: 'Premium commercial flower crop varieties for open and protected cultivation.',
      ),
      (
        title: 'Exotic Fruit Crops',
        icon: Icons.apple_rounded,
        description: 'High-value exotic fruit crops suited for modern agricultural practices.',
      ),
      (
        title: 'Medicinal & Herbs',
        icon: Icons.spa_rounded,
        description: 'Valuable medicinal plants, aromatic herbs, and traditional therapeutic crops.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Horticulture Catalog'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: categories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final category = categories[index];
          return _CategoryCard(
            title: category.title,
            description: category.description,
            icon: category.icon,
            onTap: () {
              if (index == 0) {
                context.go(Routes.vegetableCrops);
              } else if (index == 1) {
                context.go(Routes.flowerCrops);
              } else if (index == 2) {
                context.go(Routes.exoticFruitCrops);
              } else if (index == 3) {
                context.go(Routes.medicinalHerbs);
              }
            },
          );
        },
      ),
    );
  }
}

class _CategoryCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<_CategoryCard> {
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
