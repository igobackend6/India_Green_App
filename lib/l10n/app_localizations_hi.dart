// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'इंडिया ग्रीन ऐप';

  @override
  String get tagline => 'एक ऐप। हर किसान। हर भागीदार।';

  @override
  String get navHome => 'होम';

  @override
  String get navMarket => 'उत्पाद';

  @override
  String get navMandi => 'मंडी';

  @override
  String get navServices => 'सेवाएं';

  @override
  String get navAiDoc => 'AI डॉक्टर';

  @override
  String get navHubs => 'हब';

  @override
  String welcomeUser(String name) {
    return 'स्वागत है, $name!';
  }

  @override
  String get salemFarmerHub => 'सेलम फार्मर हब';

  @override
  String get selectLanguage => 'अपनी भाषा चुनें';

  @override
  String get selectLanguageSubtitle =>
      'जारी रखने के लिए अपनी पसंदीदा भाषा चुनें';

  @override
  String get selectRoles => 'अपनी भूमिकाएँ चुनें';

  @override
  String get selectRolesSubtitle =>
      'एक या अधिक भूमिकाएँ चुनें जो आपका वर्णन करती हैं';

  @override
  String get continueBtn => 'जारी रखें';

  @override
  String get loginWithOtp => 'OTP से लॉगिन करें';

  @override
  String get enterPhone => 'मोबाइल नंबर दर्ज करें';

  @override
  String get enterOtp => '6 अंकों का OTP दर्ज करें';

  @override
  String get verifyOtp => 'OTP सत्यापित करें';

  @override
  String get sendOtp => 'OTP भेजें';

  @override
  String get resendOtp => 'OTP पुनः भेजें';

  @override
  String get enterName => 'अपना नाम दर्ज करें';

  @override
  String get enterPincode => 'पिनकोड दर्ज करें';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone पर OTP भेजा गया';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'बास्केट में जोड़ें';

  @override
  String get placeOrder => 'ऑर्डर करें';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count आइटम',
      one: '1 आइटम',
      zero: 'खाली बास्केट',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'फसल डॉक्टर';

  @override
  String get askCropDoctor => 'अपनी फसल की समस्या बताएं...';

  @override
  String get diagnosing => 'पत्ती की छवि का विश्लेषण हो रहा है...';

  @override
  String get farmWallet => 'फार्म वॉलेट';

  @override
  String get addMoney => 'पैसे जोड़ें';

  @override
  String get applyLoan => 'ऋण के लिए आवेदन करें';

  @override
  String get govtSchemes => 'सरकारी योजनाएं';

  @override
  String get academy => 'IGO क्लास अकादमी';

  @override
  String get startLesson => 'पाठ शुरू करें';

  @override
  String get lessonComplete => 'पाठ पूरा हुआ!';

  @override
  String get jobPortal => 'कृषि जॉब पोर्टल';

  @override
  String get applyNow => 'अभी आवेदन करें';

  @override
  String get franchiseOpps => 'फ्रेंचाइजी अवसर';

  @override
  String get jointVentures => 'संयुक्त उद्यम';

  @override
  String get landListings => 'कृषि भूमि लिस्टिंग';

  @override
  String get vendorDashboard => 'विक्रेता डैशबोर्ड';

  @override
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get markAllRead => 'सभी को पढ़ा हुआ चिह्नित करें';

  @override
  String get clearAll => 'सभी साफ़ करें';

  @override
  String get notifications => 'सूचनाएं';

  @override
  String get noNotifications => 'अभी तक कोई सूचना नहीं';

  @override
  String get hubProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get hubVendor => 'विक्रेता डैशबोर्ड';

  @override
  String get hubFinance => 'फार्म वॉलेट और ऋण';

  @override
  String get hubLearn => 'क्लास अकादमी';

  @override
  String get hubOpps => 'संपदाएं और फ्रेंचाइजी';

  @override
  String get hubJobs => 'कृषि नौकरी पोर्टल';

  @override
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get featureUnderDevelopment => 'यह सुविधा विकास के अधीन है';

  @override
  String get quickActions => 'त्वरित कार्रवाइयां';

  @override
  String get igoBrands => 'IGO ग्रुप्स';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String get searchProducts => 'उत्पाद खोजें...';

  @override
  String get categories => 'श्रेणियां';

  @override
  String get roleFarmer => 'किसान';

  @override
  String get roleFarmerDesc => 'इनपुट खरीदें, उपज बेचें, फसल सलाह पाएं';

  @override
  String get roleVendor => 'विक्रेता';

  @override
  String get roleVendorDesc =>
      'उत्पाद सूचीबद्ध करें, ऑर्डर प्रबंधित करें, भुगतान देखें';

  @override
  String get roleConsumer => 'उपभोक्ता';

  @override
  String get roleConsumerDesc => 'खेतों से ताज़ा जैविक उत्पाद खरीदें';

  @override
  String get roleInvestor => 'निवेशक';

  @override
  String get roleInvestorDesc =>
      'कृषि भूमि, बॉन्ड या फ्रेंचाइजी में निवेश करें';

  @override
  String get roleJobSeeker => 'नौकरी चाहने वाला';

  @override
  String get roleJobSeekerDesc => 'पूरे भारत में कृषि नौकरियां खोजें';

  @override
  String get roleFranchise => 'फ्रेंचाइजी पार्टनर';

  @override
  String get roleFranchiseDesc => 'आधिकारिक FICO शाखाएं शुरू करें और बढ़ाएं';

  @override
  String get selectAtLeastOneRole => 'कम से कम एक भूमिका चुनें';

  @override
  String continueWithRoles(int count) {
    return '$count भूमिकाओं के साथ जारी रखें';
  }

  @override
  String get buyInputs => 'इनपुट खरीदें';

  @override
  String get sellProduce => 'उपज बेचें';

  @override
  String get mandiPrices => 'मंडी की कीमतें';

  @override
  String get loanApply => 'ऋण आवेदन';

  @override
  String get agriJobs => 'कृषि नौकरियां';

  @override
  String get igoAcademy => 'IGO अकादमी';

  @override
  String get franchise => 'फ्रेंचाइजी';

  @override
  String get language => 'भाषा';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get notificationPrefs => 'सूचना प्राथमिकताएँ';

  @override
  String get aboutApp => 'INDIA GREEN APP के बारे में';

  @override
  String get seedsCategory => 'कृषि खेती\nइनपुट';

  @override
  String get polyhouseCategory => 'पॉलीहाउस\nसंरचना';

  @override
  String get horticultureCatalogCategory => 'बागवानी\nसूची';

  @override
  String get controlAutomationCategory => 'नियंत्रण एवं\nस्वचालन';

  @override
  String get digitalAgriCategory => 'डिजिटल कृषि\nएवं IoT';

  @override
  String get postHarvestLegacyCategory => 'फसल कटाई बाद\nएवं अन्य';

  @override
  String get featuredProducts => 'विशेष उत्पाद';

  @override
  String get addToCart => 'कार्ट में जोड़ें';

  @override
  String get liveMandiPrices => 'लाइव मंडी भाव';

  @override
  String get salemApmcMarket => 'सालेम APMC बाजार';

  @override
  String get change => 'बदलें';

  @override
  String get arrival => 'आवक';

  @override
  String get scanCropDisease => 'फसल रोग स्कैन करें';

  @override
  String get scanCropDiseaseDesc =>
      'तत्काल AI निदान और उपचार सिफारिशें पाने के लिए प्रभावित फसल की पत्ती की फोटो लें।';

  @override
  String get openCamera => 'कैमरा खोलें';

  @override
  String get analyzePhoto => 'फोटो विश्लेषण करें';

  @override
  String get analyzing => 'आपकी फसल का विश्लेषण हो रहा है...';

  @override
  String get navProjects => 'परियोजनाएं';

  @override
  String get navCourse => 'कोर्स';

  @override
  String get projectsTitle => 'परियोजनाएं';

  @override
  String get agriFarmingProjects => 'कृषि खेती परियोजनाएं';

  @override
  String get aquacultureProjects => 'जलकृषि परियोजनाएं';

  @override
  String get livestockFarmingProjects => 'पशुपालन परियोजनाएं';

  @override
  String get farmEngineeringProjects => 'कृषि इंजीनियरिंग परियोजनाएं';

  @override
  String get userDetailsTitle => 'अपने बारे में बताएं';

  @override
  String get userDetailsSubtitle =>
      'आपके अनुभव को बेहतर बनाने के लिए कुछ जानकारी';

  @override
  String get enterAddress => 'अपना गाँव / शहर दर्ज करें';

  @override
  String get addressHint => 'गाँव, तालुका, जिला';

  @override
  String get completeProfile => 'प्रोफ़ाइल पूरी करें और आगे बढ़ें';
}
