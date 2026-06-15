import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../l10n/app_localizations.dart';

class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  List<({IconData icon, String label, Color color})> _getActions(AppLocalizations l10n) {
    return [
      (icon: Icons.shopping_bag_rounded, label: l10n.buyInputs, color: AppColors.forestGreen),
      (icon: Icons.sell_rounded,         label: l10n.sellProduce, color: AppColors.growthGreen),
      (icon: Icons.trending_up_rounded,  label: l10n.mandiPrices, color: AppColors.harvestGold),
      (icon: Icons.local_hospital_rounded, label: l10n.cropDoctor, color: AppColors.error),
      (icon: Icons.account_balance_rounded, label: l10n.loanApply, color: const Color(0xFF3B82F6)),
      (icon: Icons.work_rounded,         label: l10n.agriJobs, color: const Color(0xFF8B5CF6)),
      (icon: Icons.school_rounded,       label: l10n.igoAcademy, color: const Color(0xFF06B6D4)),
      (icon: Icons.handshake_rounded,    label: l10n.franchise, color: AppColors.accentGold),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final actions = _getActions(l10n);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: actions.length,
      itemBuilder: (context, index) {
        final action = actions[index];
        return GestureDetector(
          onTap: () {
            // Navigation will be wired in Phase 2+
          },
          child: Column(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: action.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(action.icon, color: action.color, size: 26),
              ),
              const SizedBox(height: 6),
              Text(
                action.label,
                style: theme.textTheme.labelSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
            .animate(delay: (40 * index).ms)
            .fadeIn(duration: 300.ms)
            .scale(begin: const Offset(0.8, 0.8), duration: 300.ms);
      },
    );
  }
}
