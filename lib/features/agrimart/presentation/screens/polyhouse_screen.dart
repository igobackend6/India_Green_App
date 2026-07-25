import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/theme/app_colors.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/route_names.dart';

class PolyhouseScreen extends ConsumerWidget {
  const PolyhouseScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final polyhouseCategories = [
      (
        title: 'Structural Frames & Parts',
        icon: Icons.construction_rounded,
        description: 'Pipes, joints, and foundational components.',
      ),
      (
        title: 'Greenhouse Covering',
        icon: Icons.roofing_rounded,
        description: 'Poly films and protective roof coverings.',
      ),
      (
        title: 'Insect & Shade Nets',
        icon: Icons.grid_4x4_rounded,
        description: 'Nets for light control and insect protection.',
      ),
      (
        title: 'Climate & Ventilation',
        icon: Icons.air_rounded,
        description: 'Exhaust fans, cooling pads, and sensors.',
      ),
      (
        title: 'Misting & Fogging',
        icon: Icons.water_drop_rounded,
        description: 'Foggers and misters for humidity control.',
      ),
      (
        title: 'Plumbing & Distribution',
        icon: Icons.water_rounded,
        description: 'Pipes, valves, and water distribution parts.',
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Polyhouse Structure'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: polyhouseCategories.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final category = polyhouseCategories[index];
          return _PolyhouseCategoryCard(
            title: category.title,
            description: category.description,
            icon: category.icon,
            onTap: () {
              if (index == 0) {
                context.go(Routes.polyhouseStructuralFrames);
              } else if (index == 1) {
                context.go(Routes.polyhouseGreenhouseCovering);
              } else if (index == 2) {
                context.go(Routes.polyhouseInsectShadeNets);
              } else if (index == 3) {
                context.go(Routes.polyhouseClimateVentilation);
              } else if (index == 4) {
                context.go(Routes.polyhouseMistingFogging);
              } else if (index == 5) {
                context.go(Routes.polyhousePlumbingDistribution);
              }
            },
          );
        },
      ),
    );
  }
}

class _PolyhouseCategoryCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _PolyhouseCategoryCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  State<_PolyhouseCategoryCard> createState() => _PolyhouseCategoryCardState();
}

class _PolyhouseCategoryCardState extends State<_PolyhouseCategoryCard> {
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
