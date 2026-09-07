import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

class FarmingProjectSetupScreen extends ConsumerWidget {
  const FarmingProjectSetupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Polyhouse Installation',
        icon: Icons.house_siding_rounded,
        image: 'assets/images/services/Polyhouse Installation.webp',
        description:
            'Complete setup of climate-controlled polyhouses for high-yield farming.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/polyhouse-installation',
      ),
      (
        title: 'Hydroponic Setup',
        icon: Icons.water_drop_rounded,
        image: 'assets/images/services/Hydroponic Setup.webp',
        description:
            'Advanced soil-less farming systems for urban and commercial spaces.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/hydroponic-setup',
      ),
      (
        title: 'Vertical Farming Setup',
        icon: Icons.align_vertical_bottom_rounded,
        image: 'assets/images/services/Vertical Farming Setup.webp',
        description:
            'Space-efficient multi-level farming structures for maximum yield.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/vertical-farming-setup',
      ),
      (
        title: 'Fish Farming Setup',
        icon: Icons.phishing_rounded,
        image: 'assets/images/services/Fish Farming Setup.webp',
        description:
            'Commercial fish farming ponds and tank installations.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/fish-farming-setup',
      ),
      (
        title: 'Biofloc Installation',
        icon: Icons.science_rounded,
        image: 'assets/images/services/Biofloc Installation.webp',
        description:
            'High-density indoor fish farming systems with zero water exchange.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/biofloc-installation',
      ),
      (
        title: 'Aquaculture Pond Construction',
        icon: Icons.waves_rounded,
        image: 'assets/images/services/Pond Construction.webp',
        description:
            'Excavation and lining of large-scale aquaculture ponds.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/aquaculture-pond-construction',
      ),
      (
        title: 'Aquaponics Setup',
        icon: Icons.eco_rounded,
        image: 'assets/images/services/Aquaponics Setup.webp',
        description:
            'Integrated systems combining fish farming with hydroponic plants.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/aquaponics-setup',
      ),
      (
        title: 'Goat Farm Setup',
        icon: Icons.pets_rounded,
        image: 'assets/images/services/Goat Farm Setup.webp',
        description:
            'Sheds, feeding systems, and fencing for commercial goat farming.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/goat-farm-setup',
      ),
      (
        title: 'Dairy Farm Setup',
        icon: Icons.local_drink_rounded,
        image: 'assets/images/services/Dairy Farm Setup.webp',
        description:
            'Modern dairy cattle housing and automated milking setups.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/dairy-farm-setup',
      ),
      (
        title: 'Sheep Farm Setup',
        icon: Icons.grass_rounded,
        image: 'assets/images/services/Sheep Farm Setup.webp',
        description:
            'Optimized grazing layouts and enclosures for sheep farming.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/sheep-farm-setup',
      ),
      (
        title: 'Poultry Farm Setup',
        icon: Icons.egg_rounded,
        image: 'assets/images/services/Poultry Farm Setup.webp',
        description:
            'Climate-controlled poultry sheds for layers and broilers.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/poultry-farm-setup',
      ),
      (
        title: 'GIS Mapping',
        icon: Icons.map_rounded,
        image: 'assets/images/services/GIS Mapping.webp',
        description:
            'Satellite and drone-based spatial mapping for large farms.',
        url:
            'https://www.igoagritechfarms.com/services/farming-project-setup/gis-mapping',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Farming Project Setup'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: subProjects.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final p = subProjects[index];
          return _SubProjectCard(
            title: p.title,
            description: p.description,
            icon: p.icon,
            image: p.image,
            onTap: () => launchInAppWebView(context, p.url, p.title),
          );
        },
      ),
    );
  }
}

// ── Card ──────────────────────────────────────────────────────────────────────

class _SubProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String? image;
  final VoidCallback onTap;

  const _SubProjectCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
    this.image,
  });

  @override
  State<_SubProjectCard> createState() => _SubProjectCardState();
}

class _SubProjectCardState extends State<_SubProjectCard> {
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
                          color: _isPressed
                              ? Colors.white
                              : AppColors.forestGreen,
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
                                color: _isPressed
                                    ? Colors.white
                                    : AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              widget.description,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: _isPressed
                                    ? Colors.white70
                                    : AppColors.textMuted,
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
                        color: _isPressed
                            ? Colors.white
                            : AppColors.forestGreen,
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
