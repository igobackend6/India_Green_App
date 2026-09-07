// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Assamese (`as`).
class AppLocalizationsAs extends AppLocalizations {
  AppLocalizationsAs([String locale = 'as']) : super(locale);

  @override
  String get appTitle => 'ইণ্ডিয়া গ্ৰীণ এপ';

  @override
  String get tagline => 'এটা এপ। প্ৰতিজন খেতিয়ক। প্ৰতিজন অংশীদাৰ।';

  @override
  String get navHome => 'হোম';

  @override
  String get navMarket => 'সামগ্ৰী';

  @override
  String get navMandi => 'মাণ্ডি';

  @override
  String get navServices => 'সেৱাসমূহ';

  @override
  String get navAiDoc => 'AI ডাক্তৰ';

  @override
  String get navHubs => 'হাব';

  @override
  String welcomeUser(String name) {
    return 'স্বাগতম, $name!';
  }

  @override
  String get salemFarmerHub => 'চালেম কৃষক হাব';

  @override
  String get selectLanguage => 'আপোনাৰ ভাষা বাছনি কৰক';

  @override
  String get selectLanguageSubtitle =>
      'অব্যাহত ৰাখিবলৈ আপোনাৰ পছন্দৰ ভাষা বাছনি কৰক';

  @override
  String get selectRoles => 'আপোনাৰ ভূমিকা বাছনি কৰক';

  @override
  String get selectRolesSubtitle =>
      'আপোনাক বৰ্ণনা কৰা এটা বা তাতকৈ অধিক ভূমিকা বাছনি কৰক';

  @override
  String get continueBtn => 'অব্যাহত ৰাখক';

  @override
  String get loginWithOtp => 'OTP ৰে লগইন কৰক';

  @override
  String get enterPhone => 'ম\'বাইল নম্বৰ দিয়ক';

  @override
  String get enterOtp => '৬-সংখ্যাৰ OTP দিয়ক';

  @override
  String get verifyOtp => 'OTP নিশ্চিত কৰক';

  @override
  String get sendOtp => 'OTP পঠিয়াওক';

  @override
  String get resendOtp => 'পুনৰ OTP পঠিয়াওক';

  @override
  String get enterName => 'আপোনাৰ নাম দিয়ক';

  @override
  String get enterPincode => 'পিনক\'ড দিয়ক';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone লৈ OTP পঠিওৱা হৈছে';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'বাস্কেটত যোগ কৰক';

  @override
  String get placeOrder => 'অৰ্ডাৰ কৰক';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count বস্তু',
      one: '1 বস্তু',
      zero: 'খালী বাস্কেট',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'শস্য ডাক্তৰ';

  @override
  String get askCropDoctor => 'আপোনাৰ শস্যৰ সমস্যা বৰ্ণনা কৰক...';

  @override
  String get diagnosing => 'পাতৰ প্ৰতিচ্ছবি বিশ্লেষণ কৰা হৈছে...';

  @override
  String get farmWallet => 'ফাৰ্ম ৱালেট';

  @override
  String get addMoney => 'টকা যোগ কৰক';

  @override
  String get applyLoan => 'ঋণৰ বাবে আবেদন কৰক';

  @override
  String get govtSchemes => 'চৰকাৰী আঁচনি';

  @override
  String get academy => 'IGO শ্ৰেণী একাডেমী';

  @override
  String get startLesson => 'পাঠ আৰম্ভ কৰক';

  @override
  String get lessonComplete => 'পাঠ সম্পূৰ্ণ হ\'ল!';

  @override
  String get jobPortal => 'কৃষি চাকৰি পৰ্টেল';

  @override
  String get applyNow => 'এতিয়াই আবেদন কৰক';

  @override
  String get franchiseOpps => 'ফ্ৰেঞ্চাইজী সুযোগ';

  @override
  String get jointVentures => 'যুটীয়া উদ্যোগ';

  @override
  String get landListings => 'কৃষি মাটিৰ তালিকা';

  @override
  String get vendorDashboard => 'বিক্ৰেতা ডেশ্ববৰ্ড';

  @override
  String get myProfile => 'মোৰ প্ৰ\'ফাইল';

  @override
  String get settings => 'ছেটিংছ';

  @override
  String get logout => 'লগআউট';

  @override
  String get markAllRead => 'সকলো পঢ়া বুলি চিহ্নিত কৰক';

  @override
  String get clearAll => 'সকলো পৰিষ্কাৰ কৰক';

  @override
  String get notifications => 'জাননী';

  @override
  String get noNotifications => 'এতিয়ালৈকে কোনো জাননী নাই';

  @override
  String get hubProfile => 'মোৰ প্ৰ\'ফাইল';

  @override
  String get hubVendor => 'বিক্ৰেতা ডেশ্ববৰ্ড';

  @override
  String get hubFinance => 'ফাৰ্ম ৱালেট আৰু ঋণ';

  @override
  String get hubLearn => 'শ্ৰেণী একাডেমী';

  @override
  String get hubOpps => 'এষ্টেট আৰু ফ্ৰেঞ্চাইজী';

  @override
  String get hubJobs => 'কৃষি চাকৰি পৰ্টেল';

  @override
  String get comingSoon => 'সোনকালে আহিছে';

  @override
  String get featureUnderDevelopment => 'এই বৈশিষ্ট্য উন্নয়নাধীন';

  @override
  String get quickActions => 'দ্ৰুত কাৰ্য';

  @override
  String get igoBrands => 'IGO গ্ৰুপছ';

  @override
  String get viewAll => 'সকলো চাওক';

  @override
  String get searchProducts => 'সামগ্ৰী বিচাৰক...';

  @override
  String get categories => 'শ্ৰেণীসমূহ';

  @override
  String get roleFarmer => 'খেতিয়ক';

  @override
  String get roleFarmerDesc =>
      'ইনপুট কিনক, উৎপাদিত সামগ্ৰী বিক্ৰী কৰক, শস্য পৰামৰ্শ লওক';

  @override
  String get roleVendor => 'বিক্ৰেতা';

  @override
  String get roleVendorDesc =>
      'সামগ্ৰী তালিকাভুক্ত কৰক, অৰ্ডাৰ ব্যৱস্থাপনা কৰক, পেআউট চাওক';

  @override
  String get roleConsumer => 'গ্ৰাহক';

  @override
  String get roleConsumerDesc => 'খেতিৰপৰা টাজা জৈৱিক সামগ্ৰী কিনক';

  @override
  String get roleInvestor => 'বিনিয়োগকাৰী';

  @override
  String get roleInvestorDesc => 'কৃষি মাটি, বণ্ড বা ফ্ৰেঞ্চাইজীত বিনিয়োগ কৰক';

  @override
  String get roleJobSeeker => 'চাকৰি বিচাৰোঁতা';

  @override
  String get roleJobSeekerDesc => 'গোটেই ভাৰতত কৃষি চাকৰি বিচাৰক';

  @override
  String get roleFranchise => 'ফ্ৰেঞ্চাইজী অংশীদাৰ';

  @override
  String get roleFranchiseDesc => 'চৰকাৰী FICO শাখা আৰম্ভ কৰক আৰু বৃদ্ধি কৰক';

  @override
  String get selectAtLeastOneRole => 'অতিকমেও এটা ভূমিকা বাছনি কৰক';

  @override
  String continueWithRoles(int count) {
    return '$count ভূমিকাৰ সৈতে অব্যাহত ৰাখক';
  }

  @override
  String get buyInputs => 'ইনপুট কিনক';

  @override
  String get sellProduce => 'উৎপাদিত সামগ্ৰী বিক্ৰী কৰক';

  @override
  String get mandiPrices => 'মাণ্ডি দৰ';

  @override
  String get loanApply => 'ঋণৰ আবেদন';

  @override
  String get agriJobs => 'কৃষি চাকৰি';

  @override
  String get igoAcademy => 'IGO একাডেমী';

  @override
  String get franchise => 'ফ্ৰেঞ্চাইজী';

  @override
  String get language => 'ভাষা';

  @override
  String get darkMode => 'ডাৰ্ক ম\'ড';

  @override
  String get notificationPrefs => 'জাননী পছন্দ';

  @override
  String get aboutApp => 'INDIA GREEN APP ৰ বিষয়ে';

  @override
  String get seedsCategory => 'কৃষি\nইনপুট';

  @override
  String get polyhouseCategory => 'পলিহাউচ\nগঠন';

  @override
  String get horticultureCatalogCategory => 'উদ্যানপালন\nকেটেলগ';

  @override
  String get controlAutomationCategory => 'নিয়ন্ত্ৰণ আৰু\nঅটোমেচন';

  @override
  String get digitalAgriCategory => 'ডিজিটেল কৃষি\nআৰু IoT';

  @override
  String get postHarvestLegacyCategory => 'শস্য চপোৱাৰ পিছত\nআৰু ঐতিহ্য';

  @override
  String get featuredProducts => 'বৈশিষ্ট্যযুক্ত সামগ্ৰী';

  @override
  String get addToCart => 'কাৰ্টত যোগ কৰক';

  @override
  String get liveMandiPrices => 'লাইভ মাণ্ডি দৰ';

  @override
  String get salemApmcMarket => 'চালেম APMC বজাৰ';

  @override
  String get change => 'পৰিৱৰ্তন';

  @override
  String get arrival => 'আগমন';

  @override
  String get scanCropDisease => 'শস্যৰ ৰোগ স্কেন কৰক';

  @override
  String get scanCropDiseaseDesc =>
      'তৎক্ষণাৎ AI ৰোগ নিৰ্ণয় আৰু চিকিৎসাৰ পৰামৰ্শ পাবলৈ আপোনাৰ প্ৰভাৱিত শস্যৰ পাতৰ ফটো তোলক।';

  @override
  String get openCamera => 'কেমেৰা খোলক';

  @override
  String get analyzePhoto => 'ফটো বিশ্লেষণ কৰক';

  @override
  String get analyzing => 'আপোনাৰ শস্য বিশ্লেষণ কৰা হৈছে...';

  @override
  String get navProjects => 'প্ৰকল্প';

  @override
  String get navCourse => 'কোৰ্চ';

  @override
  String get projectsTitle => 'প্ৰকল্প';

  @override
  String get agriFarmingProjects => 'কৃষি প্ৰকল্প';

  @override
  String get aquacultureProjects => 'জলকৃষি প্ৰকল্প';

  @override
  String get livestockFarmingProjects => 'পশুপালন প্ৰকল্প';

  @override
  String get farmEngineeringProjects => 'কৃষি অভিযান্ত্ৰিক প্ৰকল্প';

  @override
  String get userDetailsTitle => 'আপোনাৰ বিষয়ে কওক';

  @override
  String get userDetailsSubtitle =>
      'আপোনাৰ অভিজ্ঞতা ব্যক্তিগতকৰণৰ বাবে কিছু বিৱৰণ';

  @override
  String get enterAddress => 'আপোনাৰ গাঁও / চহৰ দিয়ক';

  @override
  String get addressHint => 'গাঁও, তালুক, জিলা';

  @override
  String get completeProfile => 'প্ৰ\'ফাইল সম্পূৰ্ণ কৰক আৰু এপত প্ৰৱেশ কৰক';
}
