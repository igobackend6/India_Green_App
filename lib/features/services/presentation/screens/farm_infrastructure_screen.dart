import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

class FarmInfrastructureScreen extends ConsumerWidget {
  const FarmInfrastructureScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Cold Storage Construction',
        icon: Icons.ac_unit_rounded,
        image: 'assets/images/services/Cold Storage Construction.jpeg',
        description:
            'Design and construction of temperature-controlled storage facilities.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/cold-storage-construction',
      ),
      (
        title: 'Packhouse Construction',
        icon: Icons.inventory_2_rounded,
        image: 'assets/images/services/Packhouse Construction.webp',
        description:
            'Modern packing, grading, and sorting facilities for farm produce.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/packhouse-construction',
      ),
      (
        title: 'Farm Building Design',
        icon: Icons.home_work_rounded,
        image: 'assets/images/services/Farm Building Design.webp',
        description:
            'Planning and building of farmhouses, staff quarters, and equipment sheds.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/farm-building-design',
      ),
      (
        title: 'Drip Irrigation Installation',
        icon: Icons.water_drop_rounded,
        image: 'assets/images/services/Drip Irrigation Installation.jpeg',
        description:
            'Water-efficient drip systems tailored for your specific crops and layout.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/drip-irrigation-installation',
      ),
      (
        title: 'Sprinkler Irrigation Systems',
        icon: Icons.shower_rounded,
        image: 'assets/images/services/Sprinkler Irrigation Systems.jpeg',
        description:
            'Overhead and micro-sprinkler systems for uniform water distribution.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/sprinkler-irrigation-systems',
      ),
      (
        title: 'Water Pump Systems',
        icon: Icons.plumbing_rounded,
        image: 'assets/images/services/Water Pump Systems.jpeg',
        description:
            'Installation of solar and electric pumps with integrated automation.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/water-pump-systems',
      ),
      (
        title: 'Land Leveling',
        icon: Icons.landscape_rounded,
        image: 'assets/images/services/Land Leveling.jpeg',
        description:
            'Laser land leveling to ensure optimal water use and field uniformity.',
        url:
            'https://www.igoagritechfarms.in/services/farm-infrastructure/land-leveling',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Farm Infrastructure'),
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
