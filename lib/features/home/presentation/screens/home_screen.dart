import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/router/route_names.dart';
import '../../../onboarding/providers/auth_provider.dart';
import '../widgets/welcome_card.dart';
import '../widgets/ad_banner.dart';
import '../widgets/brand_carousel.dart';
import '../widgets/innovation_growth_section.dart';
import '../widgets/vision_mission_section.dart';
import '../../../../../l10n/app_localizations.dart';

// ── Home screen ───────────────────────────────────────────────────────────────

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context);
    final auth = ref.watch(authProvider);

    return SingleChildScrollView(
      padding: AppSpacing.screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Welcome Header ─────────────
          GestureDetector(
            onTap: () => context.push(Routes.profile),
            child: WelcomeCard(
              userName: auth.profile?.name ?? 'Farmer',
              pincode: auth.profile?.pincode ?? '636001',
            )
                .animate()
                .fadeIn(duration: 400.ms)
                .slideY(begin: 0.1),
          ),

          const SizedBox(height: 16),

          // ── Auto-scrolling Ad Banner ───
          const AdBanner()
              .animate()
              .fadeIn(delay: 80.ms)
              .slideY(begin: 0.08),

          const SizedBox(height: 24),

          // ── IGO GROUPS ─────────
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.igoBrands,
                style: theme.textTheme.titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 2),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Unit of the igo precious farming ',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.normal),
                    ),
                    const TextSpan(
                      text: 'PVT LTD.',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 200.ms),

          const SizedBox(height: 12),
          const BrandCarousel(),

          const SizedBox(height: 28),

          // ── Innovation & Profitable Growth ─
          const InnovationGrowthSection(),

          const SizedBox(height: 28),

          // ── Our Vision & Mission ───────────
          const VisionMissionSection(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
