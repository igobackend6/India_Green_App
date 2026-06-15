import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../onboarding/providers/auth_provider.dart';
import '../widgets/welcome_card.dart';
import '../widgets/quick_actions_grid.dart';
import '../widgets/brand_carousel.dart';
import '../../../../../l10n/app_localizations.dart';

/// Home dashboard screen with welcome header, quick actions, and brand carousel.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);

    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Welcome Header ─────────────
          Consumer(
            builder: (context, ref, child) {
              final auth = ref.watch(authProvider);
              return GestureDetector(
                onTap: () => context.go(Routes.profile),
                child: WelcomeCard(
                  userName: auth.profile?.name ?? 'Farmer',
                  pincode: auth.profile?.pincode ?? '636001',
                )
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1),
              );
            },
          ),

          const SizedBox(height: 24),

          // ── Quick Actions Grid ─────────
          Text(l10n.quickActions,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold))
              .animate()
              .fadeIn(delay: 100.ms),
          const SizedBox(height: 12),
          const QuickActionsGrid(),

          const SizedBox(height: 24),

          // ── IGO Brands Section ─────────
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.igoBrands,
                  style: theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              TextButton(
                onPressed: () {},
                child: Text(l10n.viewAll),
              ),
            ],
          ).animate().fadeIn(delay: 200.ms),
          const SizedBox(height: 8),
          const BrandCarousel(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
