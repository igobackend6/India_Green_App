/// Named route path constants for GoRouter.
abstract final class Routes {
  // ── Unauthenticated ──────────────────
  static const splash         = '/splash';
  static const languageSelect = '/onboarding/language';
  static const roleSelect     = '/onboarding/roles';
  static const otpLogin       = '/onboarding/otp-login';
  static const userDetails    = '/onboarding/user-details';

  // ── Authenticated (StatefulShellRoute branches) ─
  static const home           = '/home';
  static const market         = '/market';
  static const mandi          = '/mandi';
  static const brands         = '/brands';
  static const services       = '/services';
  static const farmPlanning   = '/services/farm-planning';
  static const farmingProjectSetup = '/services/project-setup';
  static const farmInfrastructure  = '/services/farm-infrastructure';
  static const maintenanceSupport  = '/services/maintenance-support';
  static const aiDoctor       = '/ai-doctor';
  static const cropDoctor     = '/crop-doctor';
  static const projects       = '/projects';
  static const agriProjects          = '/projects/agri-farming';
  static const aquacultureProjects   = '/projects/aquaculture';
  static const livestockProjects     = '/projects/livestock';
  static const farmEngineeringProjects = '/projects/farm-engineering';
  static const projectSubCategory    = '/projects/sub-category';

  // ── Dashboard ────────────────────────
  static const dashboard      = '/dashboard';
  static const agrimart       = '/agrimart';
  static const seeds          = '/agrimart/seeds';
  static const polyhouse      = '/agrimart/polyhouse';
  static const controlAutomation = '/agrimart/control-automation';
  static const horticultureCatalog = '/agrimart/horticulture-catalog';
  static const vegetableCrops = '/agrimart/horticulture-catalog/vegetable-crops';
  static const flowerCrops = '/agrimart/horticulture-catalog/flower-crops';
  static const exoticFruitCrops = '/agrimart/horticulture-catalog/exotic-fruit-crops';
  static const medicinalHerbs = '/agrimart/horticulture-catalog/medicinal-herbs';
  static const digitalAgri = '/agrimart/digital-agri';
  static const iotHardwareNodes = '/agrimart/digital-agri/iot-hardware-nodes';
  static const softwareDashboards = '/agrimart/digital-agri/software-dashboards';
  static const digitalServices = '/agrimart/digital-agri/digital-services';
  static const postHarvestLegacy = '/agrimart/post-harvest-legacy';
  static const harvestingColdChain = '/agrimart/post-harvest-legacy/harvesting-cold-chain';
  static const aquacultureSolutions = '/agrimart/post-harvest-legacy/aquaculture-solutions';
  static const livestockEcosystems = '/agrimart/post-harvest-legacy/livestock-ecosystems';
  static const dosingFertigation = '/agrimart/control-automation/dosing-fertigation';
  static const environmentalControllers = '/agrimart/control-automation/environmental-controllers';
  static const smartActuatorsMotors = '/agrimart/control-automation/smart-actuators-motors';
  static const electricalSystems = '/agrimart/control-automation/electrical-systems';
  static const polyhouseStructuralFrames = '/agrimart/polyhouse/structural-frames';
  static const polyhouseGreenhouseCovering = '/agrimart/polyhouse/greenhouse-covering';
  static const polyhouseInsectShadeNets = '/agrimart/polyhouse/insect-shade-nets';
  static const polyhouseClimateVentilation = '/agrimart/polyhouse/climate-ventilation';
  static const polyhouseMistingFogging = '/agrimart/polyhouse/misting-fogging';
  static const polyhousePlumbingDistribution = '/agrimart/polyhouse/plumbing-distribution';
  static const vegetableSeeds = '/agrimart/seeds/vegetable';
  static const fruitSeeds     = '/agrimart/seeds/fruit';
  static const leafyHerbSeeds = '/agrimart/seeds/leafy-herb';
  static const growingMedia   = '/agrimart/seeds/growing-media';
  static const plantNutrition = '/agrimart/seeds/plant-nutrition';
  static const plantProtection = '/agrimart/seeds/plant-protection';
  static const plantGrowthRegulators = '/agrimart/seeds/plant-growth-regulators';
  static const mulchingWeedControl = '/agrimart/seeds/mulching-weed-control';

  // ── Hubs ─────────────────────────────
  static const hubs           = '/hubs';
  static const profile        = '/hubs/profile';
  static const editProfile    = '/hubs/profile/edit';
  static const vendor         = '/hubs/vendor';
  static const finance        = '/hubs/finance';
  static const wallet         = '/hubs/finance/wallet';
  static const learn          = '/course';
  static const jobs           = '/hubs/jobs';
  static const opportunities  = '/hubs/opportunities';
}
