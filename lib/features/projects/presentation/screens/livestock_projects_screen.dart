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
    title: 'Goat Farming',
    icon: Icons.pets_rounded,
    color: Color(0xFF558B2F),
    image: 'assets/images/projects/Goat Farming.png',
    items: [
      (name: 'Commercial Goat Farming',  url: 'https://www.igoagritechfarms.in/projects/livestock/goat/commercial', image: 'assets/images/projects/Livestock Farming Projects/Goat Farming/Commercial Goat Farming.webp'),
      (name: 'Integrated Goat Farming',  url: 'https://www.igoagritechfarms.in/projects/livestock/goat/integrated', image: 'assets/images/projects/Livestock Farming Projects/Goat Farming/Integrated Goat Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Sheep Farming',
    icon: Icons.blur_circular_rounded,
    color: Color(0xFF6D4C41),
    image: 'assets/images/projects/Sheep Farming.png',
    items: [
      (name: 'Commercial Sheep Farming',  url: 'https://www.igoagritechfarms.in/projects/livestock/sheep/commercial', image: 'assets/images/projects/Livestock Farming Projects/Sheep Farming/Commercial Sheep Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Dairy Farming',
    icon: Icons.local_drink_rounded,
    color: Color(0xFF1565C0),
    image: 'assets/images/projects/Dairy Farming.png',
    items: [
      (name: 'Dairy Farm Setup',        url: 'https://www.igoagritechfarms.in/projects/livestock/dairy/setup', image: 'assets/images/projects/Livestock Farming Projects/Dairy Farming/Dairy Farm Setup.webp'),
      (name: 'Automated Dairy Systems', url: 'https://www.igoagritechfarms.in/projects/livestock/dairy/automated', image: 'assets/images/projects/Livestock Farming Projects/Dairy Farming/Automated Dairy Systems.webp'),
    ],
  ),
  _SubCategory(
    title: 'Poultry Farming',
    icon: Icons.egg_rounded,
    color: Color(0xFFE65100),
    image: 'assets/images/projects/Poultry Farming.png',
    items: [
      (name: 'Broiler Chicken Farms',  url: 'https://www.igoagritechfarms.in/projects/livestock/poultry/broiler', image: 'assets/images/projects/Livestock Farming Projects/Poultry Farming/Broiler Chicken Farms.webp'),
      (name: 'Layer Chicken Farms',    url: 'https://www.igoagritechfarms.in/projects/livestock/poultry/layer', image: 'assets/images/projects/Livestock Farming Projects/Poultry Farming/Layer Chicken Farms.webp'),
    ],
  ),
  _SubCategory(
    title: 'Integrated Livestock Farming',
    icon: Icons.hub_rounded,
    color: Color(0xFF37474F),
    image: 'assets/images/projects/Integrated Livestock Farming.png',
    items: [
      (name: 'Goat + Fish Farming',   url: 'https://www.igoagritechfarms.in/projects/livestock/integrated/goat-fish', image: 'assets/images/projects/Livestock Farming Projects/Integrated Livestock Farming/Goat + Fish Farming.webp'),
      (name: 'Dairy + Crop Farming',  url: 'https://www.igoagritechfarms.in/projects/livestock/integrated/dairy-crop', image: 'assets/images/projects/Livestock Farming Projects/Integrated Livestock Farming/Dairy + Crop Farming.webp'),
    ],
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class LivestockProjectsScreen extends StatelessWidget {
  const LivestockProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalItems =
        _kSubCategories.fold(0, (sum, c) => sum + c.items.length);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: const Color(0xFFE65100),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Livestock Farming Projects',
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
