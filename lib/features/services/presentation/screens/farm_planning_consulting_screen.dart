import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import 'package:india_green_app/core/utils/url_launcher_helper.dart';

class FarmPlanningConsultingScreen extends ConsumerWidget {
  const FarmPlanningConsultingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subProjects = [
      (
        title: 'Farm Business Planning',
        icon: Icons.business_center_rounded,
        image: 'assets/images/services/Farm Business Planning.webp',
        description:
            'Comprehensive financial and operational planning for your agribusiness.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/farm-business-planning',
      ),
      (
        title: 'Agri Investment Consulting',
        icon: Icons.trending_up_rounded,
        image: 'assets/images/services/Agri Investment Consulting.webp',
        description:
            'Strategic advice on farmland investments and portfolio management.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/agri-investment-consulting',
      ),
      (
        title: 'Crop Selection',
        icon: Icons.grass_rounded,
        image: 'assets/images/services/Crop Selection Consulting.webp',
        description:
            'Data-driven crop recommendations based on soil, climate, and market trends.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/crop-selection-consulting',
      ),
      (
        title: 'Farm Layout Design',
        icon: Icons.map_rounded,
        image: 'assets/images/services/Farm Layout Design.webp',
        description:
            'Optimized spatial planning for fields, irrigation, and farm structures.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/farm-layout-design',
      ),
      (
        title: 'Aquaculture Consulting',
        icon: Icons.water_rounded,
        image: 'assets/images/services/Aquaculture Consulting.webp',
        description:
            'Expert guidance on setting up and managing profitable fish farms.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/aquaculture-consulting',
      ),
      (
        title: 'Land Surveying',
        icon: Icons.landscape_rounded,
        image: 'assets/images/services/Land Surveying.webp',
        description:
            'Accurate topographic and boundary surveys for farm development.',
        url:
            'https://www.igoagritechfarms.com/services/farm-planning/land-surveying',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Farm Planning & Consulting'),
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
                // ── Image header ──
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
                      // Gradient fade at bottom
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
                                (_isPressed ? AppColors.forestGreen : Colors.white)
                                    .withValues(alpha: 0.9),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                // ── Content row ──
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
