// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get appTitle => 'IGO இணைப்பு';

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
    return 'Welcome, $name!';
  }

  @override
  String get salemFarmerHub => 'Salem Farmer Hub';

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
  String get myProfile => 'எனது சுயவிவரம்';

  @override
  String get settings => 'அமைப்புகள்';

  @override
  String get logout => 'வெளியேறு';

  @override
  String get markAllRead => 'Mark All as Read';

  @override
  String get clearAll => 'Clear All';

  @override
  String get notifications => 'அறிவிப்புகள்';

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
  String get comingSoon => 'விரைவில் வரும்';

  @override
  String get featureUnderDevelopment => 'இந்த அம்சம் உருவாக்கத்தில் உள்ளது';

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
