// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get appTitle => 'ইন্ডিয়া গ্রিন অ্যাপ';

  @override
  String get tagline => 'একটি অ্যাপ। প্রতিটি কৃষক। প্রতিটি অংশীদার।';

  @override
  String get navHome => 'হোম';

  @override
  String get navMarket => 'পণ্য';

  @override
  String get navMandi => 'মান্ডি';

  @override
  String get navServices => 'পরিষেবা';

  @override
  String get navAiDoc => 'AI ডাক্তার';

  @override
  String get navHubs => 'হাব';

  @override
  String welcomeUser(String name) {
    return 'স্বাগতম, $name!';
  }

  @override
  String get salemFarmerHub => 'সালেম কৃষক হাব';

  @override
  String get selectLanguage => 'আপনার ভাষা নির্বাচন করুন';

  @override
  String get selectLanguageSubtitle =>
      'চালিয়ে যেতে আপনার পছন্দের ভাষা বেছে নিন';

  @override
  String get selectRoles => 'আপনার ভূমিকা বেছে নিন';

  @override
  String get selectRolesSubtitle =>
      'আপনাকে বর্ণনা করে এমন এক বা একাধিক ভূমিকা নির্বাচন করুন';

  @override
  String get continueBtn => 'চালিয়ে যান';

  @override
  String get loginWithOtp => 'OTP দিয়ে লগইন করুন';

  @override
  String get enterPhone => 'মোবাইল নম্বর লিখুন';

  @override
  String get enterOtp => '৬-সংখ্যার OTP লিখুন';

  @override
  String get verifyOtp => 'OTP যাচাই করুন';

  @override
  String get sendOtp => 'OTP পাঠান';

  @override
  String get resendOtp => 'পুনরায় OTP পাঠান';

  @override
  String get enterName => 'আপনার নাম লিখুন';

  @override
  String get enterPincode => 'পিনকোড লিখুন';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone নম্বরে OTP পাঠানো হয়েছে';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'ঝুড়িতে যোগ করুন';

  @override
  String get placeOrder => 'অর্ডার করুন';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি আইটেম',
      one: '১টি আইটেম',
      zero: 'খালি ঝুড়ি',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'ফসল ডাক্তার';

  @override
  String get askCropDoctor => 'আপনার ফসলের সমস্যা বর্ণনা করুন...';

  @override
  String get diagnosing => 'পাতার ছবি বিশ্লেষণ করা হচ্ছে...';

  @override
  String get farmWallet => 'ফার্ম ওয়ালেট';

  @override
  String get addMoney => 'টাকা যোগ করুন';

  @override
  String get applyLoan => 'ঋণের জন্য আবেদন করুন';

  @override
  String get govtSchemes => 'সরকারি প্রকল্প';

  @override
  String get academy => 'IGO ক্লাস একাডেমি';

  @override
  String get startLesson => 'পাঠ শুরু করুন';

  @override
  String get lessonComplete => 'পাঠ সম্পন্ন হয়েছে!';

  @override
  String get jobPortal => 'কৃষি চাকরি পোর্টাল';

  @override
  String get applyNow => 'এখনই আবেদন করুন';

  @override
  String get franchiseOpps => 'ফ্র্যাঞ্চাইজি সুযোগ';

  @override
  String get jointVentures => 'যৌথ উদ্যোগ';

  @override
  String get landListings => 'কৃষি জমির তালিকা';

  @override
  String get vendorDashboard => 'বিক্রেতা ড্যাশবোর্ড';

  @override
  String get myProfile => 'আমার প্রোফাইল';

  @override
  String get settings => 'সেটিংস';

  @override
  String get logout => 'লগআউট';

  @override
  String get markAllRead => 'সব পঠিত হিসেবে চিহ্নিত করুন';

  @override
  String get clearAll => 'সব মুছে ফেলুন';

  @override
  String get notifications => 'বিজ্ঞপ্তি';

  @override
  String get noNotifications => 'এখনও কোনো বিজ্ঞপ্তি নেই';

  @override
  String get hubProfile => 'আমার প্রোফাইল';

  @override
  String get hubVendor => 'বিক্রেতা ড্যাশবোর্ড';

  @override
  String get hubFinance => 'ফার্ম ওয়ালেট ও ঋণ';

  @override
  String get hubLearn => 'ক্লাস একাডেমি';

  @override
  String get hubOpps => 'এস্টেট ও ফ্র্যাঞ্চাইজি';

  @override
  String get hubJobs => 'কৃষি চাকরি পোর্টাল';

  @override
  String get comingSoon => 'শীঘ্রই আসছে';

  @override
  String get featureUnderDevelopment => 'এই বৈশিষ্ট্যটি উন্নয়নাধীন';

  @override
  String get quickActions => 'দ্রুত কার্যক্রম';

  @override
  String get igoBrands => 'IGO গ্রুপস';

  @override
  String get viewAll => 'সব দেখুন';

  @override
  String get searchProducts => 'পণ্য খুঁজুন...';

  @override
  String get categories => 'বিভাগসমূহ';

  @override
  String get roleFarmer => 'কৃষক';

  @override
  String get roleFarmerDesc =>
      'উপকরণ কিনুন, ফসল বিক্রি করুন, ফসলের পরামর্শ নিন';

  @override
  String get roleVendor => 'বিক্রেতা';

  @override
  String get roleVendorDesc =>
      'পণ্য তালিকাভুক্ত করুন, অর্ডার পরিচালনা করুন, পেআউট দেখুন';

  @override
  String get roleConsumer => 'ভোক্তা';

  @override
  String get roleConsumerDesc => 'খামার থেকে তাজা জৈব পণ্য কিনুন';

  @override
  String get roleInvestor => 'বিনিয়োগকারী';

  @override
  String get roleInvestorDesc =>
      'কৃষি জমি, বন্ড বা ফ্র্যাঞ্চাইজিতে বিনিয়োগ করুন';

  @override
  String get roleJobSeeker => 'চাকরি প্রার্থী';

  @override
  String get roleJobSeekerDesc => 'সারা ভারতে কৃষি চাকরি খুঁজুন';

  @override
  String get roleFranchise => 'ফ্র্যাঞ্চাইজি অংশীদার';

  @override
  String get roleFranchiseDesc => 'সরকারী FICO শাখা চালু করুন ও বৃদ্ধি করুন';

  @override
  String get selectAtLeastOneRole => 'অন্তত একটি ভূমিকা নির্বাচন করুন';

  @override
  String continueWithRoles(int count) {
    return '$countটি ভূমিকা নিয়ে চালিয়ে যান';
  }

  @override
  String get buyInputs => 'উপকরণ কিনুন';

  @override
  String get sellProduce => 'ফসল বিক্রি করুন';

  @override
  String get mandiPrices => 'মান্ডি দাম';

  @override
  String get loanApply => 'ঋণ আবেদন';

  @override
  String get agriJobs => 'কৃষি চাকরি';

  @override
  String get igoAcademy => 'IGO একাডেমি';

  @override
  String get franchise => 'ফ্র্যাঞ্চাইজি';

  @override
  String get language => 'ভাষা';

  @override
  String get darkMode => 'ডার্ক মোড';

  @override
  String get notificationPrefs => 'বিজ্ঞপ্তি পছন্দ';

  @override
  String get aboutApp => 'INDIA GREEN APP সম্পর্কে';

  @override
  String get seedsCategory => 'কৃষি\nউপকরণ';

  @override
  String get polyhouseCategory => 'পলিহাউস\nকাঠামো';

  @override
  String get horticultureCatalogCategory => 'উদ্যানপালন\nক্যাটালগ';

  @override
  String get controlAutomationCategory => 'নিয়ন্ত্রণ ও\nঅটোমেশন';

  @override
  String get digitalAgriCategory => 'ডিজিটাল কৃষি\n ও IoT';

  @override
  String get postHarvestLegacyCategory => 'ফসল কাটার পরে\n ও ঐতিহ্য';

  @override
  String get featuredProducts => 'বৈশিষ্ট্যযুক্ত পণ্য';

  @override
  String get addToCart => 'কার্টে যোগ করুন';

  @override
  String get liveMandiPrices => 'লাইভ মান্ডি দাম';

  @override
  String get salemApmcMarket => 'সালেম APMC বাজার';

  @override
  String get change => 'পরিবর্তন';

  @override
  String get arrival => 'আগমন';

  @override
  String get scanCropDisease => 'ফসলের রোগ স্ক্যান করুন';

  @override
  String get scanCropDiseaseDesc =>
      'তাৎক্ষণিক AI নির্ণয় এবং চিকিৎসার পরামর্শ পেতে আপনার আক্রান্ত ফসলের পাতার ছবি তুলুন।';

  @override
  String get openCamera => 'ক্যামেরা খুলুন';

  @override
  String get analyzePhoto => 'ছবি বিশ্লেষণ করুন';

  @override
  String get analyzing => 'আপনার ফসল বিশ্লেষণ করা হচ্ছছে...';

  @override
  String get navProjects => 'প্রকল্প';

  @override
  String get navCourse => 'কোর্স';

  @override
  String get projectsTitle => 'প্রকল্প';

  @override
  String get agriFarmingProjects => 'কৃষি প্রকল্প';

  @override
  String get aquacultureProjects => 'জলজ চাষ প্রকল্প';

  @override
  String get livestockFarmingProjects => 'পশুপালন প্রকল্প';

  @override
  String get farmEngineeringProjects => 'কৃষি প্রকৌশল প্রকল্প';

  @override
  String get userDetailsTitle => 'আপনার সম্পর্কে বলুন';

  @override
  String get userDetailsSubtitle =>
      'আপনার অভিজ্ঞতা ব্যক্তিগতকরণের জন্য কিছু বিবরণ';

  @override
  String get enterAddress => 'আপনার গ্রাম / শহর লিখুন';

  @override
  String get addressHint => 'গ্রাম, তালুক, জেলা';

  @override
  String get completeProfile => 'প্রোফাইল সম্পূর্ণকরুন এবং অ্যাপে প্রবেশ করুন';
}
