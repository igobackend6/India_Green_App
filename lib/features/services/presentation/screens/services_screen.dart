import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../../l10n/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';

class ServicesScreen extends ConsumerWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context);

    final services = [
      (
        title: 'Farm Planning & Consulting',
        image: 'assets/images/services/Services/Farm Planning & Consulting.png',
        description: 'Expert guidance on crop selection, layout, and yield optimization.',
      ),
      (
        title: 'Farming Project Setup',
        image: 'assets/images/services/Services/Farming Project Setup.png',
        description: 'End-to-end setup of modern farms, greenhouses, and livestock units.',
      ),
      (
        title: 'Farm Infrastructure',
        image: 'assets/images/services/Services/Farm Infrastructure.webp',
        description: 'Irrigation systems, fencing, solar power, and smart farm structures.',
      ),
      (
        title: 'Maintenance & Support',
        image: 'assets/images/services/Services/Maintenance & Support.png',
        description: 'Ongoing technical support, equipment maintenance, and crop monitoring.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: Text(l10n.navServices),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: services.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final service = services[index];
          return _ServiceCard(
            title: service.title,
            description: service.description,
            image: service.image,
            onTap: () {
              if (index == 0) {
                context.go(Routes.farmPlanning);
              } else if (index == 1) {
                context.go(Routes.farmingProjectSetup);
              } else if (index == 2) {
                context.go(Routes.farmInfrastructure);
              } else if (index == 3) {
                context.go(Routes.maintenanceSupport);
              } else {
                // TODO: Navigate to other sub-projects later
              }
            },
          );
        },
      ),
    );
  }
}

class _ServiceCard extends StatefulWidget {
  final String title;
  final String description;
  final String image;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.title,
    required this.description,
    required this.image,
    required this.onTap,
  });

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
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
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isPressed ? AppColors.forestGreen : Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 10,
                offset: const Offset(0, 4),
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
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: _isPressed ? Colors.white : AppColors.forestGreen.withValues(alpha: 0.2),
                    width: 2,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    widget.image, 
                    fit: BoxFit.cover,
                  ),
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
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                Icons.arrow_forward_ios_rounded, 
                size: 16, 
                color: _isPressed ? Colors.white : AppColors.forestGreen,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
