import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

import '../../../../core/theme/app_colors.dart';

class LeafyHerbSeedsScreen extends ConsumerWidget {
  const LeafyHerbSeedsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Basil Seeds (Sweet & Thai)',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Basil seeds.webp',
        description: 'Aromatic basil seeds perfect for culinary and medicinal uses.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-basil',
      ),
      (
        title: 'Parsley Seeds (Flat & Curly)',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Parsley seeds.webp',
        description: 'High-quality seeds for flavorful and garnish-ready parsley.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-parsley',
      ),
      (
        title: 'Kale Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Kale seeds.webp',
        description: 'Nutrient-dense kale varieties for cool and temperate climates.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-kale',
      ),
      (
        title: 'Amaranth Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Amaranth seeds.webp',
        description: 'Fast-growing, vibrant amaranth seeds rich in vitamins.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-amaranth',
      ),
      (
        title: 'Fenugreek Seeds (Leafy Type)',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Fenugreek  seeds.webp',
        description: 'Specially selected seeds for producing abundant fenugreek leaves (Methi).',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-fenugreek-leafy',
      ),
      (
        title: 'Loose-Leaf Lettuce (Leafy)',
        icon: Icons.grass_rounded,
        image: null,
        description: 'Tender and crisp lettuce varieties that don\'t form tight heads.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-lettuce-leafy',
      ),
      (
        title: 'Mint Seeds (Spearmint & Peppermint)',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Mint Seeds.webp',
        description: 'Refreshing and fast-spreading mint seeds for diverse uses.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-mint',
      ),
      (
        title: 'Dill Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Dill seeds.webp',
        description: 'Aromatic dill seeds used for flavoring and garnishing.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-dill',
      ),
      (
        title: 'Arugula (Rocket) Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Arugula  seeds.webp',
        description: 'Peppery and fast-growing arugula seeds for salads.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-arugula',
      ),
      (
        title: 'Swiss Chard Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Swiss Chard seeds.webp',
        description: 'Colorful and highly nutritious Swiss chard varieties.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-swisschard',
      ),
      (
        title: 'Mustard Green Seeds',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Mustard Greens  seeds.webp',
        description: 'Spicy and fast-growing mustard green seeds for early harvests.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-mustardgreens',
      ),
      (
        title: 'Spinach Seeds (Leafy Type)',
        icon: Icons.grass_rounded,
        image: 'assets/images/products/products/Agri-farming/Leafy & Herb Seeds/Spinach  seeds.webp',
        description: 'Classic leafy spinach seeds optimized for tender, green leaves.',
        url: 'https://www.igoagritechfarms.com/products/agri-inputs/leafy-seeds/seed-spinach-leafy',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Leafy & Herb Seeds'),
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
