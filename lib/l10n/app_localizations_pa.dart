// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get appTitle => 'ਇੰਡੀਆ ਗ੍ਰੀਨ ਐਪ';

  @override
  String get tagline => 'ਇੱਕ ਐਪ। ਹਰ ਕਿਸਾਨ। ਹਰ ਭਾਈਵਾਲ।';

  @override
  String get navHome => 'ਹੋਮ';

  @override
  String get navMarket => 'ਉਤਪਾਦ';

  @override
  String get navMandi => 'ਮੰਡੀ';

  @override
  String get navServices => 'ਸੇਵਾਵਾਂ';

  @override
  String get navAiDoc => 'AI ਡਾਕਟਰ';

  @override
  String get navHubs => 'ਹੱਬ';

  @override
  String welcomeUser(String name) {
    return 'ਜੀ ਆਇਆਂ ਨੂੰ, $name!';
  }

  @override
  String get salemFarmerHub => 'ਸਲੇਮ ਕਿਸਾਨ ਹੱਬ';

  @override
  String get selectLanguage => 'ਆਪਣੀ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get selectLanguageSubtitle => 'ਜਾਰੀ ਰੱਖਣ ਲਈ ਆਪਣੀ ਪਸੰਦੀਦਾ ਭਾਸ਼ਾ ਚੁਣੋ';

  @override
  String get selectRoles => 'ਆਪਣੀਆਂ ਭੂਮਿਕਾਵਾਂ ਚੁਣੋ';

  @override
  String get selectRolesSubtitle =>
      'ਤੁਹਾਨੂੰ ਦਰਸਾਉਂਦੀਆਂ ਇੱਕ ਜਾਂ ਵੱਧ ਭੂਮਿਕਾਵਾਂ ਚੁਣੋ';

  @override
  String get continueBtn => 'ਜਾਰੀ ਰੱਖੋ';

  @override
  String get loginWithOtp => 'OTP ਨਾਲ ਲੌਗਇਨ ਕਰੋ';

  @override
  String get enterPhone => 'ਮੋਬਾਈਲ ਨੰਬਰ ਦਰਜ ਕਰੋ';

  @override
  String get enterOtp => '6-ਅੰਕਾਂ ਦਾ OTP ਦਰਜ ਕਰੋ';

  @override
  String get verifyOtp => 'OTP ਦੀ ਪੁਸ਼ਟੀ ਕਰੋ';

  @override
  String get sendOtp => 'OTP ਭੇਜੋ';

  @override
  String get resendOtp => 'OTP ਦੁਬਾਰਾ ਭੇਜੋ';

  @override
  String get enterName => 'ਆਪਣਾ ਨਾਮ ਦਰਜ ਕਰੋ';

  @override
  String get enterPincode => 'ਪਿਨਕੋਡ ਦਰਜ ਕਰੋ';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone \'ਤੇ OTP ਭੇਜਿਆ ਗਿਆ';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'ਟੋਕਰੀ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get placeOrder => 'ਆਰਡਰ ਕਰੋ';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਵਸਤੂਆਂ',
      one: '1 ਵਸਤੂ',
      zero: 'ਖਾਲੀ ਟੋਕਰੀ',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'ਫਸਲ ਡਾਕਟਰ';

  @override
  String get askCropDoctor => 'ਆਪਣੀ ਫਸਲ ਦੀ ਸਮੱਸਿਆ ਦੱਸੋ...';

  @override
  String get diagnosing => 'ਪੱਤੇ ਦੀ ਤਸਵੀਰ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get farmWallet => 'ਫਾਰਮ ਵਾਲਿਟ';

  @override
  String get addMoney => 'ਪੈਸੇ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get applyLoan => 'ਲੋਨ ਲਈ ਅਰਜ਼ੀ ਦਿਓ';

  @override
  String get govtSchemes => 'ਸਰਕਾਰੀ ਯੋਜਨਾਵਾਂ';

  @override
  String get academy => 'IGO ਕਲਾਸ ਅਕੈਡਮੀ';

  @override
  String get startLesson => 'ਪਾਠ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get lessonComplete => 'ਪਾਠ ਪੂਰਾ ਹੋਇਆ!';

  @override
  String get jobPortal => 'ਖੇਤੀ ਨੌਕਰੀ ਪੋਰਟਲ';

  @override
  String get applyNow => 'ਹੁਣੇ ਅਰਜ਼ੀ ਦਿਓ';

  @override
  String get franchiseOpps => 'ਫਰੈਂਚਾਈਜ਼ੀ ਮੌਕੇ';

  @override
  String get jointVentures => 'ਸਾਂਝੇ ਉੱਦਮ';

  @override
  String get landListings => 'ਖੇਤੀ ਜ਼ਮੀਨ ਸੂਚੀ';

  @override
  String get vendorDashboard => 'ਵਿਕਰੇਤਾ ਡੈਸ਼ਬੋਰਡ';

  @override
  String get myProfile => 'ਮੇਰੀ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get settings => 'ਸੈਟਿੰਗਾਂ';

  @override
  String get logout => 'ਲੌਗ ਆਊਟ';

  @override
  String get markAllRead => 'ਸਾਰਿਆਂ ਨੂੰ ਪੜ੍ਹਿਆ ਗਿਆ ਵਜੋਂ ਚਿੰਨ੍ਹਿਤ ਕਰੋ';

  @override
  String get clearAll => 'ਸਾਰਾ ਸਾਫ਼ ਕਰੋ';

  @override
  String get notifications => 'ਸੂਚਨਾਵਾਂ';

  @override
  String get noNotifications => 'ਹਾਲੇ ਕੋਈ ਸੂਚਨਾ ਨਹੀਂ';

  @override
  String get hubProfile => 'ਮੇਰੀ ਪ੍ਰੋਫਾਈਲ';

  @override
  String get hubVendor => 'ਵਿਕਰੇਤਾ ਡੈਸ਼ਬੋਰਡ';

  @override
  String get hubFinance => 'ਫਾਰਮ ਵਾਲਿਟ ਅਤੇ ਲੋਨ';

  @override
  String get hubLearn => 'ਕਲਾਸ ਅਕੈਡਮੀ';

  @override
  String get hubOpps => 'ਜਾਇਦਾਦਾਂ ਅਤੇ ਫਰੈਂਚਾਈਜ਼ੀਆਂ';

  @override
  String get hubJobs => 'ਖੇਤੀ ਨੌਕਰੀ ਪੋਰਟਲ';

  @override
  String get comingSoon => 'ਜਲਦੀ ਆ ਰਿਹਾ ਹੈ';

  @override
  String get featureUnderDevelopment => 'ਇਹ ਵਿਸ਼ੇਸ਼ਤਾ ਵਿਕਾਸ ਅਧੀਨ ਹੈ';

  @override
  String get quickActions => 'ਤੁਰੰਤ ਕਾਰਵਾਈਆਂ';

  @override
  String get igoBrands => 'IGO ਗਰੁੱਪਸ';

  @override
  String get viewAll => 'ਸਾਰੇ ਵੇਖੋ';

  @override
  String get searchProducts => 'ਉਤਪਾਦ ਖੋਜੋ...';

  @override
  String get categories => 'ਸ਼੍ਰੇਣੀਆਂ';

  @override
  String get roleFarmer => 'ਕਿਸਾਨ';

  @override
  String get roleFarmerDesc => 'ਇਨਪੁਟ ਖਰੀਦੋ, ਉਪਜ ਵੇਚੋ, ਫਸਲ ਸਲਾਹ ਲਓ';

  @override
  String get roleVendor => 'ਵਿਕਰੇਤਾ';

  @override
  String get roleVendorDesc =>
      'ਉਤਪਾਦ ਸੂਚੀਬੱਧ ਕਰੋ, ਆਰਡਰ ਪ੍ਰਬੰਧਿਤ ਕਰੋ, ਭੁਗਤਾਨ ਵੇਖੋ';

  @override
  String get roleConsumer => 'ਖਪਤਕਾਰ';

  @override
  String get roleConsumerDesc => 'ਖੇਤਾਂ ਤੋਂ ਤਾਜ਼ੇ ਜੈਵਿਕ ਉਤਪਾਦ ਖਰੀਦੋ';

  @override
  String get roleInvestor => 'ਨਿਵੇਸ਼ਕ';

  @override
  String get roleInvestorDesc =>
      'ਖੇਤੀ ਜ਼ਮੀਨ, ਬਾਂਡ ਜਾਂ ਫਰੈਂਚਾਈਜ਼ੀ ਵਿੱਚ ਨਿਵੇਸ਼ ਕਰੋ';

  @override
  String get roleJobSeeker => 'ਨੌਕਰੀ ਭਾਲਣ ਵਾਲਾ';

  @override
  String get roleJobSeekerDesc => 'ਪੂਰੇ ਭਾਰਤ ਵਿੱਚ ਖੇਤੀ ਨੌਕਰੀਆਂ ਖੋਜੋ';

  @override
  String get roleFranchise => 'ਫਰੈਂਚਾਈਜ਼ੀ ਭਾਈਵਾਲ';

  @override
  String get roleFranchiseDesc => 'ਅਧਿਕਾਰਤ FICO ਸ਼ਾਖਾਵਾਂ ਸ਼ੁਰੂ ਕਰੋ ਅਤੇ ਵਧਾਓ';

  @override
  String get selectAtLeastOneRole => 'ਘੱਟੋ-ਘੱਟ ਇੱਕ ਭੂਮਿਕਾ ਚੁਣੋ';

  @override
  String continueWithRoles(int count) {
    return '$count ਭੂਮਿਕਾਵਾਂ ਨਾਲ ਜਾਰੀ ਰੱਖੋ';
  }

  @override
  String get buyInputs => 'ਇਨਪੁਟ ਖਰੀਦੋ';

  @override
  String get sellProduce => 'ਉਪਜ ਵੇਚੋ';

  @override
  String get mandiPrices => 'ਮੰਡੀ ਭਾਅ';

  @override
  String get loanApply => 'ਲੋਨ ਅਰਜ਼ੀ';

  @override
  String get agriJobs => 'ਖੇਤੀ ਨੌਕਰੀਆਂ';

  @override
  String get igoAcademy => 'IGO ਅਕੈਡਮੀ';

  @override
  String get franchise => 'ਫਰੈਂਚਾਈਜ਼ੀ';

  @override
  String get language => 'ਭਾਸ਼ਾ';

  @override
  String get darkMode => 'ਡਾਰਕ ਮੋਡ';

  @override
  String get notificationPrefs => 'ਸੂਚਨਾ ਤਰਜੀਹਾਂ';

  @override
  String get aboutApp => 'INDIA GREEN APP ਬਾਰੇ';

  @override
  String get seedsCategory => 'ਖੇਤੀ\nਇਨਪੁਟ';

  @override
  String get polyhouseCategory => 'ਪੌਲੀਹਾਊਸ\nਢਾਂਚਾ';

  @override
  String get horticultureCatalogCategory => 'ਬਾਗਬਾਨੀ\nਕੈਟਾਲਾਗ';

  @override
  String get controlAutomationCategory => 'ਕੰਟਰੋਲ ਅਤੇ\nਆਟੋਮੇਸ਼ਨ';

  @override
  String get digitalAgriCategory => 'ਡਿਜੀਟਲ ਖੇਤੀ\nਅਤੇ IoT';

  @override
  String get postHarvestLegacyCategory => 'ਵਾਢੀ ਤੋਂ ਬਾਅਦ\nਅਤੇ ਵਿਰਾਸਤ';

  @override
  String get featuredProducts => 'ਵਿਸ਼ੇਸ਼ ਉਤਪਾਦ';

  @override
  String get addToCart => 'ਕਾਰਟ ਵਿੱਚ ਸ਼ਾਮਲ ਕਰੋ';

  @override
  String get liveMandiPrices => 'ਲਾਈਵ ਮੰਡੀ ਭਾਅ';

  @override
  String get salemApmcMarket => 'ਸਲੇਮ APMC ਮੰਡੀ';

  @override
  String get change => 'ਤਬਦੀਲੀ';

  @override
  String get arrival => 'ਆਮਦ';

  @override
  String get scanCropDisease => 'ਫਸਲ ਦੀ ਬਿਮਾਰੀ ਸਕੈਨ ਕਰੋ';

  @override
  String get scanCropDiseaseDesc =>
      'ਤੁਰੰਤ AI ਨਿਦਾਨ ਅਤੇ ਇਲਾਜ ਸਿਫ਼ਾਰਸ਼ਾਂ ਲਈ ਆਪਣੀ ਪ੍ਰਭਾਵਿਤ ਫਸਲ ਦੇ ਪੱਤੇ ਦੀ ਫੋਟੋ ਲਓ।';

  @override
  String get openCamera => 'ਕੈਮਰਾ ਖੋਲ੍ਹੋ';

  @override
  String get analyzePhoto => 'ਫੋਟੋ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਕਰੋ';

  @override
  String get analyzing => 'ਤੁਹਾਡੀ ਫਸਲ ਦਾ ਵਿਸ਼ਲੇਸ਼ਣ ਹੋ ਰਿਹਾ ਹੈ...';

  @override
  String get navProjects => 'ਪ੍ਰੋਜੈਕਟ';

  @override
  String get navCourse => 'ਕੋਰਸ';

  @override
  String get projectsTitle => 'ਪ੍ਰੋਜੈਕਟ';

  @override
  String get agriFarmingProjects => 'ਖੇਤੀ ਪ੍ਰੋਜੈਕਟ';

  @override
  String get aquacultureProjects => 'ਜਲ-ਖੇਤੀ ਪ੍ਰੋਜੈਕਟ';

  @override
  String get livestockFarmingProjects => 'ਪਸ਼ੂ ਪਾਲਣ ਪ੍ਰੋਜੈਕਟ';

  @override
  String get farmEngineeringProjects => 'ਖੇਤੀ ਇੰਜੀਨੀਅਰਿੰਗ ਪ੍ਰੋਜੈਕਟ';

  @override
  String get userDetailsTitle => 'ਸਾਨੂੰ ਆਪਣੇ ਬਾਰੇ ਦੱਸੋ';

  @override
  String get userDetailsSubtitle =>
      'ਤੁਹਾਡੇ ਅਨੁਭਵ ਨੂੰ ਵਿਅਕਤੀਗਤ ਬਣਾਉਣ ਲਈ ਕੁਝ ਵੇਰਵੇ';

  @override
  String get enterAddress => 'ਆਪਣਾ ਪਿੰਡ / ਸ਼ਹਿਰ ਦਰਜ ਕਰੋ';

  @override
  String get addressHint => 'ਪਿੰਡ, ਤਹਿਸੀਲ, ਜ਼ਿਲ੍ਹਾ';

  @override
  String get completeProfile => 'ਪ੍ਰੋਫਾਈਲ ਪੂਰੀ ਕਰੋ ਅਤੇ ਐਪ ਵਿੱਚ ਦਾਖਲ ਹੋਵੋ';
}
