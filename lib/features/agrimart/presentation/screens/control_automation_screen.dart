import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';

class ControlAutomationScreen extends ConsumerWidget {
  const ControlAutomationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = [
      (
        title: 'Dosing & Fertigation',
        icon: Icons.science_rounded,
        description: 'Automated nutrient dosing and fertigation control systems.',
      ),
      (
        title: 'Environmental Controllers',
        icon: Icons.thermostat_rounded,
        description: 'Smart controllers for temperature, humidity, and climate.',
      ),
      (
        title: 'Smart Actuators & Motors',
        icon: Icons.settings_input_component_rounded,
        description: 'Precision actuators and motors for automated operations.',
      ),
      (
        title: 'Electrical Systems',
        icon: Icons.electrical_services_rounded,
        description: 'Power distribution, wiring, and electrical components.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Control & Automation'),
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
                context.go(Routes.dosingFertigation);
              } else if (index == 1) {
                context.go(Routes.environmentalControllers);
              } else if (index == 2) {
                context.go(Routes.smartActuatorsMotors);
              } else if (index == 3) {
                context.go(Routes.electricalSystems);
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
