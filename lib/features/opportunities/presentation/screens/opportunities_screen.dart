import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class OpportunitiesScreen extends StatelessWidget {
  const OpportunitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Estates & Franchises'), backgroundColor: AppColors.forestGreen, foregroundColor: Colors.white),
      body: const Center(child: Text('Opportunities features coming soon.')),
    );
  }
}
