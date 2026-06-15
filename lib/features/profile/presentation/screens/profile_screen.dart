import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../../core/l10n/locale_provider.dart';
import '../../../onboarding/providers/auth_provider.dart';
import '../../../../l10n/app_localizations.dart';

/// Language options available for switching from within the app.
const _languages = [
  ('Tamil',     'தமிழ்'),
  ('Hindi',     'हिन्दी'),
  ('Telugu',    'తెలుగు'),
  ('Kannada',   'ಕನ್ನಡ'),
  ('Malayalam', 'മലയാളം'),
  ('Marathi',   'मराठी'),
  ('Bengali',   'বাংলা'),
  ('Gujarati',  'ગુજરાતી'),
  ('Punjabi',   'ਪੰਜਾਬੀ'),
  ('Odia',      'ଓଡ଼ିଆ'),
  ('Assamese',  'অসমীয়া'),
  ('English',   'English'),
];

/// Profile & Settings screen with user info, role badges, and action tiles.
class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final authState = ref.watch(authProvider);
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        children: [
          const SizedBox(height: 8),

          // ── Hub Navigation Tabs ─────────
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _HubTab(label: l10n.hubProfile,  route: Routes.profile, isActive: true),
                _HubTab(label: l10n.hubVendor,   route: Routes.vendor),
                _HubTab(label: l10n.hubFinance,  route: Routes.finance),
                _HubTab(label: l10n.hubLearn,    route: Routes.learn),
                _HubTab(label: l10n.hubOpps,     route: Routes.opportunities),
                _HubTab(label: l10n.hubJobs,     route: Routes.jobs),
              ],
            ),
          ).animate().fadeIn(duration: 300.ms),

          const SizedBox(height: 24),

          // ── Profile Card ────────────────
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: AppColors.forestGreen.withValues(alpha: 0.1),
                        child: Text(
                          authState.profile?.name.isNotEmpty == true
                              ? authState.profile!.name.substring(0, 1).toUpperCase()
                              : 'F',
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: AppColors.forestGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        authState.profile?.name ?? 'Farmer',
                        style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '+91 ${authState.profile?.phone ?? ''}',
                        style: theme.textTheme.bodyMedium?.copyWith(color: AppColors.textMuted),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Pincode: ${authState.profile?.pincode ?? ''}',
                        style: theme.textTheme.bodySmall?.copyWith(color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 6,
                  alignment: WrapAlignment.center,
                  children: authState.selectedRoles
                      .map((role) => Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: AppColors.harvestGold.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: AppColors.harvestGold.withValues(alpha: 0.3)),
                            ),
                            child: Text(role,
                                style: theme.textTheme.labelSmall?.copyWith(
                                    color: AppColors.harvestGold,
                                    fontWeight: FontWeight.bold)),
                          ))
                      .toList(),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),

          const SizedBox(height: 24),

          // ── Settings Tiles ──────────────
          _SettingsTile(
            icon: Icons.translate_rounded,
            label: l10n.language,
            value: authState.selectedLanguage,
            onTap: () => _showLanguagePicker(context, ref, authState.selectedLanguage),
          ).animate().fadeIn(delay: 200.ms),

          _SettingsTile(
            icon: Icons.dark_mode_rounded,
            label: l10n.darkMode,
            trailing: Switch(
              value: false,
              onChanged: (_) {},
              activeThumbColor: AppColors.growthGreen,
            ),
          ).animate().fadeIn(delay: 250.ms),

          _SettingsTile(
            icon: Icons.notifications_rounded,
            label: l10n.notificationPrefs,
            onTap: () {},
          ).animate().fadeIn(delay: 300.ms),

          _SettingsTile(
            icon: Icons.info_outline_rounded,
            label: l10n.aboutApp,
            onTap: () {},
          ).animate().fadeIn(delay: 350.ms),

          const SizedBox(height: 16),

          // ── Logout ──────────────────────
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(authProvider.notifier).logout();
                if (context.mounted) {
                  context.go(Routes.splash);
                }
              },
              icon: const Icon(Icons.logout_rounded, color: AppColors.error),
              label: Text(l10n.logout,
                  style: theme.textTheme.titleSmall
                      ?.copyWith(color: AppColors.error, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.error),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ).animate().fadeIn(delay: 400.ms),

          const SizedBox(height: 32),
        ],
      ),
    );
  }

  /// Bottom sheet language picker — always rendered in English so the user
  /// can read it regardless of the currently active locale.
  void _showLanguagePicker(BuildContext context, WidgetRef ref, String currentLang) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (ctx) => Localizations.override(
        context: ctx,
        locale: const Locale('en'),
        child: DraggableScrollableSheet(
          initialChildSize: 0.6,
          minChildSize: 0.4,
          maxChildSize: 0.9,
          expand: false,
          builder: (_, scrollCtrl) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
                child: Row(
                  children: [
                    const Icon(Icons.translate_rounded, color: AppColors.forestGreen),
                    const SizedBox(width: 8),
                    Text(
                      'Select Language',
                      style: Theme.of(ctx).textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.close_rounded),
                      onPressed: () => Navigator.pop(ctx),
                    ),
                  ],
                ),
              ),
              const Divider(height: 1),
              Expanded(
                child: ListView.builder(
                  controller: scrollCtrl,
                  itemCount: _languages.length,
                  itemBuilder: (_, i) {
                    final (name, native) = _languages[i];
                    final isSelected = name == currentLang;
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: isSelected
                            ? AppColors.forestGreen
                            : AppColors.softGray,
                        child: Text(
                          native.substring(0, 1),
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        native,
                        style: TextStyle(
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected
                              ? AppColors.forestGreen
                              : AppColors.textPrimary,
                        ),
                      ),
                      subtitle: Text(name,
                          style: const TextStyle(
                              fontSize: 12, color: AppColors.textMuted)),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle_rounded,
                              color: AppColors.forestGreen)
                          : null,
                      onTap: () {
                        // Apply to the whole app immediately
                        ref.read(localeProvider.notifier).setLanguage(name);
                        ref.read(authProvider.notifier).setLanguage(name);
                        Navigator.pop(ctx);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Hub navigation tab chip.
class _HubTab extends StatelessWidget {
  final String label;
  final String route;
  final bool isActive;

  const _HubTab({
    required this.label,
    required this.route,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () => context.go(route),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: isActive ? AppColors.harvestGold : AppColors.softGray,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : AppColors.textSecondary,
                ),
          ),
        ),
      ),
    );
  }
}

/// Reusable settings tile.
class _SettingsTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? value;
  final Widget? trailing;
  final VoidCallback? onTap;

  const _SettingsTile({
    required this.icon,
    required this.label,
    this.value,
    this.trailing,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: AppColors.forestGreen.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.forestGreen, size: 20),
        ),
        title: Text(label,
            style: theme.textTheme.titleSmall
                ?.copyWith(fontWeight: FontWeight.w600)),
        subtitle: value != null
            ? Text(value!,
                style: theme.textTheme.bodySmall
                    ?.copyWith(color: AppColors.textMuted))
            : null,
        trailing: trailing ??
            const Icon(Icons.chevron_right_rounded, color: AppColors.textMuted),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
