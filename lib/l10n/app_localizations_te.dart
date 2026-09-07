// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get appTitle => 'ఇండియా గ్రీన్ యాప్';

  @override
  String get tagline => 'ఒక యాప్. ప్రతి రైతు. ప్రతి భాగస్వామి.';

  @override
  String get navHome => 'హోమ్';

  @override
  String get navMarket => 'ఉత్పత్తులు';

  @override
  String get navMandi => 'మండి';

  @override
  String get navServices => 'సేవలు';

  @override
  String get navAiDoc => 'AI డాక్టర్';

  @override
  String get navHubs => 'హబ్‌లు';

  @override
  String welcomeUser(String name) {
    return 'స్వాగతం, $name!';
  }

  @override
  String get salemFarmerHub => 'సేలం రైతు హబ్';

  @override
  String get selectLanguage => 'మీ భాషను ఎంచుకోండి';

  @override
  String get selectLanguageSubtitle =>
      'కొనసాగించడానికి మీకు నచ్చిన భాషను ఎంచుకోండి';

  @override
  String get selectRoles => 'మీ పాత్రలను ఎంచుకోండి';

  @override
  String get selectRolesSubtitle =>
      'మిమ్మల్ని వివరించే ఒకటి లేదా అంతకంటే ఎక్కువ పాత్రలను ఎంచుకోండి';

  @override
  String get continueBtn => 'కొనసాగించు';

  @override
  String get loginWithOtp => 'OTPతో లాగిన్ అవ్వండి';

  @override
  String get enterPhone => 'మొబైల్ నంబర్‌ను నమోదు చేయండి';

  @override
  String get enterOtp => '6 అంకెల OTPని నమోదు చేయండి';

  @override
  String get verifyOtp => 'OTPని ధృవీకరించండి';

  @override
  String get sendOtp => 'OTP పంపండి';

  @override
  String get resendOtp => 'OTPని మళ్లీ పంపండి';

  @override
  String get enterName => 'మీ పేరును నమోదు చేయండి';

  @override
  String get enterPincode => 'పిన్‌కోడ్‌ను నమోదు చేయండి';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phoneకి OTP పంపబడింది';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'బాస్కెట్‌కు జోడించండి';

  @override
  String get placeOrder => 'ఆర్డర్ చేయండి';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count అంశాలు',
      one: '1 అంశం',
      zero: 'ఖాళీ బాస్కెట్',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'పంట వైద్యుడు';

  @override
  String get askCropDoctor => 'మీ పంట సమస్యను వివరించండి...';

  @override
  String get diagnosing => 'ఆకు చిత్రాన్ని విశ్లేషిస్తోంది...';

  @override
  String get farmWallet => 'ఫార్మ్ వాలెట్';

  @override
  String get addMoney => 'డబ్బు జోడించండి';

  @override
  String get applyLoan => 'రుణం కోసం దరఖాస్తు చేయండి';

  @override
  String get govtSchemes => 'ప్రభుత్వ పథకాలు';

  @override
  String get academy => 'IGO క్లాస్ అకాడమీ';

  @override
  String get startLesson => 'పాఠం ప్రారంభించండి';

  @override
  String get lessonComplete => 'పాఠం పూర్తయింది!';

  @override
  String get jobPortal => 'వ్యవసాయ ఉద్యోగ పోర్టల్';

  @override
  String get applyNow => 'ఇప్పుడే దరఖాస్తు చేయండి';

  @override
  String get franchiseOpps => 'ఫ్రాంచైజీ అవకాశాలు';

  @override
  String get jointVentures => 'జాయింట్ వెంచర్లు';

  @override
  String get landListings => 'వ్యవసాయ భూమి జాబితాలు';

  @override
  String get vendorDashboard => 'విక్రేత డాష్‌బోర్డ్';

  @override
  String get myProfile => 'నా ప్రొఫైల్';

  @override
  String get settings => 'సెట్టింగ్‌లు';

  @override
  String get logout => 'లాగ్ అవుట్';

  @override
  String get markAllRead => 'అన్నింటినీ చదివినట్లు గుర్తించండి';

  @override
  String get clearAll => 'అన్నీ క్లియర్ చేయండి';

  @override
  String get notifications => 'నోటిఫికేషన్‌లు';

  @override
  String get noNotifications => 'ఇంకా నోటిఫికేషన్‌లు లేవు';

  @override
  String get hubProfile => 'నా ప్రొఫైల్';

  @override
  String get hubVendor => 'విక్రేత డాష్‌బోర్డ్';

  @override
  String get hubFinance => 'ఫార్మ్ వాలెట్ & రుణాలు';

  @override
  String get hubLearn => 'క్లాస్ అకాడమీ';

  @override
  String get hubOpps => 'ఎస్టేట్‌లు & ఫ్రాంచైజీలు';

  @override
  String get hubJobs => 'వ్యవసాయ ఉద్యోగ పోర్టల్';

  @override
  String get comingSoon => 'త్వరలో వస్తుంది';

  @override
  String get featureUnderDevelopment => 'ఈ ఫీచర్ అభివృద్ధిలో ఉంది';

  @override
  String get quickActions => 'త్వరిత చర్యలు';

  @override
  String get igoBrands => 'IGO గ్రూప్స్';

  @override
  String get viewAll => 'అన్నీ చూడండి';

  @override
  String get searchProducts => 'ఉత్పత్తులను శోధించండి...';

  @override
  String get categories => 'వర్గాలు';

  @override
  String get roleFarmer => 'రైతు';

  @override
  String get roleFarmerDesc =>
      'ఇన్‌పుట్‌లు కొనండి, ఉత్పత్తులు అమ్మండి, పంట సలహా పొందండి';

  @override
  String get roleVendor => 'విక్రేత';

  @override
  String get roleVendorDesc =>
      'ఉత్పత్తులను జాబితా చేయండి, ఆర్డర్‌లను నిర్వహించండి, చెల్లింపులను వీక్షించండి';

  @override
  String get roleConsumer => 'వినియోగదారుడు';

  @override
  String get roleConsumerDesc =>
      'పొలాల నుండి తాజా సేంద్రియ ఉత్పత్తులను కొనుగోలు చేయండి';

  @override
  String get roleInvestor => 'పెట్టుబడిదారుడు';

  @override
  String get roleInvestorDesc =>
      'వ్యవసాయ భూమి, బాండ్లు లేదా ఫ్రాంచైజీలో పెట్టుబడి పెట్టండి';

  @override
  String get roleJobSeeker => 'ఉద్యోగార్థి';

  @override
  String get roleJobSeekerDesc => 'భారతదేశం అంతటా వ్యవసాయ ఉద్యోగాలను శోధించండి';

  @override
  String get roleFranchise => 'ఫ్రాంచైజీ భాగస్వామి';

  @override
  String get roleFranchiseDesc =>
      'అధికారిక FICO శాఖలను ప్రారంభించి, అభివృద్ధి చేయండి';

  @override
  String get selectAtLeastOneRole => 'కనీసం ఒక పాత్రను ఎంచుకోండి';

  @override
  String continueWithRoles(int count) {
    return '$count పాత్రలతో కొనసాగించండి';
  }

  @override
  String get buyInputs => 'ఇన్‌పుట్‌లు కొనండి';

  @override
  String get sellProduce => 'ఉత్పత్తులు అమ్మండి';

  @override
  String get mandiPrices => 'మండి ధరలు';

  @override
  String get loanApply => 'రుణం దరఖాస్తు';

  @override
  String get agriJobs => 'వ్యవసాయ ఉద్యోగాలు';

  @override
  String get igoAcademy => 'IGO అకాడమీ';

  @override
  String get franchise => 'ఫ్రాంచైజీ';

  @override
  String get language => 'భాష';

  @override
  String get darkMode => 'డార్క్ మోడ్';

  @override
  String get notificationPrefs => 'నోటిఫికేషన్ ప్రాధాన్యతలు';

  @override
  String get aboutApp => 'INDIA GREEN APP గురించి';

  @override
  String get seedsCategory => 'వ్యవసాయ\nఇన్‌పుట్‌లు';

  @override
  String get polyhouseCategory => 'పాలీహౌస్\nనిర్మాణం';

  @override
  String get horticultureCatalogCategory => 'ఉద్యానవన\nకేటలాగ్';

  @override
  String get controlAutomationCategory => 'నియంత్రణ &\nఆటోమేషన్';

  @override
  String get digitalAgriCategory => 'డిజిటల్ వ్యవసాయం\n& IoT';

  @override
  String get postHarvestLegacyCategory => 'పంట కోత తర్వాత\n& లెగసీ';

  @override
  String get featuredProducts => 'ఫీచర్డ్ ఉత్పత్తులు';

  @override
  String get addToCart => 'కార్ట్‌కు జోడించండి';

  @override
  String get liveMandiPrices => 'లైవ్ మండి ధరలు';

  @override
  String get salemApmcMarket => 'సేలం APMC మార్కెట్';

  @override
  String get change => 'మార్పు';

  @override
  String get arrival => 'రాక';

  @override
  String get scanCropDisease => 'పంట వ్యాధిని స్కాన్ చేయండి';

  @override
  String get scanCropDiseaseDesc =>
      'తక్షణ AI నిర్ధారణ మరియు చికిత్స సిఫార్సులను పొందడానికి మీ ప్రభావిత పంట ఆకు ఫోటో తీయండి.';

  @override
  String get openCamera => 'కెమెరా తెరవండి';

  @override
  String get analyzePhoto => 'ఫోటోను విశ్లేషించండి';

  @override
  String get analyzing => 'మీ పంటను విశ్లేషిస్తోంది...';

  @override
  String get navProjects => 'ప్రాజెక్టులు';

  @override
  String get navCourse => 'కోర్సు';

  @override
  String get projectsTitle => 'ప్రాజెక్టులు';

  @override
  String get agriFarmingProjects => 'వ్యవసాయ ప్రాజెక్టులు';

  @override
  String get aquacultureProjects => 'జలవ్యవసాయ ప్రాజెక్టులు';

  @override
  String get livestockFarmingProjects => 'పశు పెంపక ప్రాజెక్టులు';

  @override
  String get farmEngineeringProjects => 'వ్యవసాయ ఇంజనీరింగ్ ప్రాజెక్టులు';

  @override
  String get userDetailsTitle => 'మీ గురించి చెప్పండి';

  @override
  String get userDetailsSubtitle =>
      'మీ అనుభవాన్ని వ్యక్తిగతీకరించడానికి కొన్ని వివరాలు';

  @override
  String get enterAddress => 'మీ గ్రామం / పట్టణాన్ని నమోదు చేయండి';

  @override
  String get addressHint => 'గ్రామం, తాలూకా, జిల్లా';

  @override
  String get completeProfile => 'ప్రొఫైల్ పూర్తి చేసి యాప్‌లోకి ప్రవేశించండి';
}
