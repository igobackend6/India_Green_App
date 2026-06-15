import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../providers/notification_provider.dart';

/// Animated banner that slides in from the top when a new notification arrives.
class HeadsUpBanner extends ConsumerWidget {
  const HeadsUpBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(notificationStateProvider);
    final theme = Theme.of(context);

    if (!state.isHeadsUpVisible || state.currentHeadsUp == null) {
      return const SizedBox.shrink();
    }

    final notif = state.currentHeadsUp!;
    final (bgColor, borderColor, icon) = switch (notif.type) {
      NotificationType.success => (
          AppColors.successBg,
          AppColors.success,
          Icons.check_circle_rounded
        ),
      NotificationType.warning => (
          AppColors.warningBg,
          AppColors.warning,
          Icons.warning_amber_rounded
        ),
      NotificationType.urgent => (
          AppColors.errorBg,
          AppColors.error,
          Icons.notifications_active_rounded
        ),
      NotificationType.info => (
          AppColors.infoBg,
          AppColors.info,
          Icons.info_rounded
        ),
    };

    return GestureDetector(
      onTap: () {
        ref.read(notificationStateProvider.notifier).dismissHeadsUp();
      },
      onVerticalDragEnd: (_) {
        ref.read(notificationStateProvider.notifier).dismissHeadsUp();
      },
      child: Container(
        margin: const EdgeInsets.only(top: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor.withValues(alpha: 0.5), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: borderColor.withValues(alpha: 0.15),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: borderColor.withValues(alpha: 0.15),
              ),
              child: Icon(icon, color: borderColor, size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(notif.title,
                      style: theme.textTheme.titleSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(notif.description,
                      style: theme.textTheme.bodySmall
                          ?.copyWith(color: AppColors.textSecondary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .slideY(begin: -1.0, end: 0, duration: 350.ms, curve: Curves.easeOutCubic)
        .fadeIn(duration: 250.ms);
  }
}
