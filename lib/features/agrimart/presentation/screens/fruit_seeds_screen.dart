import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

import '../../../../core/theme/app_colors.dart';

class FruitSeedsScreen extends ConsumerWidget {
  const FruitSeedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Mango Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Mango seeds.webp',
        description: 'Premium seeds for growing strong and high-yielding mango trees.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-mango',
      ),
      (
        title: 'Papaya Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Papaya seeds.webp',
        description: 'High-quality hybrid papaya seeds with excellent disease resistance.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-papaya',
      ),
      (
        title: 'Guava Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Guava seeds.webp',
        description: 'Seeds for sweet, fleshy, and robust guava varieties.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-guava',
      ),
      (
        title: 'Lemon Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Lemon seeds.webp',
        description: 'Quality lemon seeds producing highly acidic, juicy fruits.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-lemon',
      ),
      (
        title: 'Pomegranate Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Pomegranate seeds.webp',
        description: 'Seeds for deep red, sweet, and drought-tolerant pomegranate plants.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-pomegranate',
      ),
      (
        title: 'Chikoo / Sapodilla Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Chikoo Sapodilla seeds.webp',
        description: 'Premium chikoo seeds for sweet and grainy fruit production.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-chikoo',
      ),
      (
        title: 'Custard Apple Seeds',
        icon: Icons.apple_rounded,
        image: 'assets/images/products/products/Agri-farming/Fruit Seeds/Custard Apple seeds.webp',
        description: 'High-yield custard apple seeds known for sweet and fleshy fruits.',
        url: 'https://www.igoagritechfarms.in/products/agri-inputs/fruit-seeds/seed-custardapple',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Fruit Seeds'),
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
