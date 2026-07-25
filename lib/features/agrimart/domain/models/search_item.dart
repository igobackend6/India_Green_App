import '../../../../core/router/route_names.dart';

class ProductSearchItem {
  final String title;
  final String categoryPath;
  final String route;

  const ProductSearchItem({
    required this.title,
    required this.categoryPath,
    required this.route,
  });
}

const List<ProductSearchItem> globalProductDirectory = [
  // Seeds
  ProductSearchItem(title: 'Vegetable Seeds', categoryPath: 'Agri-Farming > Seeds', route: Routes.vegetableSeeds),
  ProductSearchItem(title: 'Fruit Seeds', categoryPath: 'Agri-Farming > Seeds', route: Routes.fruitSeeds),
  ProductSearchItem(title: 'Leafy & Herb Seeds', categoryPath: 'Agri-Farming > Seeds', route: Routes.leafyHerbSeeds),
  ProductSearchItem(title: 'Growing Media & Substrates', categoryPath: 'Agri-Farming > Seeds', route: Routes.growingMedia),
  ProductSearchItem(title: 'Plant Nutrition & Fertilizers', categoryPath: 'Agri-Farming > Seeds', route: Routes.plantNutrition),
  ProductSearchItem(title: 'Plant Protection (IPM)', categoryPath: 'Agri-Farming > Seeds', route: Routes.plantProtection),
  ProductSearchItem(title: 'Plant Growth Regulators', categoryPath: 'Agri-Farming > Seeds', route: Routes.plantGrowthRegulators),
  ProductSearchItem(title: 'Mulching & Weed Control', categoryPath: 'Agri-Farming > Seeds', route: Routes.mulchingWeedControl),
  
  // Polyhouse Structure
  ProductSearchItem(title: 'Structural Frames & Parts', categoryPath: 'Polyhouse Structure', route: Routes.polyhouseStructuralFrames),
  ProductSearchItem(title: 'Greenhouse Covering', categoryPath: 'Polyhouse Structure', route: Routes.polyhouseGreenhouseCovering),
  ProductSearchItem(title: 'Insect & Shade Nets', categoryPath: 'Polyhouse Structure', route: Routes.polyhouseInsectShadeNets),
  ProductSearchItem(title: 'Climate & Ventilation', categoryPath: 'Polyhouse Structure', route: Routes.polyhouseClimateVentilation),
  ProductSearchItem(title: 'Misting & Fogging', categoryPath: 'Polyhouse Structure', route: Routes.polyhouseMistingFogging),
  ProductSearchItem(title: 'Plumbing & Distribution', categoryPath: 'Polyhouse Structure', route: Routes.polyhousePlumbingDistribution),

  // Control & Automation
  ProductSearchItem(title: 'Dosing & Fertigation', categoryPath: 'Control & Automation', route: Routes.dosingFertigation),
  ProductSearchItem(title: 'Environmental Controllers', categoryPath: 'Control & Automation', route: Routes.environmentalControllers),
  ProductSearchItem(title: 'Smart Actuators & Motors', categoryPath: 'Control & Automation', route: Routes.smartActuatorsMotors),
  ProductSearchItem(title: 'Electrical Systems', categoryPath: 'Control & Automation', route: Routes.electricalSystems),

  // Horticulture Catalog
  ProductSearchItem(title: 'Vegetable Crops', categoryPath: 'Horticulture Catalog', route: Routes.vegetableCrops),
  ProductSearchItem(title: 'Flower Crops', categoryPath: 'Horticulture Catalog', route: Routes.flowerCrops),
  ProductSearchItem(title: 'Exotic Fruit Crops', categoryPath: 'Horticulture Catalog', route: Routes.exoticFruitCrops),
  ProductSearchItem(title: 'Medicinal & Herbs', categoryPath: 'Horticulture Catalog', route: Routes.medicinalHerbs),

  // Digital Agri & IOT
  ProductSearchItem(title: 'IOT Hardware & Nodes', categoryPath: 'Digital Agri & IOT', route: Routes.iotHardwareNodes),
  ProductSearchItem(title: 'Software & Dashboards', categoryPath: 'Digital Agri & IOT', route: Routes.softwareDashboards),
  ProductSearchItem(title: 'Digital Services', categoryPath: 'Digital Agri & IOT', route: Routes.digitalServices),

  // Post-Harvest & Legacy
  ProductSearchItem(title: 'Harvesting & Cold Chain', categoryPath: 'Post-Harvest & Legacy', route: Routes.harvestingColdChain),
  ProductSearchItem(title: 'Aquaculture Solutions', categoryPath: 'Post-Harvest & Legacy', route: Routes.aquacultureSolutions),
  ProductSearchItem(title: 'Livestock Ecosystems', categoryPath: 'Post-Harvest & Legacy', route: Routes.livestockEcosystems),
];
