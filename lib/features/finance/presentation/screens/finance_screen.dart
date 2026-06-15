import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Farm Wallet & Loans'), backgroundColor: AppColors.forestGreen, foregroundColor: Colors.white),
      body: const Center(child: Text('Finance features coming soon.')),
    );
  }
}
