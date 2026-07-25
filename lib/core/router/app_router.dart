import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'route_names.dart';
import 'route_transitions.dart';
import '../../features/splash/presentation/splash_screen.dart';
import '../../features/onboarding/presentation/screens/language_selection_screen.dart';
import '../../features/onboarding/presentation/screens/otp_login_screen.dart';
import '../../features/onboarding/presentation/screens/user_details_screen.dart';
import '../../features/dashboard/presentation/screens/dashboard_shell.dart';
import '../../features/onboarding/providers/auth_provider.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/home/presentation/screens/all_brands_screen.dart';
import '../../features/agrimart/presentation/screens/agrimart_screen.dart';
import '../../features/agrimart/presentation/screens/seeds_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_screen.dart';
import '../../features/agrimart/presentation/screens/control_automation_screen.dart';
import '../../features/agrimart/presentation/screens/horticulture_catalog_screen.dart';
import '../../features/agrimart/presentation/screens/digital_agri_screen.dart';
import '../../features/agrimart/presentation/screens/iot_hardware_nodes_screen.dart';
import '../../features/agrimart/presentation/screens/software_dashboards_screen.dart';
import '../../features/agrimart/presentation/screens/digital_services_screen.dart';
import '../../features/agrimart/presentation/screens/post_harvest_legacy_screen.dart';
import '../../features/agrimart/presentation/screens/harvesting_cold_chain_screen.dart';
import '../../features/agrimart/presentation/screens/aquaculture_solutions_screen.dart';
import '../../features/agrimart/presentation/screens/livestock_ecosystems_screen.dart';
import '../../features/agrimart/presentation/screens/vegetable_crops_screen.dart';
import '../../features/agrimart/presentation/screens/flower_crops_screen.dart';
import '../../features/agrimart/presentation/screens/exotic_fruit_crops_screen.dart';
import '../../features/agrimart/presentation/screens/medicinal_herbs_screen.dart';
import '../../features/agrimart/presentation/screens/dosing_fertigation_screen.dart';
import '../../features/agrimart/presentation/screens/environmental_controllers_screen.dart';
import '../../features/agrimart/presentation/screens/smart_actuators_motors_screen.dart';
import '../../features/agrimart/presentation/screens/electrical_systems_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_structural_frames_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_greenhouse_covering_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_insect_shade_nets_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_climate_ventilation_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_misting_fogging_screen.dart';
import '../../features/agrimart/presentation/screens/polyhouse_plumbing_distribution_screen.dart';
import '../../features/agrimart/presentation/screens/vegetable_seeds_screen.dart';
import '../../features/agrimart/presentation/screens/fruit_seeds_screen.dart';
import '../../features/agrimart/presentation/screens/leafy_herb_seeds_screen.dart';
import '../../features/agrimart/presentation/screens/growing_media_screen.dart';
import '../../features/agrimart/presentation/screens/plant_nutrition_screen.dart';
import '../../features/agrimart/presentation/screens/plant_protection_screen.dart';
import '../../features/agrimart/presentation/screens/plant_growth_regulators_screen.dart';
import '../../features/agrimart/presentation/screens/mulching_screen.dart';
import '../../features/mandi_pricing/presentation/screens/mandi_screen.dart';
import '../../features/services/presentation/screens/services_screen.dart';
import '../../features/services/presentation/screens/farm_planning_consulting_screen.dart';
import '../../features/services/presentation/screens/farming_project_setup_screen.dart';
import '../../features/services/presentation/screens/farm_infrastructure_screen.dart';
import '../../features/services/presentation/screens/maintenance_support_screen.dart';
import '../../features/profile/presentation/screens/profile_screen.dart';
import '../../features/crop_doctor/presentation/screens/crop_doctor_screen.dart';
import '../../features/projects/presentation/screens/projects_screen.dart';
import '../../features/projects/presentation/screens/agri_projects_screen.dart';
import '../../features/projects/presentation/screens/aquaculture_projects_screen.dart';
import '../../features/projects/presentation/screens/livestock_projects_screen.dart';
import '../../features/projects/presentation/screens/farm_engineering_projects_screen.dart';
import '../../features/projects/presentation/screens/project_subcategory_screen.dart';
import '../../features/learning/presentation/screens/learning_academy_screen.dart';
import '../../features/finance/presentation/screens/finance_screen.dart';
import '../../features/jobs/presentation/screens/jobs_screen.dart';
import '../../features/opportunities/presentation/screens/opportunities_screen.dart';
import '../../features/vendor/presentation/screens/vendor_dashboard_screen.dart';

// Helper to convert Stream to Listenable for GoRouter
import 'dart:async';

class GoRouterRefreshStream extends ChangeNotifier {
  late final StreamSubscription _subscription;
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }
  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}

/// GoRouter configuration with auth-aware redirects.
final appRouterProvider = Provider<GoRouter>((ref) {
  // Listen to the auth state notifier instead of just watching state to avoid rebuilding router instance
  // Wait, Provider doesn't expose stream directly from a StateNotifier in Riverpod 2.0 without .stream
  // But wait, using Riverpod 2, it's a Notifier. We don't have .stream out of the box unless we use AsyncNotifier or we just watch it.
  // Actually, standard practice in Riverpod 2 is to watch it but return the SAME instance of GoRouter,
  // OR we create the GoRouter instance using a ref.listen inside the redirect.
  // Let's create it once and use a Listenable.
  
  final listenable = ValueNotifier<bool>(false);
  
  ref.listen<AuthState>(
    authProvider,
    (_, next) {
      listenable.value = !listenable.value; // trigger refresh
    },
  );

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,
    refreshListenable: listenable,
    redirect: (context, state) {
      // We must read here dynamically so it gets the latest value during redirect
      final isAuthenticated = ref.read(authProvider).isAuthenticated;
      final location = state.matchedLocation;
      final isOnboarding = location.startsWith('/onboarding');
      final isSplash = location == Routes.splash;

      if (!isAuthenticated && !isOnboarding && !isSplash) {
        return Routes.splash;
      }

      if (isAuthenticated && (isOnboarding || isSplash)) {
        return Routes.home;
      }

      return null;
    },
    routes: [
      // ── Unauthenticated ─────────────
      GoRoute(
        path: Routes.splash,
        pageBuilder: (context, state) =>
            fadeTransition(const SplashScreen(), state),
      ),
      GoRoute(
        path: Routes.languageSelect,
        pageBuilder: (context, state) =>
            slideUpTransition(const LanguageSelectionScreen(), state),
      ),
      GoRoute(
        path: Routes.otpLogin,
        pageBuilder: (context, state) =>
            slideUpTransition(const OtpLoginScreen(), state),
      ),
      GoRoute(
        path: Routes.userDetails,
        pageBuilder: (context, state) =>
            slideUpTransition(const UserDetailsScreen(), state),
      ),
      GoRoute(
        path: Routes.cropDoctor,
        pageBuilder: (context, state) =>
            slideUpTransition(const CropDoctorScreen(), state),
      ),
      GoRoute(
        path: Routes.mandi,
        pageBuilder: (context, state) =>
            slideUpTransition(const MandiScreen(), state),
      ),
      GoRoute(
        path: Routes.brands,
        pageBuilder: (context, state) =>
            slideUpTransition(const AllBrandsScreen(), state),
      ),

      // ── Authenticated Shell ─────────
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return DashboardShell(navigationShell: navigationShell);
        },
        branches: [
          // Branch 0: Home
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.home,
              builder: (_, __) => const HomeScreen(),
            ),
          ]),

          // Branch 1: Projects
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.projects,
              builder: (_, __) => const ProjectsScreen(),
              routes: [
                GoRoute(
                  path: 'agri-farming',
                  builder: (_, __) => const AgriProjectsScreen(),
                ),
                GoRoute(
                  path: 'aquaculture',
                  builder: (_, __) => const AquacultureProjectsScreen(),
                ),
                GoRoute(
                  path: 'livestock',
                  builder: (_, __) => const LivestockProjectsScreen(),
                ),
                GoRoute(
                  path: 'farm-engineering',
                  builder: (_, __) => const FarmEngineeringProjectsScreen(),
                ),
                GoRoute(
                  path: 'sub-category',
                  builder: (context, state) {
                    final data = state.extra as Map<String, dynamic>? ?? {};
                    return ProjectSubCategoryScreen(
                      title: data['title'] as String? ?? 'Projects',
                      color: data['color'] as Color? ?? Colors.green,
                      items: data['items'] as List<ProjectItemData>? ?? [],
                    );
                  },
                ),
              ],
            ),
          ]),

          // Branch 2: Products (AgriMart)
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.agrimart,
              builder: (_, __) => const AgriMartScreen(),
              routes: [
                GoRoute(
                  path: 'polyhouse',
                  builder: (_, __) => const PolyhouseScreen(),
                  routes: [
                    GoRoute(
                      path: 'structural-frames',
                      builder: (_, __) => const PolyhouseStructuralFramesScreen(),
                    ),
                    GoRoute(
                      path: 'greenhouse-covering',
                      builder: (_, __) => const PolyhouseGreenhouseCoveringScreen(),
                    ),
                    GoRoute(
                      path: 'insect-shade-nets',
                      builder: (_, __) => const PolyhouseInsectShadeNetsScreen(),
                    ),
                    GoRoute(
                      path: 'climate-ventilation',
                      builder: (_, __) => const PolyhouseClimateVentilationScreen(),
                    ),
                    GoRoute(
                      path: 'misting-fogging',
                      builder: (_, __) => const PolyhouseMistingFoggingScreen(),
                    ),
                    GoRoute(
                      path: 'plumbing-distribution',
                      builder: (_, __) => const PolyhousePlumbingDistributionScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'control-automation',
                  builder: (_, __) => const ControlAutomationScreen(),
                  routes: [
                    GoRoute(
                      path: 'dosing-fertigation',
                      builder: (_, __) => const DosingFertigationScreen(),
                    ),
                    GoRoute(
                      path: 'environmental-controllers',
                      builder: (_, __) => const EnvironmentalControllersScreen(),
                    ),
                    GoRoute(
                      path: 'smart-actuators-motors',
                      builder: (_, __) => const SmartActuatorsMotorsScreen(),
                    ),
                    GoRoute(
                      path: 'electrical-systems',
                      builder: (_, __) => const ElectricalSystemsScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'horticulture-catalog',
                  builder: (_, __) => const HorticultureCatalogScreen(),
                  routes: [
                    GoRoute(
                      path: 'vegetable-crops',
                      builder: (_, __) => const VegetableCropsScreen(),
                    ),
                    GoRoute(
                      path: 'flower-crops',
                      builder: (_, __) => const FlowerCropsScreen(),
                    ),
                    GoRoute(
                      path: 'exotic-fruit-crops',
                      builder: (_, __) => const ExoticFruitCropsScreen(),
                    ),
                    GoRoute(
                      path: 'medicinal-herbs',
                      builder: (_, __) => const MedicinalHerbsScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'digital-agri',
                  builder: (_, __) => const DigitalAgriScreen(),
                  routes: [
                    GoRoute(
                      path: 'iot-hardware-nodes',
                      builder: (_, __) => const IotHardwareNodesScreen(),
                    ),
                    GoRoute(
                      path: 'software-dashboards',
                      builder: (_, __) => const SoftwareDashboardsScreen(),
                    ),
                    GoRoute(
                      path: 'digital-services',
                      builder: (_, __) => const DigitalServicesScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'post-harvest-legacy',
                  builder: (_, __) => const PostHarvestLegacyScreen(),
                  routes: [
                    GoRoute(
                      path: 'harvesting-cold-chain',
                      builder: (_, __) => const HarvestingColdChainScreen(),
                    ),
                    GoRoute(
                      path: 'aquaculture-solutions',
                      builder: (_, __) => const AquacultureSolutionsScreen(),
                    ),
                    GoRoute(
                      path: 'livestock-ecosystems',
                      builder: (_, __) => const LivestockEcosystemsScreen(),
                    ),
                  ],
                ),
                GoRoute(
                  path: 'seeds',
                  builder: (_, __) => const SeedsScreen(),
                  routes: [
                    GoRoute(
                      path: 'vegetable',
                      builder: (_, __) => const VegetableSeedsScreen(),
                    ),
                    GoRoute(
                      path: 'fruit',
                      builder: (_, __) => const FruitSeedsScreen(),
                    ),
                    GoRoute(
                      path: 'leafy-herb',
                      builder: (_, __) => const LeafyHerbSeedsScreen(),
                    ),
                    GoRoute(
                      path: 'growing-media',
                      builder: (_, __) => const GrowingMediaScreen(),
                    ),
                    GoRoute(
                      path: 'plant-nutrition',
                      builder: (_, __) => const PlantNutritionScreen(),
                    ),
                    GoRoute(
                      path: 'plant-protection',
                      builder: (_, __) => const PlantProtectionScreen(),
                    ),
                    GoRoute(
                      path: 'plant-growth-regulators',
                      builder: (_, __) => const PlantGrowthRegulatorsScreen(),
                    ),
                    GoRoute(
                      path: 'mulching-weed-control',
                      builder: (_, __) => const MulchingScreen(),
                    ),
                  ],
                ),
              ],
            ),
          ]),

          // Branch 3: Services
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.services,
              builder: (_, __) => const ServicesScreen(),
              routes: [
                GoRoute(
                  path: 'farm-planning',
                  builder: (_, __) => const FarmPlanningConsultingScreen(),
                ),
                GoRoute(
                  path: 'project-setup',
                  builder: (_, __) => const FarmingProjectSetupScreen(),
                ),
                GoRoute(
                  path: 'farm-infrastructure',
                  builder: (_, __) => const FarmInfrastructureScreen(),
                ),
                GoRoute(
                  path: 'maintenance-support',
                  builder: (_, __) => const MaintenanceSupportScreen(),
                ),
              ],
            ),
          ]),

          // Branch 4: Course (Learning Academy)
          StatefulShellBranch(routes: [
            GoRoute(
              path: Routes.learn,
              builder: (_, __) => const LearningAcademyScreen(),
            ),
          ]),
        ],
      ),

      // ── Hubs (accessible via AppBar profile icon) ──
      GoRoute(
        path: Routes.hubs,
        redirect: (_, __) => Routes.profile,
      ),
      GoRoute(
        path: Routes.profile,
        pageBuilder: (context, state) =>
            slideUpTransition(const ProfileScreen(), state),
      ),
      GoRoute(
        path: Routes.vendor,
        pageBuilder: (context, state) =>
            slideUpTransition(const VendorDashboardScreen(), state),
      ),
      GoRoute(
        path: Routes.finance,
        pageBuilder: (context, state) =>
            slideUpTransition(const FinanceScreen(), state),
      ),
      GoRoute(
        path: Routes.jobs,
        pageBuilder: (context, state) =>
            slideUpTransition(const JobsScreen(), state),
      ),
      GoRoute(
        path: Routes.opportunities,
        pageBuilder: (context, state) =>
            slideUpTransition(const OpportunitiesScreen(), state),
      ),
    ],
  );
});


