import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/router/route_names.dart';
import '../../../../../core/theme/app_colors.dart';
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

const _kAgriSubCategories = <_SubCategory>[
  _SubCategory(
    title: 'Protected Farming Projects',
    icon: Icons.home_work_rounded,
    color: Color(0xFF2E7D32),
    image: 'assets/images/projects/Protected Farming Projects.png',
    items: [
      (name: 'Naturally Ventilated Polyhouse',  url: 'https://www.igoagritechfarms.com/projects/agri/protected/naturally-ventilated', image: 'assets/images/projects/Agri Farming Projects/Protected Farming Projects/Naturally Ventilated Polyuhouse.webp'),
      (name: 'Climate Controlled Polyhouse',    url: 'https://www.igoagritechfarms.com/projects/agri/protected/climate-controlled', image: 'assets/images/projects/Agri Farming Projects/Protected Farming Projects/climate controlled polyhouse.webp'),
      (name: 'Polycarbonate Greenhouse',        url: 'https://www.igoagritechfarms.com/projects/agri/protected/polycarbonate', image: 'assets/images/projects/Agri Farming Projects/Protected Farming Projects/polycarboate green house.webp'),
      (name: 'Shade Net House',                 url: 'https://www.igoagritechfarms.com/projects/agri/protected/shade-net', image: 'assets/images/projects/Agri Farming Projects/Protected Farming Projects/shade net new.webp'),
      (name: 'Mist Chamber',                    url: 'https://www.igoagritechfarms.com/projects/agri/protected/mist-chamber', image: 'assets/images/projects/Agri Farming Projects/Protected Farming Projects/mist chamber.webp'),
    ],
  ),
  _SubCategory(
    title: 'Hydroponic Farming Projects',
    icon: Icons.water_drop_rounded,
    color: Color(0xFF0277BD),
    image: 'assets/images/projects/Hydroponic Farming Projects.png',
    items: [
      (name: 'NFT Hydroponic System',        url: 'https://www.igoagritechfarms.com/projects/agri/hydroponic/nft', image: null),
      (name: 'Deep Water Culture System',    url: 'https://www.igoagritechfarms.com/projects/agri/hydroponic/dwc', image: null),
      (name: 'Vertical Hydroponic Towers',   url: 'https://www.igoagritechfarms.com/projects/agri/hydroponic/towers', image: null),
      (name: 'Commercial Hydroponic Farms',  url: 'https://www.igoagritechfarms.com/projects/agri/hydroponic/commercial', image: null),
      (name: 'Indoor Hydroponic Units',      url: 'https://www.igoagritechfarms.com/projects/agri/hydroponic/indoor', image: null),
    ],
  ),
  _SubCategory(
    title: 'Vertical Farming Projects',
    icon: Icons.layers_rounded,
    color: Color(0xFF00695C),
    image: 'assets/images/projects/Vertical Farming Projects.png',
    items: [
      (name: 'Indoor Vertical Farms',                url: 'https://www.igoagritechfarms.com/projects/agri/vertical/indoor', image: 'assets/images/projects/Agri Farming Projects/Vertical Farming Projects/Indoor Vertical Farms.webp'),
      (name: 'Commercial Vertical Farming Units',    url: 'https://www.igoagritechfarms.com/projects/agri/vertical/commercial', image: 'assets/images/projects/Agri Farming Projects/Vertical Farming Projects/Commercial Vertical Farming Units.webp'),
      (name: 'Smart Grow Room Systems',              url: 'https://www.igoagritechfarms.com/projects/agri/vertical/smart-grow', image: 'assets/images/projects/Agri Farming Projects/Vertical Farming Projects/Smart Grow Room Systems.webp'),
    ],
  ),
  _SubCategory(
    title: 'Open Field Cultivation Projects',
    icon: Icons.landscape_rounded,
    color: Color(0xFF558B2F),
    image: 'assets/images/projects/Open Field Cultivation Projects.png',
    items: [
      (name: 'Dragon Fruit Plantation',  url: 'https://www.igoagritechfarms.com/projects/agri/open-field/dragon-fruit', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Dragon Fruit Plantation.webp'),
      (name: 'Guava Plantation',         url: 'https://www.igoagritechfarms.com/projects/agri/open-field/guava', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Guava Plantation.webp'),
      (name: 'Mango Plantation',         url: 'https://www.igoagritechfarms.com/projects/agri/open-field/mango', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Mango plantation.webp'),
      (name: 'Papaya Plantation',        url: 'https://www.igoagritechfarms.com/projects/agri/open-field/papaya', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Papaya Plantation.webp'),
      (name: 'Fig Plantation',           url: 'https://www.igoagritechfarms.com/projects/agri/open-field/fig', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Fig Plantation.webp'),
      (name: 'Blueberry Plantation',     url: 'https://www.igoagritechfarms.com/projects/agri/open-field/blueberry', image: 'assets/images/projects/Agri Farming Projects/Open Field Cultivation Projects/Blueberry Plantation.webp'),
    ],
  ),
  _SubCategory(
    title: 'Vegetable Cultivation Projects',
    icon: Icons.eco_rounded,
    color: Color(0xFF388E3C),
    image: 'assets/images/projects/Vegetable Cultivation Projects.png',
    items: [
      (name: 'Cucumber Farming',    url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/cucumber', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/cucumber farming.webp'),
      (name: 'Capsicum Farming',    url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/capsicum', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/Capsicum Farming.webp'),
      (name: 'Tomato Farming',      url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/tomato', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/Tomato Farming.webp'),
      (name: 'Chilli Farming',      url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/chilli', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/Chilli Farming.webp'),
      (name: 'Muskmelon Farming',   url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/muskmelon', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/Muskmelon Farming.webp'),
      (name: 'Watermelon Farming',  url: 'https://www.igoagritechfarms.com/projects/agri/vegetable/watermelon', image: 'assets/images/projects/Agri Farming Projects/Vegetable Cultivation Projects/Watermelon Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Medicinal Crop Projects',
    icon: Icons.local_pharmacy_rounded,
    color: Color(0xFF6A1B9A),
    image: 'assets/images/projects/Medicinal Crop Projects.png',
    items: [
      (name: 'Aloe Vera Farming',    url: 'https://www.igoagritechfarms.com/projects/agri/medicinal/aloe-vera', image: 'assets/images/projects/Agri Farming Projects/Medicinal Crop Projects/Aloe Vera Farming.webp'),
      (name: 'Moringa Plantation',   url: 'https://www.igoagritechfarms.com/projects/agri/medicinal/moringa', image: 'assets/images/projects/Agri Farming Projects/Medicinal Crop Projects/Moringa Plantation.webp'),
      (name: 'Ginger Farming',       url: 'https://www.igoagritechfarms.com/projects/agri/medicinal/ginger', image: 'assets/images/projects/Agri Farming Projects/Medicinal Crop Projects/Ginger Farming.webp'),
      (name: 'Turmeric Farming',     url: 'https://www.igoagritechfarms.com/projects/agri/medicinal/turmeric', image: 'assets/images/projects/Agri Farming Projects/Medicinal Crop Projects/Turmeric Farming.webp'),
      (name: 'Tapioca Cultivation',  url: 'https://www.igoagritechfarms.com/projects/agri/medicinal/tapioca', image: 'assets/images/projects/Agri Farming Projects/Medicinal Crop Projects/Tapioca Cultivation.webp'),
    ],
  ),
  _SubCategory(
    title: 'Floriculture Projects',
    icon: Icons.local_florist_rounded,
    color: Color(0xFFAD1457),
    image: 'assets/images/projects/Floriculture Projects.png',
    items: [
      (name: 'Rose Farming',          url: 'https://www.igoagritechfarms.com/projects/agri/floriculture/rose', image: 'assets/images/projects/Agri Farming Projects/Floriculture Projects/Rose Farming.webp'),
      (name: 'Jasmine Farming',       url: 'https://www.igoagritechfarms.com/projects/agri/floriculture/jasmine', image: 'assets/images/projects/Agri Farming Projects/Floriculture Projects/Jasmine Farming.webp'),
      (name: 'Marigold Farming',      url: 'https://www.igoagritechfarms.com/projects/agri/floriculture/marigold', image: 'assets/images/projects/Agri Farming Projects/Floriculture Projects/Marigold Farming.webp'),
      (name: 'Exotic Flower Farming', url: 'https://www.igoagritechfarms.com/projects/agri/floriculture/exotic', image: 'assets/images/projects/Agri Farming Projects/Floriculture Projects/Exotic Flower Farming.webp'),
    ],
  ),
  _SubCategory(
    title: 'Mushroom Farming Projects',
    icon: Icons.spa_rounded,
    color: Color(0xFF4E342E),
    image: 'assets/images/projects/Mushroom Farming Projects.jpg',
    items: [
      (name: 'Oyster Mushroom Units',      url: 'https://www.igoagritechfarms.com/projects/agri/mushroom/oyster', image: 'assets/images/projects/Agri Farming Projects/Mushroom Farming Projects/Oyster Mushroom Units.webp'),
      (name: 'Button Mushroom Units',      url: 'https://www.igoagritechfarms.com/projects/agri/mushroom/button', image: 'assets/images/projects/Agri Farming Projects/Mushroom Farming Projects/Button Mushroom Units.webp'),
      (name: 'Commercial Mushroom Farms',  url: 'https://www.igoagritechfarms.com/projects/agri/mushroom/commercial', image: 'assets/images/projects/Agri Farming Projects/Mushroom Farming Projects/Commercial Mushroom Farms.webp'),
    ],
  ),
  _SubCategory(
    title: 'Urban Farming Projects',
    icon: Icons.apartment_rounded,
    color: Color(0xFF37474F),
    image: 'assets/images/projects/Urban Farming Projects.jpg',
    items: [
      (name: 'Rooftop Gardening Projects',    url: 'https://www.igoagritechfarms.com/projects/agri/urban/rooftop', image: 'assets/images/projects/Agri Farming Projects/Urban Farming Projects/Rooftop Gardening Projects.webp'),
      (name: 'Terrace Farming Projects',      url: 'https://www.igoagritechfarms.com/projects/agri/urban/terrace', image: 'assets/images/projects/Agri Farming Projects/Urban Farming Projects/Terrace Farming Projects.webp'),
      (name: 'Kitchen Garden Projects',       url: 'https://www.igoagritechfarms.com/projects/agri/urban/kitchen', image: 'assets/images/projects/Agri Farming Projects/Urban Farming Projects/Kitchen Garden Projects.webp'),
      (name: 'Microgreens Production Units',  url: 'https://www.igoagritechfarms.com/projects/agri/urban/microgreens', image: 'assets/images/projects/Agri Farming Projects/Urban Farming Projects/Microgreens Production Units.webp'),
    ],
  ),
  _SubCategory(
    title: 'Nursery Projects',
    icon: Icons.yard_rounded,
    color: Color(0xFF2E7D32),
    image: 'assets/images/projects/Nursery Projects.jpg',
    items: [
      (name: 'Commercial Plant Nursery',     url: 'https://www.igoagritechfarms.com/projects/agri/nursery/commercial', image: 'assets/images/projects/Agri Farming Projects/Nursery Projects/Commercial Plant Nursery.webp'),
      (name: 'Seedling Production Units',    url: 'https://www.igoagritechfarms.com/projects/agri/nursery/seedling', image: 'assets/images/projects/Agri Farming Projects/Nursery Projects/Seedling Production Units.webp'),
      (name: 'Tissue Culture Plant Nursery', url: 'https://www.igoagritechfarms.com/projects/agri/nursery/tissue-culture', image: 'assets/images/projects/Agri Farming Projects/Nursery Projects/Tissue Culture Plant Nursery.webp'),
    ],
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class AgriProjectsScreen extends StatelessWidget {
  const AgriProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => context.pop(),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Agri Farming Projects',
              style: theme.textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '10 categories • ${_kAgriSubCategories.fold(0, (sum, c) => sum + c.items.length)} projects',
              style: theme.textTheme.labelSmall?.copyWith(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: _kAgriSubCategories.length,
        itemBuilder: (context, index) {
          final cat = _kAgriSubCategories[index];
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

// ── Sub-category card ─────────────────────────────────────────────────────────

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
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white70,
                ),
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
