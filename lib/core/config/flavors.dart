enum Flavor {
  dev,
  stg,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'IGO Dev';
      case Flavor.stg:
        return 'IGO Stg';
      case Flavor.prod:
        return 'INDIA GREEN APP';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://dev-api.igoconnection.com';
      case Flavor.stg:
        return 'https://stg-api.igoconnection.com';
      case Flavor.prod:
        return 'https://api.igoconnection.com';
      default:
        return 'https://api.igoconnection.com';
    }
  }
}
