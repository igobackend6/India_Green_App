// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'IGO Connection';

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
}
