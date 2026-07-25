import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/router/route_names.dart';
import '../../../notifications/presentation/widgets/heads_up_banner.dart';
import '../../../notifications/providers/notification_provider.dart';
import '../../../onboarding/providers/auth_provider.dart';
import '../../../../l10n/app_localizations.dart';

/// Main app shell with bottom navigation, app bar, and heads-up notification overlay.
class DashboardShell extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;

  const DashboardShell({super.key, required this.navigationShell});

  // To localize nav items, we need a method instead of a static const list
  List<({IconData icon, String label})> _getNavItems(AppLocalizations l10n) {
    return [
      (icon: Icons.home_rounded,            label: l10n.navHome),
      (icon: Icons.folder_special_rounded,  label: l10n.navProjects),
      (icon: Icons.storefront_rounded,      label: l10n.navMarket),
      (icon: Icons.design_services_rounded, label: l10n.navServices),
      (icon: Icons.school_rounded,          label: l10n.navCourse),
    ];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final notifState = ref.watch(notificationStateProvider);
    final unreadCount = notifState.notifications.where((n) => n.isNew).length;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      // ── App Bar ─────────────────────
      appBar: AppBar(
        backgroundColor: AppColors.forestGreen,
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/App Logo.jpeg',
                width: 32,
                height: 32,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Text(l10n.appTitle,
                style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5)),
          ],
        ),
        actions: [
          // Hubs profile icon
          _HubsIconButton(),
          // Notification bell with badge
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_rounded,
                    color: Colors.white),
                onPressed: () {
                  _showNotificationTray(context, ref);
                },
              ),
              if (unreadCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                        minWidth: 18, minHeight: 18),
                    child: Text(
                      unreadCount > 9 ? '9+' : '$unreadCount',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 4),
        ],
      ),

      // ── Body with Heads-Up Overlay ──
      body: Stack(
        children: [
          navigationShell,

          // Animated heads-up notification
          const Positioned(
            top: 0,
            left: 16,
            right: 16,
            child: HeadsUpBanner(),
          ),
        ],
      ),

      // ── Bottom Navigation ───────────
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(index,
              initialLocation: index == navigationShell.currentIndex);
        },
        destinations: _getNavItems(l10n)
            .map((item) => NavigationDestination(
                  icon: Icon(item.icon),
                  label: item.label,
                ))
            .toList(),
      ),
    );
  }

  void _showNotificationTray(BuildContext context, WidgetRef ref) {
    final notifState = ref.read(notificationStateProvider);
    final notifier = ref.read(notificationStateProvider.notifier);
    final l10n = AppLocalizations.of(context);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (_, scrollCtrl) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
              child: Row(
                children: [
                  const Icon(Icons.notifications_rounded,
                      color: AppColors.forestGreen),
                  const SizedBox(width: 8),
                  Text(l10n.notifications,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold)),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      notifier.markAllRead();
                      Navigator.pop(ctx);
                    },
                    child: Text(l10n.markAllRead),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close_rounded),
                    onPressed: () => Navigator.pop(ctx),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            Expanded(
              child: notifState.notifications.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.notifications_off_rounded,
                              size: 48,
                              color: Colors.grey.withValues(alpha: 0.3)),
                          const SizedBox(height: 8),
                          Text(l10n.noNotifications,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.grey)),
                        ],
                      ),
                    )
                  : ListView.separated(
                      controller: scrollCtrl,
                      itemCount: notifState.notifications.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, indent: 56),
                      itemBuilder: (_, i) {
                        final n = notifState.notifications[i];
                        final iconColor = switch (n.type) {
                          NotificationType.success => AppColors.success,
                          NotificationType.warning => AppColors.warning,
                          NotificationType.urgent  => AppColors.error,
                          NotificationType.info    => AppColors.info,
                        };
                        final icon = switch (n.type) {
                          NotificationType.success =>
                            Icons.check_circle_rounded,
                          NotificationType.warning =>
                            Icons.warning_amber_rounded,
                          NotificationType.urgent =>
                            Icons.notifications_active_rounded,
                          NotificationType.info => Icons.info_rounded,
                        };

                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: iconColor.withValues(alpha: 0.1),
                            child: Icon(icon,
                                color: iconColor, size: 20),
                          ),
                          title: Text(n.title,
                              style: TextStyle(
                                fontWeight: n.isNew
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                                fontSize: 13,
                              )),
                          subtitle: Text(n.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 11)),
                          trailing: Text(n.timeAgo,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.grey)),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          onTap: () {
                            notifier.markRead(n.id);
                            Navigator.pop(ctx);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Profile icon button — taps directly to Profile screen ────────────────────

class _HubsIconButton extends ConsumerWidget {
  const _HubsIconButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(authProvider).profile;
    final initials = _initials(profile?.name);

    return IconButton(
      tooltip: 'My Profile',
      onPressed: () => context.push(Routes.profile),
      icon: CircleAvatar(
        radius: 14,
        backgroundColor: AppColors.harvestGold,
        child: Text(
          initials,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  String _initials(String? name) {
    if (name == null || name.isEmpty) return 'U';
    final parts = name.trim().split(' ');
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return name[0].toUpperCase();
  }
}
