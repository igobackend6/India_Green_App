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
  String get navMarket => 'एग्रीमार्ट';

  @override
  String get navMandi => 'मंडी';

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
    return 'OTP sent to +91 $phone';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'Add to Basket';

  @override
  String get placeOrder => 'Place Order';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Items',
      one: '1 Item',
      zero: 'Empty Basket',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'फसल डॉक्टर';

  @override
  String get askCropDoctor => 'Describe your crop issue...';

  @override
  String get diagnosing => 'Analyzing leaf image...';

  @override
  String get farmWallet => 'Farm Wallet';

  @override
  String get addMoney => 'Add Money';

  @override
  String get applyLoan => 'Apply for Loan';

  @override
  String get govtSchemes => 'Government Schemes';

  @override
  String get academy => 'IGO Class Academy';

  @override
  String get startLesson => 'Start Lesson';

  @override
  String get lessonComplete => 'Lesson Completed!';

  @override
  String get jobPortal => 'Agri Job Portal';

  @override
  String get applyNow => 'Apply Now';

  @override
  String get franchiseOpps => 'Franchise Opportunities';

  @override
  String get jointVentures => 'Joint Ventures';

  @override
  String get landListings => 'Farmland Listings';

  @override
  String get vendorDashboard => 'Vendor Dashboard';

  @override
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get markAllRead => 'सभी को पढ़ा हुआ चिह्नित करें';

  @override
  String get clearAll => 'Clear All';

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
  String get igoBrands => 'IGO यूनिवर्स ब्रांड्स';

  @override
  String get viewAll => 'सभी देखें';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get categories => 'Categories';

  @override
  String get roleFarmer => 'किसान';

  @override
  String get roleFarmerDesc => 'इनपुट खरीदें, उपज बेचें';

  @override
  String get roleVendor => 'विक्रेता';

  @override
  String get roleVendorDesc => 'उत्पादों को सूचीबद्ध करें';

  @override
  String get roleConsumer => 'उपभोक्ता';

  @override
  String get roleConsumerDesc => 'जैविक उत्पाद खरीदें';

  @override
  String get roleInvestor => 'निवेशक';

  @override
  String get roleInvestorDesc => 'कृषि भूमि में निवेश करें';

  @override
  String get roleJobSeeker => 'नौकरी चाहने वाला';

  @override
  String get roleJobSeekerDesc => 'कृषि नौकरियां खोजें';

  @override
  String get roleFranchise => 'फ्रेंचाइजी पार्टनर';

  @override
  String get roleFranchiseDesc => 'शाखाएं शुरू करें';

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
  String get seedsCategory => 'बीज';

  @override
  String get fertilizersCategory => 'उर्वरक';

  @override
  String get pesticidesCategory => 'कीटनाशक';

  @override
  String get toolsCategory => 'उपकरण';

  @override
  String get saplingsCategory => 'पौधे';

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
