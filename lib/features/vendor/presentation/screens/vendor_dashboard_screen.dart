import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class VendorDashboardScreen extends StatelessWidget {
  const VendorDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vendor Dashboard'), backgroundColor: AppColors.growthGreen, foregroundColor: Colors.white),
      body: const Center(child: Text('Vendor management features coming soon.')),
    );
  }
}
