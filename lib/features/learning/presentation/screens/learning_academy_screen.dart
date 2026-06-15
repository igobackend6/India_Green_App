import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';

class LearningAcademyScreen extends ConsumerWidget {
  const LearningAcademyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IGO Academy'),
        backgroundColor: AppColors.forestGreen,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school_rounded, size: 80, color: AppColors.harvestGold),
            const SizedBox(height: 16),
            Text('Learning Academy', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            const Text('Courses and certifications coming soon.'),
          ],
        ),
      ),
    );
  }
}
