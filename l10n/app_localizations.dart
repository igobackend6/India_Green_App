import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_ta.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('hi'),
    Locale('ta'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'IGO Connection'**
  String get appTitle;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'One App. Every Farmer. Every Partner.'**
  String get tagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMarket.
  ///
  /// In en, this message translates to:
  /// **'AgriMart'**
  String get navMarket;

  /// No description provided for @navMandi.
  ///
  /// In en, this message translates to:
  /// **'Mandi'**
  String get navMandi;

  /// No description provided for @navAiDoc.
  ///
  /// In en, this message translates to:
  /// **'AI Doc'**
  String get navAiDoc;

  /// No description provided for @navHubs.
  ///
  /// In en, this message translates to:
  /// **'Hubs'**
  String get navHubs;

  /// No description provided for @welcomeUser.
  ///
  /// In en, this message translates to:
  /// **'Welcome, {name}!'**
  String welcomeUser(String name);

  /// No description provided for @salemFarmerHub.
  ///
  /// In en, this message translates to:
  /// **'Salem Farmer Hub'**
  String get salemFarmerHub;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectLanguage;

  /// No description provided for @selectLanguageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language to continue'**
  String get selectLanguageSubtitle;

  /// No description provided for @selectRoles.
  ///
  /// In en, this message translates to:
  /// **'Choose Your Roles'**
  String get selectRoles;

  /// No description provided for @selectRolesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Select one or more roles that describe you'**
  String get selectRolesSubtitle;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @loginWithOtp.
  ///
  /// In en, this message translates to:
  /// **'Login with OTP'**
  String get loginWithOtp;

  /// No description provided for @enterPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter Mobile Number'**
  String get enterPhone;

  /// No description provided for @enterOtp.
  ///
  /// In en, this message translates to:
  /// **'Enter 6-digit OTP'**
  String get enterOtp;

  /// No description provided for @verifyOtp.
  ///
  /// In en, this message translates to:
  /// **'Verify OTP'**
  String get verifyOtp;

  /// No description provided for @sendOtp.
  ///
  /// In en, this message translates to:
  /// **'Send OTP'**
  String get sendOtp;

  /// No description provided for @resendOtp.
  ///
  /// In en, this message translates to:
  /// **'Resend OTP'**
  String get resendOtp;

  /// No description provided for @enterName.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enterName;

  /// No description provided for @enterPincode.
  ///
  /// In en, this message translates to:
  /// **'Enter Pincode'**
  String get enterPincode;

  /// No description provided for @phoneHint.
  ///
  /// In en, this message translates to:
  /// **'9876543210'**
  String get phoneHint;

  /// No description provided for @otpSentTo.
  ///
  /// In en, this message translates to:
  /// **'OTP sent to +91 {phone}'**
  String otpSentTo(String phone);

  /// No description provided for @pricePerQuintal.
  ///
  /// In en, this message translates to:
  /// **'₹{price}/Qtl'**
  String pricePerQuintal(String price);

  /// No description provided for @addToBasket.
  ///
  /// In en, this message translates to:
  /// **'Add to Basket'**
  String get addToBasket;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @basketItems.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Empty Basket} =1{1 Item} other{{count} Items}}'**
  String basketItems(int count);

  /// No description provided for @cropDoctor.
  ///
  /// In en, this message translates to:
  /// **'Crop Doctor'**
  String get cropDoctor;

  /// No description provided for @askCropDoctor.
  ///
  /// In en, this message translates to:
  /// **'Describe your crop issue...'**
  String get askCropDoctor;

  /// No description provided for @diagnosing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing leaf image...'**
  String get diagnosing;

  /// No description provided for @farmWallet.
  ///
  /// In en, this message translates to:
  /// **'Farm Wallet'**
  String get farmWallet;

  /// No description provided for @addMoney.
  ///
  /// In en, this message translates to:
  /// **'Add Money'**
  String get addMoney;

  /// No description provided for @applyLoan.
  ///
  /// In en, this message translates to:
  /// **'Apply for Loan'**
  String get applyLoan;

  /// No description provided for @govtSchemes.
  ///
  /// In en, this message translates to:
  /// **'Government Schemes'**
  String get govtSchemes;

  /// No description provided for @academy.
  ///
  /// In en, this message translates to:
  /// **'IGO Class Academy'**
  String get academy;

  /// No description provided for @startLesson.
  ///
  /// In en, this message translates to:
  /// **'Start Lesson'**
  String get startLesson;

  /// No description provided for @lessonComplete.
  ///
  /// In en, this message translates to:
  /// **'Lesson Completed!'**
  String get lessonComplete;

  /// No description provided for @jobPortal.
  ///
  /// In en, this message translates to:
  /// **'Agri Job Portal'**
  String get jobPortal;

  /// No description provided for @applyNow.
  ///
  /// In en, this message translates to:
  /// **'Apply Now'**
  String get applyNow;

  /// No description provided for @franchiseOpps.
  ///
  /// In en, this message translates to:
  /// **'Franchise Opportunities'**
  String get franchiseOpps;

  /// No description provided for @jointVentures.
  ///
  /// In en, this message translates to:
  /// **'Joint Ventures'**
  String get jointVentures;

  /// No description provided for @landListings.
  ///
  /// In en, this message translates to:
  /// **'Farmland Listings'**
  String get landListings;

  /// No description provided for @vendorDashboard.
  ///
  /// In en, this message translates to:
  /// **'Vendor Dashboard'**
  String get vendorDashboard;

  /// No description provided for @myProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get myProfile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get logout;

  /// No description provided for @markAllRead.
  ///
  /// In en, this message translates to:
  /// **'Mark All as Read'**
  String get markAllRead;

  /// No description provided for @clearAll.
  ///
  /// In en, this message translates to:
  /// **'Clear All'**
  String get clearAll;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @noNotifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get noNotifications;

  /// No description provided for @hubProfile.
  ///
  /// In en, this message translates to:
  /// **'My Profile'**
  String get hubProfile;

  /// No description provided for @hubVendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor Dashboard'**
  String get hubVendor;

  /// No description provided for @hubFinance.
  ///
  /// In en, this message translates to:
  /// **'Farm Wallet & Loans'**
  String get hubFinance;

  /// No description provided for @hubLearn.
  ///
  /// In en, this message translates to:
  /// **'Class Academy'**
  String get hubLearn;

  /// No description provided for @hubOpps.
  ///
  /// In en, this message translates to:
  /// **'Estates Franchises'**
  String get hubOpps;

  /// No description provided for @hubJobs.
  ///
  /// In en, this message translates to:
  /// **'Agri Job Portal'**
  String get hubJobs;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @featureUnderDevelopment.
  ///
  /// In en, this message translates to:
  /// **'This feature is under development'**
  String get featureUnderDevelopment;

  /// No description provided for @quickActions.
  ///
  /// In en, this message translates to:
  /// **'Quick Actions'**
  String get quickActions;

  /// No description provided for @igoBrands.
  ///
  /// In en, this message translates to:
  /// **'IGO Universe Brands'**
  String get igoBrands;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewAll;

  /// No description provided for @searchProducts.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get searchProducts;

  /// No description provided for @categories.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get categories;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'hi', 'ta'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
    case 'ta':
      return AppLocalizationsTa();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
