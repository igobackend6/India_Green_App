// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'INDIA GREEN APP';

  @override
  String get tagline => 'One App. Every Farmer. Every Partner.';

  @override
  String get navHome => 'Home';

  @override
  String get navMarket => 'AgriMart';

  @override
  String get navMandi => 'Mandi';

  @override
  String get navAiDoc => 'AI Doc';

  @override
  String get navHubs => 'Hubs';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get salemFarmerHub => 'Salem Farmer Hub';

  @override
  String get selectLanguage => 'Select Your Language';

  @override
  String get selectLanguageSubtitle =>
      'Choose your preferred language to continue';

  @override
  String get selectRoles => 'Choose Your Roles';

  @override
  String get selectRolesSubtitle =>
      'Select one or more roles that describe you';

  @override
  String get continueBtn => 'Continue';

  @override
  String get loginWithOtp => 'Login with OTP';

  @override
  String get enterPhone => 'Enter Mobile Number';

  @override
  String get enterOtp => 'Enter 6-digit OTP';

  @override
  String get verifyOtp => 'Verify OTP';

  @override
  String get sendOtp => 'Send OTP';

  @override
  String get resendOtp => 'Resend OTP';

  @override
  String get enterName => 'Enter Your Name';

  @override
  String get enterPincode => 'Enter Pincode';

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
  String get cropDoctor => 'Crop Doctor';

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
  String get myProfile => 'My Profile';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Logout';

  @override
  String get markAllRead => 'Mark All as Read';

  @override
  String get clearAll => 'Clear All';

  @override
  String get notifications => 'Notifications';

  @override
  String get noNotifications => 'No notifications yet';

  @override
  String get hubProfile => 'My Profile';

  @override
  String get hubVendor => 'Vendor Dashboard';

  @override
  String get hubFinance => 'Farm Wallet & Loans';

  @override
  String get hubLearn => 'Class Academy';

  @override
  String get hubOpps => 'Estates Franchises';

  @override
  String get hubJobs => 'Agri Job Portal';

  @override
  String get comingSoon => 'Coming Soon';

  @override
  String get featureUnderDevelopment => 'This feature is under development';

  @override
  String get quickActions => 'Quick Actions';

  @override
  String get igoBrands => 'IGO Universe Brands';

  @override
  String get viewAll => 'View All';

  @override
  String get searchProducts => 'Search products...';

  @override
  String get categories => 'Categories';

  @override
  String get roleFarmer => 'Farmer';

  @override
  String get roleFarmerDesc => 'Buy inputs, sell produce, crop advice';

  @override
  String get roleVendor => 'Vendor';

  @override
  String get roleVendorDesc => 'List products, manage orders, view payouts';

  @override
  String get roleConsumer => 'Consumer';

  @override
  String get roleConsumerDesc => 'Shop fresh organic products from farms';

  @override
  String get roleInvestor => 'Investor';

  @override
  String get roleInvestorDesc => 'Invest in farmlands, bonds, or franchise';

  @override
  String get roleJobSeeker => 'Job Seeker';

  @override
  String get roleJobSeekerDesc => 'Search agricultural jobs across India';

  @override
  String get roleFranchise => 'Franchise Partner';

  @override
  String get roleFranchiseDesc => 'Launch and grow official FICO branches';

  @override
  String get selectAtLeastOneRole => 'Select at least one role';

  @override
  String continueWithRoles(int count) {
    return 'Continue with $count role(s)';
  }

  @override
  String get buyInputs => 'Buy Inputs';

  @override
  String get sellProduce => 'Sell Produce';

  @override
  String get mandiPrices => 'Mandi Prices';

  @override
  String get loanApply => 'Loan Apply';

  @override
  String get agriJobs => 'Agri Jobs';

  @override
  String get igoAcademy => 'IGO Academy';

  @override
  String get franchise => 'Franchise';

  @override
  String get language => 'Language';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get notificationPrefs => 'Notification Preferences';

  @override
  String get aboutApp => 'About INDIA GREEN APP';

  @override
  String get seedsCategory => 'Seeds';

  @override
  String get fertilizersCategory => 'Fertilizers';

  @override
  String get pesticidesCategory => 'Pesticides';

  @override
  String get toolsCategory => 'Tools';

  @override
  String get saplingsCategory => 'Saplings';

  @override
  String get featuredProducts => 'Featured Products';

  @override
  String get addToCart => 'Add to Cart';

  @override
  String get liveMandiPrices => 'Live Mandi Prices';

  @override
  String get salemApmcMarket => 'Salem APMC Market';

  @override
  String get change => 'Change';

  @override
  String get arrival => 'Arrival';

  @override
  String get scanCropDisease => 'Scan Crop Disease';

  @override
  String get scanCropDiseaseDesc =>
      'Take a photo of your affected crop leaf to get instant AI diagnosis and treatment recommendations.';

  @override
  String get openCamera => 'Open Camera';

  @override
  String get analyzePhoto => 'Analyze Photo';

  @override
  String get analyzing => 'Analyzing your crop...';

  @override
  String get navProjects => 'Projects';

  @override
  String get projectsTitle => 'Projects';

  @override
  String get agriFarmingProjects => 'Agri Farming Projects';

  @override
  String get aquacultureProjects => 'Aquaculture Projects';

  @override
  String get livestockFarmingProjects => 'Livestock Farming Projects';

  @override
  String get farmEngineeringProjects => 'Farm Engineering Projects';

  @override
  String get userDetailsTitle => 'Tell Us About You';

  @override
  String get userDetailsSubtitle =>
      'A few details to personalize your experience';

  @override
  String get enterAddress => 'Enter Your Village / Town';

  @override
  String get addressHint => 'Village, Taluk, District';

  @override
  String get completeProfile => 'Complete Profile & Enter App';
}
