import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

import '../../../../core/theme/app_colors.dart';

class VegetableSeedsScreen extends ConsumerWidget {
  const VegetableSeedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Tomato Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Tomato seeds.webp',
        description: 'High-yielding hybrid and heirloom tomato varieties.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-tomato',
      ),
      (
        title: 'Cucumber Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Cucumber seeds.webp',
        description: 'Crisp, disease-resistant cucumber seeds for open and protected farming.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-cucumber',
      ),
      (
        title: 'Cabbage Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Cabbage seeds.webp',
        description: 'Premium cabbage seeds with excellent field holding capacity.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-cabbage',
      ),
      (
        title: 'Broccoli Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Broccoli seeds.webp',
        description: 'Nutrient-rich broccoli varieties for cool season farming.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-broccoli',
      ),
      (
        title: 'Radish Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Radish seeds.webp',
        description: 'Fast-growing, crisp radish seeds for all seasons.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-radish',
      ),
      (
        title: 'Onion Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Onion seeds.webp',
        description: 'High-quality onion seeds for better storage and yield.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-onion',
      ),
      (
        title: 'Pumpkin Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Pumpkin seeds.webp',
        description: 'Large, sweet pumpkin varieties with strong disease resistance.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-pumpkin',
      ),
      (
        title: 'Ridge Gourd Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Ridge Gourd seeds.webp',
        description: 'Vigorous vines producing uniform ridge gourds.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-ridgegourd',
      ),
      (
        title: 'Spinach Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Spinach seeds.webp',
        description: 'Fast-growing spinach seeds rich in iron and vitamins.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-spinach',
      ),
      (
        title: 'Coriander Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Coriander seeds.webp',
        description: 'Aromatic coriander seeds for leaf and seed production.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-coriander',
      ),
      (
        title: 'Capsicum Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Capsicum seeds.webp',
        description: 'Blocky, thick-walled bell pepper seeds in various colors.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-capsicum',
      ),
      (
        title: 'Brinjal Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Brinjal seeds.webp',
        description: 'High-yield eggplant seeds suitable for diverse climates.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-brinjal',
      ),
      (
        title: 'Cauliflower Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Cauliflower Seeds.webp',
        description: 'Dense, white curd cauliflower varieties for tropical farming.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-cauliflower',
      ),
      (
        title: 'Carrot Seeds',
        icon: Icons.eco_rounded,
        image: null,
        description: 'Sweet, bright orange carrot seeds for uniform harvesting.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-carrot',
      ),
      (
        title: 'Beetroot Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Beetroot seeds.webp',
        description: 'Deep red, round beetroot varieties with sweet flavor.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-beetroot',
      ),
      (
        title: 'Peas Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Peas seeds.webp',
        description: 'Sweet, plump green pea seeds for fresh market and processing.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-peas',
      ),
      (
        title: 'Bitter Gourd Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Bitter Gourd seeds.webp',
        description: 'Dark green, spiny bitter gourd varieties with excellent yield.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-bittergourd',
      ),
      (
        title: 'Bottle Gourd Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Bottle gourd seeds.webp',
        description: 'Long and round bottle gourd seeds with vigorous growth.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-bottlegourd',
      ),
      (
        title: 'Lettuce Seeds',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Lettuce seeds.webp',
        description: 'Crisp iceberg and leafy lettuce varieties for hydroponics and soil.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-lettuce',
      ),
      (
        title: 'Methi Seeds (Fenugreek)',
        icon: Icons.eco_rounded,
        image: 'assets/images/products/products/Agri-farming/Vegetable Seeds/Methi seeds.webp',
        description: 'Fast-growing fenugreek seeds for leaf and spice production.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/veg-seeds/seed-methi',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Vegetable Seeds'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: subProjects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final project = subProjects[index];
          return _SeedItemCard(
            title: project.title,
            description: project.description,
            icon: project.icon,
            image: project.image,
            onTap: () => launchInAppWebView(context, project.url, project.title),
          );
        },
      ),
    );
  }
}

class _SeedItemCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String? image;
  final VoidCallback onTap;

  const _SeedItemCard({
    required this.title,
    required this.description,
    required this.icon,
    this.image,
    required this.onTap,
  });

  @override
  State<_SeedItemCard> createState() => _SeedItemCardState();
}

class _SeedItemCardState extends State<_SeedItemCard> {
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
          decoration: BoxDecoration(
            color: _isPressed ? AppColors.forestGreen : Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.07),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
            border: Border.all(
              color: _isPressed 
                  ? AppColors.forestGreen 
                  : AppColors.forestGreen.withValues(alpha: 0.12),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (widget.image != null)
                  Stack(
                    children: [
                      Image.asset(
                        widget.image!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => Container(
                          height: 160,
                          color: AppColors.forestGreen.withValues(alpha: 0.15),
                          child: Center(
                            child: Icon(widget.icon,
                                size: 48,
                                color: AppColors.forestGreen
                                    .withValues(alpha: 0.4)),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: 60,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                (_isPressed
                                        ? AppColors.forestGreen
                                        : Colors.white)
                                    .withValues(alpha: 0.9),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: _isPressed 
                              ? Colors.white.withValues(alpha: 0.2) 
                              : AppColors.forestGreen.withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          widget.icon, 
                          color: _isPressed ? Colors.white : AppColors.forestGreen, 
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _isPressed ? Colors.white : AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 3),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
