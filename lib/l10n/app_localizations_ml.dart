// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get appTitle => 'ഇന്ത്യ ഗ്രീൻ ആപ്പ്';

  @override
  String get tagline => 'ഒരു ആപ്പ്. എല്ലാ കർഷകനും. എല്ലാ പങ്കാളിക്കും.';

  @override
  String get navHome => 'ഹോം';

  @override
  String get navMarket => 'ഉൽപ്പന്നങ്ങൾ';

  @override
  String get navMandi => 'മണ്ടി';

  @override
  String get navServices => 'സേവനങ്ങൾ';

  @override
  String get navAiDoc => 'AI ഡോക്ടർ';

  @override
  String get navHubs => 'ഹബ്ബുകൾ';

  @override
  String welcomeUser(String name) {
    return 'സ്വാഗതം, $name!';
  }

  @override
  String get salemFarmerHub => 'സേലം കർഷക ഹബ്';

  @override
  String get selectLanguage => 'നിങ്ങളുടെ ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get selectLanguageSubtitle =>
      'തുടരാൻ നിങ്ങൾക്കിഷ്ടമുള്ള ഭാഷ തിരഞ്ഞെടുക്കുക';

  @override
  String get selectRoles => 'നിങ്ങളുടെ റോളുകൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get selectRolesSubtitle =>
      'നിങ്ങളെ വിവരിക്കുന്ന ഒന്നോ അതിലധികമോ റോളുകൾ തിരഞ്ഞെടുക്കുക';

  @override
  String get continueBtn => 'തുടരുക';

  @override
  String get loginWithOtp => 'OTP ഉപയോഗിച്ച് ലോഗിൻ ചെയ്യുക';

  @override
  String get enterPhone => 'മൊബൈൽ നമ്പർ നൽകുക';

  @override
  String get enterOtp => '6 അക്ക OTP നൽകുക';

  @override
  String get verifyOtp => 'OTP സ്ഥിരീകരിക്കുക';

  @override
  String get sendOtp => 'OTP അയയ്ക്കുക';

  @override
  String get resendOtp => 'OTP വീണ്ടും അയയ്ക്കുക';

  @override
  String get enterName => 'നിങ്ങളുടെ പേര് നൽകുക';

  @override
  String get enterPincode => 'പിൻകോഡ് നൽകുക';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone എന്നതിലേക്ക് OTP അയച്ചു';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'ബാസ്കറ്റിലേക്ക് ചേർക്കുക';

  @override
  String get placeOrder => 'ഓർഡർ ചെയ്യുക';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ഇനങ്ങൾ',
      one: '1 ഇനം',
      zero: 'കാലി ബാസ്കറ്റ്',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'വിള ഡോക്ടർ';

  @override
  String get askCropDoctor => 'നിങ്ങളുടെ വിള പ്രശ്നം വിവരിക്കുക...';

  @override
  String get diagnosing => 'ഇല ചിത്രം വിശകലനം ചെയ്യുന്നു...';

  @override
  String get farmWallet => 'ഫാം വാലറ്റ്';

  @override
  String get addMoney => 'പണം ചേർക്കുക';

  @override
  String get applyLoan => 'വായ്പയ്ക്ക് അപേക്ഷിക്കുക';

  @override
  String get govtSchemes => 'സർക്കാർ പദ്ധതികൾ';

  @override
  String get academy => 'IGO ക്ലാസ് അക്കാദമി';

  @override
  String get startLesson => 'പാഠം ആരംഭിക്കുക';

  @override
  String get lessonComplete => 'പാഠം പൂർത്തിയായി!';

  @override
  String get jobPortal => 'കാർഷിക ജോലി പോർട്ടൽ';

  @override
  String get applyNow => 'ഇപ്പോൾ അപേക്ഷിക്കുക';

  @override
  String get franchiseOpps => 'ഫ്രാഞ്ചൈസി അവസരങ്ങൾ';

  @override
  String get jointVentures => 'സംയുക്ത സംരംഭങ്ങൾ';

  @override
  String get landListings => 'കൃഷിഭൂമി ലിസ്റ്റിംഗുകൾ';

  @override
  String get vendorDashboard => 'വെണ്ടർ ഡാഷ്ബോർഡ്';

  @override
  String get myProfile => 'എന്റെ പ്രൊഫൈൽ';

  @override
  String get settings => 'സെറ്റിംഗുകൾ';

  @override
  String get logout => 'ലോഗൗട്ട്';

  @override
  String get markAllRead => 'എല്ലാം വായിച്ചതായി അടയാളപ്പെടുത്തുക';

  @override
  String get clearAll => 'എല്ലാം മായ്ക്കുക';

  @override
  String get notifications => 'അറിയിപ്പുകൾ';

  @override
  String get noNotifications => 'ഇതുവരെ അറിയിപ്പുകളൊന്നുമില്ല';

  @override
  String get hubProfile => 'എന്റെ പ്രൊഫൈൽ';

  @override
  String get hubVendor => 'വെണ്ടർ ഡാഷ്ബോർഡ്';

  @override
  String get hubFinance => 'ഫാം വാലറ്റ് & വായ്പകൾ';

  @override
  String get hubLearn => 'ക്ലാസ് അക്കാദമി';

  @override
  String get hubOpps => 'എസ്റ്റേറ്റുകൾ & ഫ്രാഞ്ചൈസികൾ';

  @override
  String get hubJobs => 'കാർഷിക ജോലി പോർട്ടൽ';

  @override
  String get comingSoon => 'ഉടൻ വരുന്നു';

  @override
  String get featureUnderDevelopment => 'ഈ ഫീച്ചർ വികസനത്തിലാണ്';

  @override
  String get quickActions => 'ദ്രുത പ്രവർത്തനങ്ങൾ';

  @override
  String get igoBrands => 'IGO ഗ്രൂപ്പുകൾ';

  @override
  String get viewAll => 'എല്ലാം കാണുക';

  @override
  String get searchProducts => 'ഉൽപ്പന്നങ്ങൾ തിരയുക...';

  @override
  String get categories => 'വിഭാഗങ്ങൾ';

  @override
  String get roleFarmer => 'കർഷകൻ';

  @override
  String get roleFarmerDesc =>
      'ഇൻപുട്ടുകൾ വാങ്ങുക, ഉൽപ്പന്നം വിൽക്കുക, വിള ഉപദേശം നേടുക';

  @override
  String get roleVendor => 'വെണ്ടർ';

  @override
  String get roleVendorDesc =>
      'ഉൽപ്പന്നങ്ങൾ ലിസ്റ്റ് ചെയ്യുക, ഓർഡറുകൾ കൈകാര്യം ചെയ്യുക, പേയ്‌മെന്റുകൾ കാണുക';

  @override
  String get roleConsumer => 'ഉപഭോക്താവ്';

  @override
  String get roleConsumerDesc =>
      'ഫാമുകളിൽ നിന്ന് പുതിയ ജൈവ ഉൽപ്പന്നങ്ങൾ വാങ്ങുക';

  @override
  String get roleInvestor => 'നിക്ഷേപകൻ';

  @override
  String get roleInvestorDesc =>
      'കൃഷിഭൂമി, ബോണ്ടുകൾ, അല്ലെങ്കിൽ ഫ്രാഞ്ചൈസിയിൽ നിക്ഷേപിക്കുക';

  @override
  String get roleJobSeeker => 'ജോലി അന്വേഷകൻ';

  @override
  String get roleJobSeekerDesc => 'ഇന്ത്യയിലുടനീളം കാർഷിക ജോലികൾ തിരയുക';

  @override
  String get roleFranchise => 'ഫ്രാഞ്ചൈസി പങ്കാളി';

  @override
  String get roleFranchiseDesc => 'ഔദ്യോഗിക FICO ശാഖകൾ ആരംഭിച്ച് വളർത്തുക';

  @override
  String get selectAtLeastOneRole => 'കുറഞ്ഞത് ഒരു റോൾ എങ്കിലും തിരഞ്ഞെടുക്കുക';

  @override
  String continueWithRoles(int count) {
    return '$count റോളുകളുമായി തുടരുക';
  }

  @override
  String get buyInputs => 'ഇൻപുട്ടുകൾ വാങ്ങുക';

  @override
  String get sellProduce => 'ഉൽപ്പന്നം വിൽക്കുക';

  @override
  String get mandiPrices => 'മണ്ടി വിലകൾ';

  @override
  String get loanApply => 'വായ്പ അപേക്ഷ';

  @override
  String get agriJobs => 'കാർഷിക ജോലികൾ';

  @override
  String get igoAcademy => 'IGO അക്കാദമി';

  @override
  String get franchise => 'ഫ്രാഞ്ചൈസി';

  @override
  String get language => 'ഭാഷ';

  @override
  String get darkMode => 'ഡാർക്ക് മോഡ്';

  @override
  String get notificationPrefs => 'അറിയിപ്പ് മുൻഗണനകൾ';

  @override
  String get aboutApp => 'INDIA GREEN APP-നെക്കുറിച്ച്';

  @override
  String get seedsCategory => 'കാർഷിക\nഇൻപുട്ടുകൾ';

  @override
  String get polyhouseCategory => 'പോളിഹൗസ്\nഘടന';

  @override
  String get horticultureCatalogCategory => 'ഹോർട്ടികൾച്ചർ\nകാറ്റലോഗ്';

  @override
  String get controlAutomationCategory => 'നിയന്ത്രണവും\nഓട്ടോമേഷനും';

  @override
  String get digitalAgriCategory => 'ഡിജിറ്റൽ കൃഷി\n& IoT';

  @override
  String get postHarvestLegacyCategory => 'വിളവെടുപ്പിന് ശേഷം\n& ലെഗസി';

  @override
  String get featuredProducts => 'ഫീച്ചർ ചെയ്ത ഉൽപ്പന്നങ്ങൾ';

  @override
  String get addToCart => 'കാർട്ടിലേക്ക് ചേർക്കുക';

  @override
  String get liveMandiPrices => 'തത്സമയ മണ്ടി വിലകൾ';

  @override
  String get salemApmcMarket => 'സേലം APMC മാർക്കറ്റ്';

  @override
  String get change => 'മാറ്റം';

  @override
  String get arrival => 'വരവ്';

  @override
  String get scanCropDisease => 'വിള രോഗം സ്കാൻ ചെയ്യുക';

  @override
  String get scanCropDiseaseDesc =>
      'തൽക്ഷണ AI രോഗനിർണയവും ചികിത്സാ ശുപാർശകളും ലഭിക്കാൻ നിങ്ങളുടെ ബാധിച്ച വിള ഇലയുടെ ഫോട്ടോ എടുക്കുക.';

  @override
  String get openCamera => 'ക്യാമറ തുറക്കുക';

  @override
  String get analyzePhoto => 'ഫോട്ടോ വിശകലനം ചെയ്യുക';

  @override
  String get analyzing => 'നിങ്ങളുടെ വിള വിശകലനം ചെയ്യുന്നു...';

  @override
  String get navProjects => 'പ്രോജക്ടുകൾ';

  @override
  String get navCourse => 'കോഴ്സ്';

  @override
  String get projectsTitle => 'പ്രോജക്ടുകൾ';

  @override
  String get agriFarmingProjects => 'കാർഷിക പ്രോജക്ടുകൾ';

  @override
  String get aquacultureProjects => 'അക്വാകൾച്ചർ പ്രോജക്ടുകൾ';

  @override
  String get livestockFarmingProjects => 'കന്നുകാലി വളർത്തൽ പ്രോജക്ടുകൾ';

  @override
  String get farmEngineeringProjects => 'കാർഷിക എഞ്ചിനീയറിംഗ് പ്രോജക്ടുകൾ';

  @override
  String get userDetailsTitle => 'നിങ്ങളെക്കുറിച്ച് പറയൂ';

  @override
  String get userDetailsSubtitle =>
      'നിങ്ങളുടെ അനുഭവം വ്യക്തിഗതമാക്കാൻ ചില വിവരങ്ങൾ';

  @override
  String get enterAddress => 'നിങ്ങളുടെ ഗ്രാമം / പട്ടണം നൽകുക';

  @override
  String get addressHint => 'ഗ്രാമം, താലൂക്ക്, ജില്ല';

  @override
  String get completeProfile =>
      'പ്രൊഫൈൽ പൂർത്തിയാക്കി ആപ്പിലേക്ക് പ്രവേശിക്കുക';
}
