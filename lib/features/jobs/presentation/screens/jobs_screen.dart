import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agri Jobs Portal'), backgroundColor: AppColors.forestGreen, foregroundColor: Colors.white),
      body: const Center(child: Text('Jobs features coming soon.')),
    );
  }
}
