// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'இந்தியா கிரீன் ஆப்';

  @override
  String get tagline => 'ஒரு ஆப். ஒவ்வொரு விவசாயி. ஒவ்வொரு பங்குதாரர்.';

  @override
  String get navHome => 'முகப்பு';

  @override
  String get navMarket => 'அக்ரிமார்ட்';

  @override
  String get navMandi => 'மண்டி';

  @override
  String get navAiDoc => 'AI மருத்துவர்';

  @override
  String get navHubs => 'ஹப்கள்';

  @override
  String welcomeUser(String name) {
    return 'வரவேற்கிறோம், $name!';
  }

  @override
  String get salemFarmerHub => 'சேலம் உழவர் மையம்';

  @override
  String get selectLanguage => 'உங்கள் மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectLanguageSubtitle =>
      'தொடர உங்கள் விருப்பமான மொழியைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectRoles => 'உங்கள் பாத்திரங்களைத் தேர்ந்தெடுக்கவும்';

  @override
  String get selectRolesSubtitle =>
      'உங்களை விவரிக்கும் ஒன்று அல்லது அதற்கு மேற்பட்ட பாத்திரங்களைத் தேர்ந்தெடுக்கவும்';

  @override
  String get continueBtn => 'தொடரவும்';

  @override
  String get loginWithOtp => 'OTP மூலம் உள்நுழையவும்';

  @override
  String get enterPhone => 'மொபைல் எண்ணை உள்ளிடவும்';

  @override
  String get enterOtp => '6 இலக்க OTP ஐ உள்ளிடவும்';

  @override
  String get verifyOtp => 'OTP ஐ சரிபார்க்கவும்';

  @override
  String get sendOtp => 'OTP அனுப்பவும்';

  @override
  String get resendOtp => 'OTP மீண்டும் அனுப்பவும்';

  @override
  String get enterName => 'உங்கள் பெயரை உள்ளிடவும்';

  @override
  String get enterPincode => 'அஞ்சல் குறியீட்டை உள்ளிடவும்';

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
  String get cropDoctor => 'பயிர் மருத்துவர்';

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
  String get myProfile => 'எனது சுயவிவரம்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get markAllRead => 'அனைத்தையும் படித்ததாக குறிக்கவும்';

  @override
  String get clearAll => 'Clear All';

  @override
  String get notifications => 'அறிவிப்புகள்';

  @override
  String get noNotifications => 'அறிவிப்புகள் எதுவும் இல்லை';

  @override
  String get hubProfile => 'என் சுயவிவரம்';

  @override
  String get hubVendor => 'விற்பனையாளர் டாஷ்போர்டு';

  @override
  String get hubFinance => 'பண்ணை வாலட் & கடன்கள்';

  @override
  String get hubLearn => 'வகுப்பு அகாடமி';

  @override
  String get hubOpps => 'எஸ்டேட்டுகள் & ஃபிரான்சைஸ்';

  @override
  String get hubJobs => 'வேளாண் வேலை போர்டல்';

  @override
  String get comingSoon => 'விரைவில் வரும்';

  @override
  String get featureUnderDevelopment => 'இந்த அம்சம் உருவாக்கத்தில் உள்ளது';

  @override
  String get quickActions => 'விரைவான செயல்கள்';

  @override
  String get igoBrands => 'IGO யுனிவர்ஸ் பிராண்டுகள்';

  @override
  String get viewAll => 'அனைத்தையும் காண்க';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get categories => 'Categories';

  @override
  String get roleFarmer => 'விவசாயி';

  @override
  String get roleFarmerDesc => 'உள்ளீடுகளை வாங்கவும், விளைபொருட்களை விற்கவும்';

  @override
  String get roleVendor => 'விற்பனையாளர்';

  @override
  String get roleVendorDesc => 'தயாரிப்புகளை பட்டியலிடவும், நிர்வகிக்கவும்';

  @override
  String get roleConsumer => 'நுகர்வோர்';

  @override
  String get roleConsumerDesc => 'புதிய கரிம பொருட்களை வாங்கவும்';

  @override
  String get roleInvestor => 'முதலீட்டாளர்';

  @override
  String get roleInvestorDesc => 'விவசாய நிலங்களில் முதலீடு செய்யுங்கள்';

  @override
  String get roleJobSeeker => 'வேலை தேடுபவர்';

  @override
  String get roleJobSeekerDesc => 'விவசாய வேலைகளைத் தேடுங்கள்';

  @override
  String get roleFranchise => 'பிரான்சைஸ் பார்ட்னர்';

  @override
  String get roleFranchiseDesc => 'கீளைகளைத் தொடங்குங்கள்';

  @override
  String get selectAtLeastOneRole =>
      'குறைந்தபட்சம் ஒரு பாத்திரத்தை தேர்ந்தெடுக்கவும்';

  @override
  String continueWithRoles(int count) {
    return '$count பாத்திரங்களுடன் தொடரவும்';
  }

  @override
  String get buyInputs => 'உள்ளீடுகளை வாங்கவும்';

  @override
  String get sellProduce => 'விளைபொருட்களை விற்கவும்';

  @override
  String get mandiPrices => 'மண்டி விலைகள்';

  @override
  String get loanApply => 'கடன் விண்ணப்பிக்கவும்';

  @override
  String get agriJobs => 'விவசாய வேலைகள்';

  @override
  String get igoAcademy => 'IGO அகாடமி';

  @override
  String get franchise => 'ஃபிரான்சைஸ்';

  @override
  String get language => 'மொழி';

  @override
  String get darkMode => 'இருண்ட பயன்முறை';

  @override
  String get notificationPrefs => 'அறிவிப்பு விருப்பங்கள்';

  @override
  String get aboutApp => 'INDIA GREEN APP பற்றி';

  @override
  String get seedsCategory => 'விதைகள்';

  @override
  String get fertilizersCategory => 'உரங்கள்';

  @override
  String get pesticidesCategory => 'பூச்சிக்கொல்லிகள்';

  @override
  String get toolsCategory => 'கருவிகள்';

  @override
  String get saplingsCategory => 'நாற்றுகள்';

  @override
  String get featuredProducts => 'சிறப்பு தயாரிப்புகள்';

  @override
  String get addToCart => 'கூடையில் சேர்';

  @override
  String get liveMandiPrices => 'நேரடி மண்டி விலைகள்';

  @override
  String get salemApmcMarket => 'சேலம் APMC சந்தை';

  @override
  String get change => 'மாற்று';

  @override
  String get arrival => 'வருகை';

  @override
  String get scanCropDisease => 'பயிர் நோயை ஸ்கேன் செய்யுங்கள்';

  @override
  String get scanCropDiseaseDesc =>
      'பாதிக்கப்பட்ட பயிர் இலையின் புகைப்படம் எடுத்து உடனடி AI நோயறிதல் மற்றும் சிகிச்சை பரிந்துரைகளைப் பெறுங்கள்.';

  @override
  String get openCamera => 'கேமராவை திறக்கவும்';

  @override
  String get analyzePhoto => 'புகைப்படத்தை பகுப்பாய்வு செய்';

  @override
  String get analyzing => 'உங்கள் பயிரை பகுப்பாய்வு செய்கிறோம்...';

  @override
  String get navProjects => 'திட்டங்கள்';

  @override
  String get projectsTitle => 'திட்டங்கள்';

  @override
  String get agriFarmingProjects => 'வேளாண் திட்டங்கள்';

  @override
  String get aquacultureProjects => 'நீர்வளர்ப்பு திட்டங்கள்';

  @override
  String get livestockFarmingProjects => 'கால்நடை திட்டங்கள்';

  @override
  String get farmEngineeringProjects => 'பண்ணை பொறியியல் திட்டங்கள்';

  @override
  String get userDetailsTitle => 'உங்களைப் பற்றி சொல்லுங்கள்';

  @override
  String get userDetailsSubtitle =>
      'உங்கள் அனுபவத்தை தனிப்பயனாக்க சில விவரங்கள்';

  @override
  String get enterAddress => 'உங்கள் கிராமம் / நகரம் உள்ளிடவும்';

  @override
  String get addressHint => 'கிராமம், தாலுகா, மாவட்டம்';

  @override
  String get completeProfile => 'சுயவிவரம் முடித்து உள்ளே செல்';
}
