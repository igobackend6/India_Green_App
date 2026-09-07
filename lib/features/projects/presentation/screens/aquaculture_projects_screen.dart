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
    title: 'Fish Farming Projects',
    icon: Icons.set_meal_rounded,
    color: Color(0xFF0277BD),
    image: 'assets/images/projects/Fish Farming Projects.png',
    items: [
      (name: 'Traditional Fish Farming',  url: 'https://www.igoagritechfarms.com/projects/aquaculture/fish/traditional', image: 'assets/images/projects/Aquaculture Farming Projects/Fish Farming Projects/Traditional Fish Farming.webp'),
      (name: 'Intensive Fish Farming',    url: 'https://www.igoagritechfarms.com/projects/aquaculture/fish/intensive', image: 'assets/images/projects/Aquaculture Farming Projects/Fish Farming Projects/intensive fish farming.webp'),
      (name: 'Cage Fish Farming',         url: 'https://www.igoagritechfarms.com/projects/aquaculture/fish/cage', image: 'assets/images/projects/Aquaculture Farming Projects/Fish Farming Projects/Cage Fish Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Biofloc Farming Projects',
    icon: Icons.bubble_chart_rounded,
    color: Color(0xFF00838F),
    image: 'assets/images/projects/Biofloc Farming Projects.png',
    items: [
      (name: 'Biofloc Fish Farming',    url: 'https://www.igoagritechfarms.com/projects/aquaculture/biofloc/fish', image: 'assets/images/projects/Aquaculture Farming Projects/Biofloc Farming Projects/Biofloc Fish Farming.webp'),
      (name: 'Biofloc Shrimp Farming',  url: 'https://www.igoagritechfarms.com/projects/aquaculture/biofloc/shrimp', image: 'assets/images/projects/Aquaculture Farming Projects/Biofloc Farming Projects/Biofloc Shrimp Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Shrimp Farming Projects',
    icon: Icons.water_rounded,
    color: Color(0xFF01579B),
    image: 'assets/images/projects/Shrimp Farming Projects.png',
    items: [
      (name: 'Vannamei Shrimp Farming',    url: 'https://www.igoagritechfarms.com/projects/aquaculture/shrimp/vannamei', image: 'assets/images/projects/Aquaculture Farming Projects/Shrimp Farming Projects/Vannamei Shrimp Farming.webp'),
      (name: 'Freshwater Prawn Farming',   url: 'https://www.igoagritechfarms.com/projects/aquaculture/shrimp/prawn', image: 'assets/images/projects/Aquaculture Farming Projects/Shrimp Farming Projects/Freshwater Prawn Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Crab Farming Projects',
    icon: Icons.pest_control_rounded,
    color: Color(0xFF004D40),
    image: 'assets/images/projects/Crab Farming Projects.png',
    items: [
      (name: 'Mud Crab Farming',  url: 'https://www.igoagritechfarms.com/projects/aquaculture/crab/mud-crab', image: 'assets/images/projects/Aquaculture Farming Projects/Crab Farming Projects/Mud Crab Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Integrated Aquaculture',
    icon: Icons.sync_alt_rounded,
    color: Color(0xFF006064),
    image: 'assets/images/projects/Integrated Aquaculture.png',
    items: [
      (name: 'Aquaponics Systems',              url: 'https://www.igoagritechfarms.com/projects/aquaculture/integrated/aquaponics', image: 'assets/images/projects/Aquaculture Farming Projects/Integrated Aquaculture/Aquaponics Systems.webp'),
      (name: 'Integrated Fish + Crop Farming',  url: 'https://www.igoagritechfarms.com/projects/aquaculture/integrated/fish-crop', image: 'assets/images/projects/Aquaculture Farming Projects/Integrated Aquaculture/Integrated Fish + Crop Farming.webp'),
    ],
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class AquacultureProjectsScreen extends StatelessWidget {
  const AquacultureProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalItems =
        _kSubCategories.fold(0, (sum, c) => sum + c.items.length);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: const Color(0xFF0277BD),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Aquaculture Farming Projects',
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
