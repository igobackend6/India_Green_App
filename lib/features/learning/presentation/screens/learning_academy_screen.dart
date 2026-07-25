import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import 'course_detail_screen.dart';

class LearningAcademyScreen extends ConsumerWidget {
  const LearningAcademyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = [
      (
        title: 'Polyhouse Training',
        icon: Icons.house_siding_rounded,
        description: 'Complete training on polyhouse construction, operation, and crop management. Master industrial-grade setup, climate control, and commercial profitability.',
        duration: '5 DAYS',
        level: 'All Levels',
        image: 'assets/images/igo academy/Polyhouse Training.jpeg',
        syllabus: [
          'Structure Design & Installation',
          'Climate Control Systems',
          'Crop Selection & Management',
          'Fertigation & Drip Irrigation',
          'Business Planning & ROI',
        ],
      ),
      (
        title: 'Hydroponics Training',
        icon: Icons.water_drop_rounded,
        description: 'Hands-on training in soilless farming techniques and commercial NFT/DWC system setup. Learn to grow high-value crops year-round without soil.',
        duration: '5 DAYS',
        level: 'Beginner to Advanced',
        image: 'assets/images/igo academy/Hydroponics Training.jpeg',
        syllabus: [
          'NFT & DWC System Setup',
          'Nutrient Solution Management',
          'pH & EC Balancing',
          'Commercial Crop Scheduling',
          'Market & Sales Strategy',
        ],
      ),
      (
        title: 'Vertical Farming Training',
        icon: Icons.layers_rounded,
        description: 'Mastering light physics and modular layer design for high-density urban agriculture — grow 10x more in the same footprint.',
        duration: '3 DAYS',
        level: 'Intermediate',
        image: 'assets/images/igo academy/Vertical Farming Training.jpeg',
        syllabus: [
          'Multi-Layer Farm Design',
          'LED Lighting Systems',
          'Climate Automation',
          'Space Optimization',
          'Cost-Benefit Analysis',
        ],
      ),
      (
        title: 'Mushroom Cultivation',
        icon: Icons.eco_rounded,
        description: 'Practical guide to commercial mushroom production and care. Learn optimal humidity control and substrate preparation.',
        duration: '3 DAYS',
        level: 'Beginner Friendly',
        image: 'assets/images/igo academy/Mushroom Cultivation.jpg',
        syllabus: [
          'Substrate Preparation & Sterilization',
          'Spawn Inoculation Techniques',
          'Humidity & Temperature Control',
          'Disease Management',
          'Harvesting & Packaging',
        ],
      ),
      (
        title: 'Aquaculture & Fish Farming',
        icon: Icons.waves_rounded,
        description: 'Expert training in fish farming and aquaculture management. Develop profitable pond and tank-based ecosystems.',
        duration: '5 DAYS',
        level: 'All Levels',
        image: 'assets/images/igo academy/Aquaculture & Fish Farming.jpeg',
        syllabus: [
          'Pond Construction & Preparation',
          'Water Quality Management',
          'Feed Formulation & Nutrition',
          'Disease Diagnosis & Treatment',
          'Harvesting & Marketing',
        ],
      ),
      (
        title: 'Biofloc Technology Training',
        icon: Icons.science_rounded,
        description: 'Advanced biofloc system training for high-density farming. Maximize output using microbial water treatment.',
        duration: '4 DAYS',
        level: 'Intermediate',
        image: 'assets/images/igo academy/Biofloc Technology Training.jpeg',
        syllabus: [
          'Tank Setup & Aeration',
          'Floc Generation & Maintenance',
          'C/N Ratio Calculation',
          'Water Parameter Monitoring',
          'High-Density Stocking Management',
        ],
      ),
      (
        title: 'Goat & Livestock Farming',
        icon: Icons.pets_rounded,
        description: 'Professional livestock management and goat farming practices for scalable meat and dairy production.',
        duration: '5 DAYS',
        level: 'All Levels',
        image: 'assets/images/igo academy/Goat & Livestock Farming.jpeg',
        syllabus: [
          'Shed Design & Construction',
          'Breed Selection & Breeding',
          'Fodder Cultivation & Feeding',
          'Vaccination & Healthcare',
          'Commercial Business Strategy',
        ],
      ),
      (
        title: 'Microgreens Production',
        icon: Icons.spa_rounded,
        description: 'Step-by-step training for growing highly nutritious microgreens. Start a profitable urban farming business quickly.',
        duration: '2 DAYS',
        level: 'Beginner Friendly',
        image: 'assets/images/igo academy/Microgreens Production.jpeg',
        syllabus: [
          'Seed Selection & Pre-soaking',
          'Growing Media & Trays',
          'Lighting & Watering Protocols',
          'Mold Prevention',
          'Harvesting & Shelf-life Extension',
        ],
      ),
      (
        title: 'Drip Irrigation & Farm Engineering',
        icon: Icons.water_rounded,
        description: 'Learn efficient irrigation setups and agricultural engineering to drastically reduce water usage and improve yields.',
        duration: '4 DAYS',
        level: 'Intermediate',
        image: 'assets/images/igo academy/Drip Irrigation & Farm Engineering.jpeg',
        syllabus: [
          'System Design & Hydraulics',
          'Pump Selection & Automation',
          'Filtration Systems',
          'Fertigation Injection',
          'Troubleshooting & Maintenance',
        ],
      ),
      (
        title: 'Agri Entrepreneur Masterclass',
        icon: Icons.business_center_rounded,
        description: 'Build, manage, and scale your agricultural business successfully. A comprehensive guide to modern agribusiness.',
        duration: '7 DAYS',
        level: 'Advanced',
        image: 'assets/images/igo academy/Agri Entrepreneur Masterclass.png',
        syllabus: [
          'Market Research & Business Planning',
          'Fundraising & Subsidies',
          'Supply Chain Management',
          'Branding & Digital Marketing',
          'Export Strategies & Compliance',
        ],
      ),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('IGO Academy'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return _ItemCard(
            title: item.title,
            description: item.description,
            icon: item.icon,
            duration: item.duration,
            level: item.level,
            image: item.image,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CourseDetailScreen(
                    title: item.title,
                    description: item.description,
                    icon: item.icon,
                    duration: item.duration,
                    level: item.level,
                    image: item.image,
                    syllabus: item.syllabus,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _ItemCard extends StatefulWidget {
  final String title;
  final String description;
  final IconData icon;
  final String duration;
  final String level;
  final String? image;
  final VoidCallback onTap;

  const _ItemCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.duration,
    required this.level,
    this.image,
    required this.onTap,
  });

  @override
  State<_ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<_ItemCard> {
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
                          color: _isPressed ? Colors.white : AppColors.forestGreen, 
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: _isPressed ? Colors.white.withValues(alpha: 0.2) : AppColors.harvestGold.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.access_time_rounded, size: 10, color: _isPressed ? Colors.white : AppColors.harvestGold),
                                      const SizedBox(width: 4),
                                      Text(
                                        widget.duration,
                                        style: theme.textTheme.labelSmall?.copyWith(
                                          fontSize: 10,
                                          color: _isPressed ? Colors.white : AppColors.harvestGold,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: _isPressed ? Colors.white.withValues(alpha: 0.2) : AppColors.forestGreen.withValues(alpha: 0.1),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    widget.level,
                                    style: theme.textTheme.labelSmall?.copyWith(
                                      fontSize: 10,
                                      color: _isPressed ? Colors.white : AppColors.forestGreen,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Text(
                              widget.title,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: _isPressed ? Colors.white : AppColors.textPrimary,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              widget.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
