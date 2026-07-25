import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/route_names.dart';
import 'project_subcategory_screen.dart';

// ── Data ─────────────────────────────────────────────────────────────────────

typedef _ProjectItem = ({String name, String? url, String? image});

class _SubCategory {
  final String title;
  final IconData icon;
  final Color color;
  final List<_ProjectItem> items;
  final String? image;
  const _SubCategory({
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
    this.image,
  });
}

const _kSubCategories = <_SubCategory>[
  _SubCategory(
    title: 'Farm Infrastructure Projects',
    icon: Icons.warehouse_rounded,
    color: Color(0xFF37474F),
    image: 'assets/images/projects/Farm Infrastructure Projects.jpg',
    items: [
      (name: 'Cold Storage',   url: 'https://www.igoagritechfarms.in/projects/engineering/infrastructure/cold-storage', image: 'assets/images/projects/Farm Engineering Projects/Farm Infrastructure Projects/Cold Storage.webp'),
      (name: 'Pack House',     url: 'https://www.igoagritechfarms.in/projects/engineering/infrastructure/pack-house', image: 'assets/images/projects/Farm Engineering Projects/Farm Infrastructure Projects/Pack House.webp'),
      (name: 'Farm Buildings', url: 'https://www.igoagritechfarms.in/projects/engineering/infrastructure/buildings', image: 'assets/images/projects/Farm Engineering Projects/Farm Infrastructure Projects/Farm Buildings.webp'),
      (name: 'Farm Roads',     url: 'https://www.igoagritechfarms.in/projects/engineering/infrastructure/roads', image: 'assets/images/projects/Farm Engineering Projects/Farm Infrastructure Projects/Farm Roads.webp'),
    ],
  ),
  _SubCategory(
    title: 'Water Management Projects',
    icon: Icons.water_drop_rounded,
    color: Color(0xFF0277BD),
    image: 'assets/images/projects/Water Management Projects.jpg',
    items: [
      (name: 'Rainwater Harvesting',          url: 'https://www.igoagritechfarms.in/projects/engineering/water/rainwater', image: 'assets/images/projects/Farm Engineering Projects/Water Management Projects/Rainwater Harvesting.webp'),
      (name: 'Pond Liner Installation',        url: 'https://www.igoagritechfarms.in/projects/engineering/water/pond-liner', image: 'assets/images/projects/Farm Engineering Projects/Water Management Projects/Pond Liner Installation.webp'),
      (name: 'Farm Irrigation Systems',        url: 'https://www.igoagritechfarms.in/projects/engineering/water/irrigation', image: 'assets/images/projects/Farm Engineering Projects/Water Management Projects/Farm Irrigation Systems.webp'),
      (name: 'Borewell & Water Storage Systems', url: 'https://www.igoagritechfarms.in/projects/engineering/water/borewell', image: 'assets/images/projects/Farm Engineering Projects/Water Management Projects/Borewell & Water Storage Systems.webp'),
    ],
  ),
  _SubCategory(
    title: 'Solar Agriculture Projects',
    icon: Icons.wb_sunny_rounded,
    color: Color(0xFFF57F17),
    image: 'assets/images/projects/Solar Agriculture Projects.jpeg',
    items: [
      (name: 'Solar Crop Dryer', url: 'https://www.igoagritechfarms.in/projects/engineering/solar/crop-dryer', image: 'assets/images/projects/Farm Engineering Projects/Solar Agriculture Projects/Solar Crop Dryer.webp'),
      (name: 'Solar Heater',     url: 'https://www.igoagritechfarms.in/projects/engineering/solar/heater', image: 'assets/images/projects/Farm Engineering Projects/Solar Agriculture Projects/Solar Heater.webp'),
      (name: 'Solar Fencing',    url: 'https://www.igoagritechfarms.in/projects/engineering/solar/fencing', image: 'assets/images/projects/Farm Engineering Projects/Solar Agriculture Projects/Solar Fencing.webp'),
      (name: 'Solar Lighting',   url: 'https://www.igoagritechfarms.in/projects/engineering/solar/lighting', image: 'assets/images/projects/Farm Engineering Projects/Solar Agriculture Projects/Solar Lighting.webp'),
    ],
  ),
  _SubCategory(
    title: 'Farm Development Projects',
    icon: Icons.map_rounded,
    color: Color(0xFF4E342E),
    image: 'assets/images/projects/Farm Development Projects.jpeg',
    items: [
      (name: 'Land Surveying',       url: 'https://www.igoagritechfarms.in/projects/engineering/development/surveying', image: 'assets/images/projects/Farm Engineering Projects/Farm Development Projects/Land Surveying.webp'),
      (name: 'Topographic Mapping',  url: 'https://www.igoagritechfarms.in/projects/engineering/development/topographic', image: 'assets/images/projects/Farm Engineering Projects/Farm Development Projects/Topographic Mapping.webp'),
      (name: 'Contour Mapping',      url: 'https://www.igoagritechfarms.in/projects/engineering/development/contour', image: 'assets/images/projects/Farm Engineering Projects/Farm Development Projects/Contour Mapping.webp'),
      (name: 'Land Leveling',        url: 'https://www.igoagritechfarms.in/projects/engineering/development/leveling', image: 'assets/images/projects/Farm Engineering Projects/Farm Development Projects/Land Leveling.webp'),
    ],
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class FarmEngineeringProjectsScreen extends StatelessWidget {
  const FarmEngineeringProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalItems =
        _kSubCategories.fold(0, (sum, c) => sum + c.items.length);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6A1B9A),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Farm Engineering Projects',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '${_kSubCategories.length} categories • $totalItems projects',
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: _kSubCategories.length,
        itemBuilder: (context, index) {
          final cat = _kSubCategories[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _SubCategoryCard(
              category: cat,
              index: index,
            ),
          );
        },
      ),
    );
  }
}

// ── Card widget ───────────────────────────────────────────────────────────────

class _SubCategoryCard extends StatelessWidget {
  final _SubCategory category;
  final int index;

  const _SubCategoryCard({
    required this.category,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: category.color.withValues(alpha: 0.12),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            context.push(
              Routes.projectSubCategory,
              extra: {
                'title': category.title,
                'color': category.color,
                'items': category.items.map((i) => ProjectItemData(name: i.name, url: i.url, image: i.image)).toList(),
              },
            );
          },
          child: category.image != null
              ? Stack(
                  children: [
                    Image.asset(
                      category.image!,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 110,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            category.color.withValues(alpha: 0.82),
                            category.color.withValues(alpha: 0.50),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: _buildHeaderRow(theme),
                    ),
                  ],
                )
              : Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 14),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        category.color,
                        category.color.withValues(alpha: 0.8),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: _buildHeaderRow(theme),
                ),
        ),
      ),
    )
        .animate(delay: Duration(milliseconds: index * 60))
        .fadeIn(duration: 350.ms)
        .slideY(begin: 0.1);
  }

  Widget _buildHeaderRow(ThemeData theme) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(category.icon, color: Colors.white, size: 22),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${category.items.length} projects',
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: Colors.white70),
              ),
            ],
          ),
        ),
        const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white70,
        ),
      ],
    );
  }
}
