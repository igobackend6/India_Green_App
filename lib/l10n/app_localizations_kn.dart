// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get appTitle => 'ಇಂಡಿಯಾ ಗ್ರೀನ್ ಆ್ಯಪ್';

  @override
  String get tagline => 'ಒಂದು ಆ್ಯಪ್. ಪ್ರತಿ ರೈತ. ಪ್ರತಿ ಪಾಲುದಾರ.';

  @override
  String get navHome => 'ಹೋಮ್';

  @override
  String get navMarket => 'ಉತ್ಪನ್ನಗಳು';

  @override
  String get navMandi => 'ಮಂಡಿ';

  @override
  String get navServices => 'ಸೇವೆಗಳು';

  @override
  String get navAiDoc => 'AI ಡಾಕ್ಟರ್';

  @override
  String get navHubs => 'ಹಬ್‌ಗಳು';

  @override
  String welcomeUser(String name) {
    return 'ಸ್ವಾಗತ, $name!';
  }

  @override
  String get salemFarmerHub => 'ಸೇಲಂ ರೈತ ಹಬ್';

  @override
  String get selectLanguage => 'ನಿಮ್ಮ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get selectLanguageSubtitle =>
      'ಮುಂದುವರಿಸಲು ನಿಮ್ಮ ಆದ್ಯತೆಯ ಭಾಷೆಯನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get selectRoles => 'ನಿಮ್ಮ ಪಾತ್ರಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get selectRolesSubtitle =>
      'ನಿಮ್ಮನ್ನು ವಿವರಿಸುವ ಒಂದು ಅಥವಾ ಹೆಚ್ಚಿನ ಪಾತ್ರಗಳನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String get continueBtn => 'ಮುಂದುವರಿಸಿ';

  @override
  String get loginWithOtp => 'OTP ಮೂಲಕ ಲಾಗಿನ್ ಮಾಡಿ';

  @override
  String get enterPhone => 'ಮೊಬೈಲ್ ಸಂಖ್ಯೆಯನ್ನು ನಮೂದಿಸಿ';

  @override
  String get enterOtp => '6 ಅಂಕಿಗಳ OTP ನಮೂದಿಸಿ';

  @override
  String get verifyOtp => 'OTP ಪರಿಶೀಲಿಸಿ';

  @override
  String get sendOtp => 'OTP ಕಳುಹಿಸಿ';

  @override
  String get resendOtp => 'OTP ಅನ್ನು ಮತ್ತೆ ಕಳುಹಿಸಿ';

  @override
  String get enterName => 'ನಿಮ್ಮ ಹೆಸರನ್ನು ನಮೂದಿಸಿ';

  @override
  String get enterPincode => 'ಪಿನ್‌ಕೋಡ್ ನಮೂದಿಸಿ';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone ಗೆ OTP ಕಳುಹಿಸಲಾಗಿದೆ';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'ಬಾಸ್ಕೆಟ್‌ಗೆ ಸೇರಿಸಿ';

  @override
  String get placeOrder => 'ಆರ್ಡರ್ ಮಾಡಿ';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ವಸ್ತುಗಳು',
      one: '1 ವಸ್ತು',
      zero: 'ಖಾಲಿ ಬಾಸ್ಕೆಟ್',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'ಬೆಳೆ ವೈದ್ಯ';

  @override
  String get askCropDoctor => 'ನಿಮ್ಮ ಬೆಳೆ ಸಮಸ್ಯೆಯನ್ನು ವಿವರಿಸಿ...';

  @override
  String get diagnosing => 'ಎಲೆಯ ಚಿತ್ರವನ್ನು ವಿಶ್ಲೇಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get farmWallet => 'ಫಾರ್ಮ್ ವಾಲೆಟ್';

  @override
  String get addMoney => 'ಹಣ ಸೇರಿಸಿ';

  @override
  String get applyLoan => 'ಸಾಲಕ್ಕಾಗಿ ಅರ್ಜಿ ಸಲ್ಲಿಸಿ';

  @override
  String get govtSchemes => 'ಸರ್ಕಾರಿ ಯೋಜನೆಗಳು';

  @override
  String get academy => 'IGO ಕ್ಲಾಸ್ ಅಕಾಡೆಮಿ';

  @override
  String get startLesson => 'ಪಾಠ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get lessonComplete => 'ಪಾಠ ಪೂರ್ಣಗೊಂಡಿದೆ!';

  @override
  String get jobPortal => 'ಕೃಷಿ ಉದ್ಯೋಗ ಪೋರ್ಟಲ್';

  @override
  String get applyNow => 'ಈಗಲೇ ಅರ್ಜಿ ಸಲ್ಲಿಸಿ';

  @override
  String get franchiseOpps => 'ಫ್ರಾಂಚೈಸ್ ಅವಕಾಶಗಳು';

  @override
  String get jointVentures => 'ಜಂಟಿ ಉದ್ಯಮಗಳು';

  @override
  String get landListings => 'ಕೃಷಿ ಭೂಮಿ ಪಟ್ಟಿಗಳು';

  @override
  String get vendorDashboard => 'ಮಾರಾಟಗಾರ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್';

  @override
  String get myProfile => 'ನನ್ನ ಪ್ರೊಫೈಲ್';

  @override
  String get settings => 'ಸೆಟ್ಟಿಂಗ್‌ಗಳು';

  @override
  String get logout => 'ಲಾಗ್ ಔಟ್';

  @override
  String get markAllRead => 'ಎಲ್ಲವನ್ನೂ ಓದಿದಂತೆ ಗುರುತಿಸಿ';

  @override
  String get clearAll => 'ಎಲ್ಲವನ್ನೂ ತೆರವುಗೊಳಿಸಿ';

  @override
  String get notifications => 'ಅಧಿಸೂಚನೆಗಳು';

  @override
  String get noNotifications => 'ಇನ್ನೂ ಯಾವುದೇ ಅಧಿಸೂಚನೆಗಳಿಲ್ಲ';

  @override
  String get hubProfile => 'ನನ್ನ ಪ್ರೊಫೈಲ್';

  @override
  String get hubVendor => 'ಮಾರಾಟಗಾರ ಡ್ಯಾಶ್‌ಬೋರ್ಡ್';

  @override
  String get hubFinance => 'ಫಾರ್ಮ್ ವಾಲೆಟ್ ಮತ್ತು ಸಾಲಗಳು';

  @override
  String get hubLearn => 'ಕ್ಲಾಸ್ ಅಕಾಡೆಮಿ';

  @override
  String get hubOpps => 'ಎಸ್ಟೇಟ್‌ಗಳು ಮತ್ತು ಫ್ರಾಂಚೈಸ್‌ಗಳು';

  @override
  String get hubJobs => 'ಕೃಷಿ ಉದ್ಯೋಗ ಪೋರ್ಟಲ್';

  @override
  String get comingSoon => 'ಶೀಘ್ರದಲ್ಲೇ ಬರಲಿದೆ';

  @override
  String get featureUnderDevelopment => 'ಈ ವೈಶಿಷ್ಟ್ಯ ಅಭಿವೃದ್ಧಿಯಲ್ಲಿದೆ';

  @override
  String get quickActions => 'ತ್ವರಿತ ಕ್ರಿಯೆಗಳು';

  @override
  String get igoBrands => 'IGO ಗ್ರೂಪ್ಸ್';

  @override
  String get viewAll => 'ಎಲ್ಲಾ ವೀಕ್ಷಿಸಿ';

  @override
  String get searchProducts => 'ಉತ್ಪನ್ನಗಳನ್ನು ಹುಡುಕಿ...';

  @override
  String get categories => 'ವರ್ಗಗಳು';

  @override
  String get roleFarmer => 'ರೈತ';

  @override
  String get roleFarmerDesc =>
      'ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಖರೀದಿಸಿ, ಉತ್ಪನ್ನಗಳನ್ನು ಮಾರಿ, ಬೆಳೆ ಸಲಹೆ ಪಡೆಯಿರಿ';

  @override
  String get roleVendor => 'ಮಾರಾಟಗಾರ';

  @override
  String get roleVendorDesc =>
      'ಉತ್ಪನ್ನಗಳನ್ನು ಪಟ್ಟಿ ಮಾಡಿ, ಆರ್ಡರ್‌ಗಳನ್ನು ನಿರ್ವಹಿಸಿ, ಪಾವತಿಗಳನ್ನು ವೀಕ್ಷಿಸಿ';

  @override
  String get roleConsumer => 'ಗ್ರಾಹಕ';

  @override
  String get roleConsumerDesc =>
      'ಫಾರ್ಮ್‌ಗಳಿಂದ ತಾಜಾ ಸಾವಯವ ಉತ್ಪನ್ನಗಳನ್ನು ಖರೀದಿಸಿ';

  @override
  String get roleInvestor => 'ಹೂಡಿಕೆದಾರ';

  @override
  String get roleInvestorDesc =>
      'ಕೃಷಿ ಭೂಮಿ, ಬಾಂಡ್‌ಗಳು ಅಥವಾ ಫ್ರಾಂಚೈಸ್‌ನಲ್ಲಿ ಹೂಡಿಕೆ ಮಾಡಿ';

  @override
  String get roleJobSeeker => 'ಉದ್ಯೋಗಾಕಾಂಕ್ಷಿ';

  @override
  String get roleJobSeekerDesc => 'ಭಾರತದಾದ್ಯಂತ ಕೃಷಿ ಉದ್ಯೋಗಗಳನ್ನು ಹುಡುಕಿ';

  @override
  String get roleFranchise => 'ಫ್ರಾಂಚೈಸ್ ಪಾಲುದಾರ';

  @override
  String get roleFranchiseDesc =>
      'ಅಧಿಕೃತ FICO ಶಾಖೆಗಳನ್ನು ಪ್ರಾರಂಭಿಸಿ ಮತ್ತು ಬೆಳೆಸಿ';

  @override
  String get selectAtLeastOneRole => 'ಕನಿಷ್ಠ ಒಂದು ಪಾತ್ರವನ್ನು ಆಯ್ಕೆಮಾಡಿ';

  @override
  String continueWithRoles(int count) {
    return '$count ಪಾತ್ರಗಳೊಂದಿಗೆ ಮುಂದುವರಿಸಿ';
  }

  @override
  String get buyInputs => 'ಇನ್‌ಪುಟ್‌ಗಳನ್ನು ಖರೀದಿಸಿ';

  @override
  String get sellProduce => 'ಉತ್ಪನ್ನಗಳನ್ನು ಮಾರಿ';

  @override
  String get mandiPrices => 'ಮಂಡಿ ಬೆಲೆಗಳು';

  @override
  String get loanApply => 'ಸಾಲ ಅರ್ಜಿ';

  @override
  String get agriJobs => 'ಕೃಷಿ ಉದ್ಯೋಗಗಳು';

  @override
  String get igoAcademy => 'IGO ಅಕಾಡೆಮಿ';

  @override
  String get franchise => 'ಫ್ರಾಂಚೈಸ್';

  @override
  String get language => 'ಭಾಷೆ';

  @override
  String get darkMode => 'ಡಾರ್ಕ್ ಮೋಡ್';

  @override
  String get notificationPrefs => 'ಅಧಿಸೂಚನೆ ಆದ್ಯತೆಗಳು';

  @override
  String get aboutApp => 'INDIA GREEN APP ಬಗ್ಗೆ';

  @override
  String get seedsCategory => 'ಕೃಷಿ\nಇನ್‌ಪುಟ್‌ಗಳು';

  @override
  String get polyhouseCategory => 'ಪಾಲಿಹೌಸ್\nರಚನೆ';

  @override
  String get horticultureCatalogCategory => 'ತೋಟಗಾರಿಕೆ\nಕ್ಯಾಟಲಾಗ್';

  @override
  String get controlAutomationCategory => 'ನಿಯಂತ್ರಣ ಮತ್ತು\nಆಟೊಮೇಶನ್';

  @override
  String get digitalAgriCategory => 'ಡಿಜಿಟಲ್ ಕೃಷಿ\n& IoT';

  @override
  String get postHarvestLegacyCategory => 'ಕೊಯ್ಲಿನ ನಂತರ\n& ಪಾರಂಪರಿಕ';

  @override
  String get featuredProducts => 'ವೈಶಿಷ್ಟ್ಯಗೊಳಿಸಿದ ಉತ್ಪನ್ನಗಳು';

  @override
  String get addToCart => 'ಕಾರ್ಟ್‌ಗೆ ಸೇರಿಸಿ';

  @override
  String get liveMandiPrices => 'ಲೈವ್ ಮಂಡಿ ಬೆಲೆಗಳು';

  @override
  String get salemApmcMarket => 'ಸೇಲಂ APMC ಮಾರುಕಟ್ಟೆ';

  @override
  String get change => 'ಬದಲಾವಣೆ';

  @override
  String get arrival => 'ಆಗಮನ';

  @override
  String get scanCropDisease => 'ಬೆಳೆ ರೋಗವನ್ನು ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String get scanCropDiseaseDesc =>
      'ತಕ್ಷಣದ AI ರೋಗನಿರ್ಣಯ ಮತ್ತು ಚಿಕಿತ್ಸಾ ಶಿಫಾರಸುಗಳನ್ನು ಪಡೆಯಲು ನಿಮ್ಮ ಬೆಳೆಯ ಪೀಡಿತ ಎಲೆಯ ಫೋಟೋ ತೆಗೆಯಿರಿ.';

  @override
  String get openCamera => 'ಕ್ಯಾಮೆರಾ ತೆರೆಯಿರಿ';

  @override
  String get analyzePhoto => 'ಫೋಟೋ ವಿಶ್ಲೇಷಿಸಿ';

  @override
  String get analyzing => 'ನಿಮ್ಮ ಬೆಳೆಯನ್ನು ವಿಶ್ಲೇಷಿಸಲಾಗುತ್ತಿದೆ...';

  @override
  String get navProjects => 'ಯೋಜನೆಗಳು';

  @override
  String get navCourse => 'ಕೋರ್ಸ್';

  @override
  String get projectsTitle => 'ಯೋಜನೆಗಳು';

  @override
  String get agriFarmingProjects => 'ಕೃಷಿ ಯೋಜನೆಗಳು';

  @override
  String get aquacultureProjects => 'ಜಲಕೃಷಿ ಯೋಜನೆಗಳು';

  @override
  String get livestockFarmingProjects => 'ಜಾನುವಾರು ಸಾಕಣೆ ಯೋಜನೆಗಳು';

  @override
  String get farmEngineeringProjects => 'ಕೃಷಿ ಎಂಜಿನಿಯರಿಂಗ್ ಯೋಜನೆಗಳು';

  @override
  String get userDetailsTitle => 'ನಿಮ್ಮ ಬಗ್ಗೆ ಹೇಳಿ';

  @override
  String get userDetailsSubtitle =>
      'ನಿಮ್ಮ ಅನುಭವವನ್ನು ವೈಯಕ್ತಿಕಗೊಳಿಸಲು ಕೆಲವು ವಿವರಗಳು';

  @override
  String get enterAddress => 'ನಿಮ್ಮ ಗ್ರಾಮ / ಪಟ್ಟಣವನ್ನು ನಮೂದಿಸಿ';

  @override
  String get addressHint => 'ಗ್ರಾಮ, ತಾಲೂಕು, ಜಿಲ್ಲೆ';

  @override
  String get completeProfile => 'ಪ್ರೊಫೈಲ್ ಪೂರ್ಣಗೊಳಿಸಿ ಮತ್ತು ಆ್ಯಪ್ ಪ್ರವೇಶಿಸಿ';
}
