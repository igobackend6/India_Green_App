// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'IGO कनेक्शन';

  @override
  String get tagline => 'एक ऐप। हर किसान। हर साथी।';

  @override
  String get navHome => 'होम';

  @override
  String get navMarket => 'एग्रीमार्ट';

  @override
  String get navMandi => 'मंडी';

  @override
  String get navAiDoc => 'AI डॉक्टर';

  @override
  String get navHubs => 'हब्स';

  @override
  String welcomeUser(String name) {
    return 'Welcome, $name!';
  }

  @override
  String get salemFarmerHub => 'Salem Farmer Hub';

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
  String get myProfile => 'मेरी प्रोफ़ाइल';

  @override
  String get settings => 'सेटिंग्स';

  @override
  String get logout => 'लॉग आउट';

  @override
  String get markAllRead => 'Mark All as Read';

  @override
  String get clearAll => 'Clear All';

  @override
  String get notifications => 'सूचनाएँ';

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
  String get comingSoon => 'जल्द आ रहा है';

  @override
  String get featureUnderDevelopment => 'यह सुविधा विकास में है';

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
}
