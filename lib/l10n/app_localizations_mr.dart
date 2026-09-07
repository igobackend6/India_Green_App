// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get appTitle => 'इंडिया ग्रीन अ‍ॅप';

  @override
  String get tagline => 'एक अ‍ॅप. प्रत्येक शेतकरी. प्रत्येक भागीदार.';

  @override
  String get navHome => 'होम';

  @override
  String get navMarket => 'उत्पादने';

  @override
  String get navMandi => 'मंडी';

  @override
  String get navServices => 'सेवा';

  @override
  String get navAiDoc => 'AI डॉक्टर';

  @override
  String get navHubs => 'हब';

  @override
  String welcomeUser(String name) {
    return 'स्वागत आहे, $name!';
  }

  @override
  String get salemFarmerHub => 'सेलम फार्मर हब';

  @override
  String get selectLanguage => 'तुमची भाषा निवडा';

  @override
  String get selectLanguageSubtitle =>
      'सुरू ठेवण्यासाठी तुमची पसंतीची भाषा निवडा';

  @override
  String get selectRoles => 'तुमच्या भूमिका निवडा';

  @override
  String get selectRolesSubtitle =>
      'तुमचे वर्णन करणारी एक किंवा अधिक भूमिका निवडा';

  @override
  String get continueBtn => 'सुरू ठेवा';

  @override
  String get loginWithOtp => 'OTP सह लॉगिन करा';

  @override
  String get enterPhone => 'मोबाइल नंबर टाका';

  @override
  String get enterOtp => '6 अंकी OTP टाका';

  @override
  String get verifyOtp => 'OTP सत्यापित करा';

  @override
  String get sendOtp => 'OTP पाठवा';

  @override
  String get resendOtp => 'OTP पुन्हा पाठवा';

  @override
  String get enterName => 'तुमचे नाव टाका';

  @override
  String get enterPincode => 'पिनकोड टाका';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone वर OTP पाठवला आहे';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'टोपलीत जोडा';

  @override
  String get placeOrder => 'ऑर्डर द्या';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count वस्तू',
      one: '1 वस्तू',
      zero: 'रिकामी टोपली',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'पीक डॉक्टर';

  @override
  String get askCropDoctor => 'तुमच्या पिकाची समस्या सांगा...';

  @override
  String get diagnosing => 'पानाच्या प्रतिमेचे विश्लेषण होत आहे...';

  @override
  String get farmWallet => 'फार्म वॉलेट';

  @override
  String get addMoney => 'पैसे जोडा';

  @override
  String get applyLoan => 'कर्जासाठी अर्ज करा';

  @override
  String get govtSchemes => 'सरकारी योजना';

  @override
  String get academy => 'IGO क्लास अकॅडमी';

  @override
  String get startLesson => 'धडा सुरू करा';

  @override
  String get lessonComplete => 'धडा पूर्ण झाला!';

  @override
  String get jobPortal => 'कृषी नोकरी पोर्टल';

  @override
  String get applyNow => 'आता अर्ज करा';

  @override
  String get franchiseOpps => 'फ्रँचायझी संधी';

  @override
  String get jointVentures => 'संयुक्त उपक्रम';

  @override
  String get landListings => 'शेतजमीन यादी';

  @override
  String get vendorDashboard => 'विक्रेता डॅशबोर्ड';

  @override
  String get myProfile => 'माझी प्रोफाइल';

  @override
  String get settings => 'सेटिंग्ज';

  @override
  String get logout => 'लॉगआउट';

  @override
  String get markAllRead => 'सर्व वाचले म्हणून चिन्हांकित करा';

  @override
  String get clearAll => 'सर्व साफ करा';

  @override
  String get notifications => 'सूचना';

  @override
  String get noNotifications => 'अद्याप कोणतीही सूचना नाही';

  @override
  String get hubProfile => 'माझी प्रोफाइल';

  @override
  String get hubVendor => 'विक्रेता डॅशबोर्ड';

  @override
  String get hubFinance => 'फार्म वॉलेट आणि कर्ज';

  @override
  String get hubLearn => 'क्लास अकॅडमी';

  @override
  String get hubOpps => 'इस्टेट्स आणि फ्रँचायझी';

  @override
  String get hubJobs => 'कृषी नोकरी पोर्टल';

  @override
  String get comingSoon => 'लवकरच येत आहे';

  @override
  String get featureUnderDevelopment => 'हे वैशिष्ट्य विकासाधीन आहे';

  @override
  String get quickActions => 'त्वरित क्रिया';

  @override
  String get igoBrands => 'IGO ग्रुप्स';

  @override
  String get viewAll => 'सर्व पहा';

  @override
  String get searchProducts => 'उत्पादने शोधा...';

  @override
  String get categories => 'श्रेण्या';

  @override
  String get roleFarmer => 'शेतकरी';

  @override
  String get roleFarmerDesc => 'इनपुट खरेदी करा, उत्पादन विका, पीक सल्ला मिळवा';

  @override
  String get roleVendor => 'विक्रेता';

  @override
  String get roleVendorDesc =>
      'उत्पादने सूचीबद्ध करा, ऑर्डर व्यवस्थापित करा, पेआउट पहा';

  @override
  String get roleConsumer => 'ग्राहक';

  @override
  String get roleConsumerDesc => 'शेतातून ताजी सेंद्रिय उत्पादने खरेदी करा';

  @override
  String get roleInvestor => 'गुंतवणूकदार';

  @override
  String get roleInvestorDesc =>
      'शेतजमीन, रोखे किंवा फ्रँचायझीमध्ये गुंतवणूक करा';

  @override
  String get roleJobSeeker => 'नोकरी शोधणारा';

  @override
  String get roleJobSeekerDesc => 'संपूर्ण भारतात कृषी नोकऱ्या शोधा';

  @override
  String get roleFranchise => 'फ्रँचायझी भागीदार';

  @override
  String get roleFranchiseDesc => 'अधिकृत FICO शाखा सुरू करा आणि वाढवा';

  @override
  String get selectAtLeastOneRole => 'किमान एक भूमिका निवडा';

  @override
  String continueWithRoles(int count) {
    return '$count भूमिकांसह सुरू ठेवा';
  }

  @override
  String get buyInputs => 'इनपुट खरेदी करा';

  @override
  String get sellProduce => 'उत्पादन विका';

  @override
  String get mandiPrices => 'मंडी भाव';

  @override
  String get loanApply => 'कर्ज अर्ज';

  @override
  String get agriJobs => 'कृषी नोकऱ्या';

  @override
  String get igoAcademy => 'IGO अकॅडमी';

  @override
  String get franchise => 'फ्रँचायझी';

  @override
  String get language => 'भाषा';

  @override
  String get darkMode => 'डार्क मोड';

  @override
  String get notificationPrefs => 'सूचना प्राधान्ये';

  @override
  String get aboutApp => 'INDIA GREEN APP बद्दल';

  @override
  String get seedsCategory => 'कृषी शेती\nइनपुट';

  @override
  String get polyhouseCategory => 'पॉलीहाऊस\nसंरचना';

  @override
  String get horticultureCatalogCategory => 'फलोत्पादन\nसूची';

  @override
  String get controlAutomationCategory => 'नियंत्रण आणि\nस्वयंचलन';

  @override
  String get digitalAgriCategory => 'डिजिटल कृषी\nआणि IoT';

  @override
  String get postHarvestLegacyCategory => 'काढणीनंतर\nआणि वारसा';

  @override
  String get featuredProducts => 'वैशिष्ट्यीकृत उत्पादने';

  @override
  String get addToCart => 'कार्टमध्ये जोडा';

  @override
  String get liveMandiPrices => 'लाइव्ह मंडी भाव';

  @override
  String get salemApmcMarket => 'सेलम APMC बाजार';

  @override
  String get change => 'बदल';

  @override
  String get arrival => 'आवक';

  @override
  String get scanCropDisease => 'पीक रोग स्कॅन करा';

  @override
  String get scanCropDiseaseDesc =>
      'त्वरित AI निदान आणि उपचार शिफारसी मिळवण्यासाठी तुमच्या बाधित पिकाच्या पानाचा फोटो घ्या.';

  @override
  String get openCamera => 'कॅमेरा उघडा';

  @override
  String get analyzePhoto => 'फोटोचे विश्लेषण करा';

  @override
  String get analyzing => 'तुमच्या पिकाचे विश्लेषण होत आहे...';

  @override
  String get navProjects => 'प्रकल्प';

  @override
  String get navCourse => 'कोर्स';

  @override
  String get projectsTitle => 'प्रकल्प';

  @override
  String get agriFarmingProjects => 'कृषी शेती प्रकल्प';

  @override
  String get aquacultureProjects => 'मत्स्यशेती प्रकल्प';

  @override
  String get livestockFarmingProjects => 'पशुपालन प्रकल्प';

  @override
  String get farmEngineeringProjects => 'कृषी अभियांत्रिकी प्रकल्प';

  @override
  String get userDetailsTitle => 'तुमच्याबद्दल सांगा';

  @override
  String get userDetailsSubtitle =>
      'तुमचा अनुभव वैयक्तिकृत करण्यासाठी काही तपशील';

  @override
  String get enterAddress => 'तुमचे गाव / शहर टाका';

  @override
  String get addressHint => 'गाव, तालुका, जिल्हा';

  @override
  String get completeProfile => 'प्रोफाइल पूर्ण करा आणि अ‍ॅपमध्ये प्रवेश करा';
}
