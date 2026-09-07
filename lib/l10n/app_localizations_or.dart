// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get appTitle => 'ଇଣ୍ଡିଆ ଗ୍ରୀନ୍ ଆପ୍';

  @override
  String get tagline => 'ଏକ ଆପ୍। ପ୍ରତ୍ୟେକ କୃଷକ। ପ୍ରତ୍ୟେକ ସହଭାଗୀ।';

  @override
  String get navHome => 'ହୋମ୍';

  @override
  String get navMarket => 'ଉତ୍ପାଦ';

  @override
  String get navMandi => 'ମଣ୍ଡି';

  @override
  String get navServices => 'ସେବା';

  @override
  String get navAiDoc => 'AI ଡାକ୍ତର';

  @override
  String get navHubs => 'ହବ୍';

  @override
  String welcomeUser(String name) {
    return 'ସ୍ୱାଗତ, $name!';
  }

  @override
  String get salemFarmerHub => 'ସେଲମ୍ କୃଷକ ହବ୍';

  @override
  String get selectLanguage => 'ଆପଣଙ୍କ ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get selectLanguageSubtitle =>
      'ଜାରି ରଖିବାକୁ ଆପଣଙ୍କ ପସନ୍ଦର ଭାଷା ବାଛନ୍ତୁ';

  @override
  String get selectRoles => 'ଆପଣଙ୍କ ଭୂମିକା ବାଛନ୍ତୁ';

  @override
  String get selectRolesSubtitle =>
      'ଆପଣଙ୍କୁ ବର୍ଣ୍ଣନା କରୁଥିବା ଏକ କିମ୍ବା ଅଧିକ ଭୂମିକା ବାଛନ୍ତୁ';

  @override
  String get continueBtn => 'ଜାରି ରଖନ୍ତୁ';

  @override
  String get loginWithOtp => 'OTP ସହିତ ଲଗଇନ୍ କରନ୍ତୁ';

  @override
  String get enterPhone => 'ମୋବାଇଲ୍ ନମ୍ବର ଲେଖନ୍ତୁ';

  @override
  String get enterOtp => '6-ଅଙ୍କ ବିଶିଷ୍ଟ OTP ଲେଖନ୍ତୁ';

  @override
  String get verifyOtp => 'OTP ଯାଞ୍ଚ କରନ୍ତୁ';

  @override
  String get sendOtp => 'OTP ପଠାନ୍ତୁ';

  @override
  String get resendOtp => 'OTP ପୁନର୍ବାର ପଠାନ୍ତୁ';

  @override
  String get enterName => 'ଆପଣଙ୍କ ନାମ ଲେଖନ୍ତୁ';

  @override
  String get enterPincode => 'ପିନ୍‌କୋଡ୍ ଲେଖନ୍ତୁ';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phoneକୁ OTP ପଠାଯାଇଛି';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'ଟୋକେଇରେ ଯୋଡନ୍ତୁ';

  @override
  String get placeOrder => 'ଅର୍ଡର କରନ୍ତୁ';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ଆଇଟମ୍',
      one: '1 ଆଇଟମ୍',
      zero: 'ଖାଲି ଟୋକେଇ',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'ଫସଲ ଡାକ୍ତର';

  @override
  String get askCropDoctor => 'ଆପଣଙ୍କ ଫସଲର ସମସ୍ୟା ବର୍ଣ୍ଣନା କରନ୍ତୁ...';

  @override
  String get diagnosing => 'ପତ୍ର ପ୍ରତିଛବିର ବିଶ୍ଳେଷଣ ହେଉଛି...';

  @override
  String get farmWallet => 'ଫାର୍ମ ୱାଲେଟ୍';

  @override
  String get addMoney => 'ଟଙ୍କା ଯୋଡନ୍ତୁ';

  @override
  String get applyLoan => 'ଋଣ ପାଇଁ ଆବେଦନ କରନ୍ତୁ';

  @override
  String get govtSchemes => 'ସରକାରୀ ଯୋଜନା';

  @override
  String get academy => 'IGO କ୍ଲାସ୍ ଏକାଡେମୀ';

  @override
  String get startLesson => 'ପାଠ ଆରମ୍ଭ କରନ୍ତୁ';

  @override
  String get lessonComplete => 'ପାଠ ସମ୍ପୂର୍ଣ୍ଣ ହେଲା!';

  @override
  String get jobPortal => 'କୃଷି ଚାକିରି ପୋର୍ଟାଲ୍';

  @override
  String get applyNow => 'ବର୍ତ୍ତମାନ ଆବେଦନ କରନ୍ତୁ';

  @override
  String get franchiseOpps => 'ଫ୍ରାଞ୍ଚାଇଜ୍ ସୁଯୋଗ';

  @override
  String get jointVentures => 'ମିଳିତ ଉଦ୍ୟୋଗ';

  @override
  String get landListings => 'ଚାଷ ଜମି ତାଲିକା';

  @override
  String get vendorDashboard => 'ବିକ୍ରେତା ଡ୍ୟାସବୋର୍ଡ';

  @override
  String get myProfile => 'ମୋର ପ୍ରୋଫାଇଲ୍';

  @override
  String get settings => 'ସେଟିଂସ୍';

  @override
  String get logout => 'ଲଗ୍ ଆଉଟ୍';

  @override
  String get markAllRead => 'ସମସ୍ତଙ୍କୁ ପଢ଼ାଯାଇଛି ବୋଲି ଚିହ୍ନଟ କରନ୍ତୁ';

  @override
  String get clearAll => 'ସବୁ ସଫା କରନ୍ତୁ';

  @override
  String get notifications => 'ବିଜ୍ଞପ୍ତି';

  @override
  String get noNotifications => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ବିଜ୍ଞପ୍ତି ନାହିଁ';

  @override
  String get hubProfile => 'ମୋର ପ୍ରୋଫାଇଲ୍';

  @override
  String get hubVendor => 'ବିକ୍ରେତା ଡ୍ୟାସବୋର୍ଡ';

  @override
  String get hubFinance => 'ଫାର୍ମ ୱାଲେଟ୍ ଓ ଋଣ';

  @override
  String get hubLearn => 'କ୍ଲାସ୍ ଏକାଡେମୀ';

  @override
  String get hubOpps => 'ଏଷ୍ଟେଟ୍ ଓ ଫ୍ରାଞ୍ଚାଇଜ୍';

  @override
  String get hubJobs => 'କୃଷି ଚାକିରି ପୋର୍ଟାଲ୍';

  @override
  String get comingSoon => 'ଶୀଘ୍ର ଆସୁଛି';

  @override
  String get featureUnderDevelopment => 'ଏହି ବିଶେଷତା ବିକାଶାଧୀନ';

  @override
  String get quickActions => 'ଶୀଘ୍ର କାର୍ଯ୍ୟ';

  @override
  String get igoBrands => 'IGO ଗ୍ରୁପ୍ସ';

  @override
  String get viewAll => 'ସବୁ ଦେଖନ୍ତୁ';

  @override
  String get searchProducts => 'ଉତ୍ପାଦ ଖୋଜନ୍ତୁ...';

  @override
  String get categories => 'ବର୍ଗ';

  @override
  String get roleFarmer => 'କୃଷକ';

  @override
  String get roleFarmerDesc =>
      'ଇନପୁଟ କିଣନ୍ତୁ, ଉତ୍ପାଦ ବିକ୍ରି କରନ୍ତୁ, ଫସଲ ପରାମର୍ଶ ପାଆନ୍ତୁ';

  @override
  String get roleVendor => 'ବିକ୍ରେତା';

  @override
  String get roleVendorDesc =>
      'ଉତ୍ପାଦ ତାଲିକାଭୁକ୍ତ କରନ୍ତୁ, ଅର୍ଡର ପରିଚାଳନା କରନ୍ତୁ, ପେଆଉଟ୍ ଦେଖନ୍ତୁ';

  @override
  String get roleConsumer => 'ଉପଭୋକ୍ତା';

  @override
  String get roleConsumerDesc => 'ଚାଷରୁ ତାଜା ଜୈବିକ ଉତ୍ପାଦ କିଣନ୍ତୁ';

  @override
  String get roleInvestor => 'ବିନିଯୋଗକାରୀ';

  @override
  String get roleInvestorDesc =>
      'ଚାଷ ଜମି, ବଣ୍ଡ କିମ୍ବା ଫ୍ରାଞ୍ଚାଇଜ୍‌ ବିନିଯୋଗ କରନ୍ତୁ';

  @override
  String get roleJobSeeker => 'ଚାକିରି ଅନ୍ଵେଷଣକାରୀ';

  @override
  String get roleJobSeekerDesc => 'ସାରା ଭାରତରେ କୃଷି ଚାକିରି ଖୋଜନ୍ତୁ';

  @override
  String get roleFranchise => 'ଫ୍ରାଞ୍ଚାଇଜ୍ ସହଭାଗୀ';

  @override
  String get roleFranchiseDesc => 'ସରକାରୀ FICO ଶାଖା ଆରମ୍ଭ କରନ୍ତୁ ଏବଂ ବଢ଼ାନ୍ତୁ';

  @override
  String get selectAtLeastOneRole => 'ଅତିକମରେ ଗୋଟିଏ ଭୂମିକା ବାଛନ୍ତୁ';

  @override
  String continueWithRoles(int count) {
    return '$count ଭୂମିକା ସହିତ ଜାରି ରଖନ୍ତୁ';
  }

  @override
  String get buyInputs => 'ଇନପୁଟ କିଣନ୍ତୁ';

  @override
  String get sellProduce => 'ଉତ୍ପାଦ ବିକ୍ରି କରନ୍ତୁ';

  @override
  String get mandiPrices => 'ମଣ୍ଡି ମୂଲ୍ୟ';

  @override
  String get loanApply => 'ଋଣ ଆବେଦନ';

  @override
  String get agriJobs => 'କୃଷି ଚାକିରି';

  @override
  String get igoAcademy => 'IGO ଏକାଡେମୀ';

  @override
  String get franchise => 'ଫ୍ରାଞ୍ଚାଇଜ୍';

  @override
  String get language => 'ଭାଷା';

  @override
  String get darkMode => 'ଡାର୍କ ମୋଡ୍';

  @override
  String get notificationPrefs => 'ବିଜ୍ଞପ୍ତି ପସନ୍ଦ';

  @override
  String get aboutApp => 'INDIA GREEN APP ବିଷୟରେ';

  @override
  String get seedsCategory => 'କୃଷି\nଇନପୁଟ';

  @override
  String get polyhouseCategory => 'ପଲିହାଉସ୍\nସଂରଚନା';

  @override
  String get horticultureCatalogCategory => 'ବଗିଚା\nକାଟାଲଗ';

  @override
  String get controlAutomationCategory => 'ନିୟନ୍ତ୍ରଣ ଓ\nଅଟୋମେସନ';

  @override
  String get digitalAgriCategory => 'ଡିଜିଟାଲ କୃଷି\nଓ IoT';

  @override
  String get postHarvestLegacyCategory => 'ଅମଳ ପରେ\nଓ ଉତ୍ତରାଧିକାର';

  @override
  String get featuredProducts => 'ବିଶେଷ ଉତ୍ପାଦ';

  @override
  String get addToCart => 'କାର୍ଟରେ ଯୋଡନ୍ତୁ';

  @override
  String get liveMandiPrices => 'ଲାଇଭ୍ ମଣ୍ଡି ମୂଲ୍ୟ';

  @override
  String get salemApmcMarket => 'ସେଲମ୍ APMC ବଜାର';

  @override
  String get change => 'ପରିବର୍ତ୍ତନ';

  @override
  String get arrival => 'ଆଗମନ';

  @override
  String get scanCropDisease => 'ଫସଲ ରୋଗ ସ୍କାନ କରନ୍ତୁ';

  @override
  String get scanCropDiseaseDesc =>
      'ତତକ୍ଷଣାତ AI ନିଦାନ ଏବଂ ଚିକିତ୍ସା ପରାମର୍ଶ ପାଇବାକୁ ଆପଣଙ୍କ ପ୍ରଭାବିତ ଫସଲ ପତ୍ରର ଫଟୋ ନିଅନ୍ତୁ।';

  @override
  String get openCamera => 'କ୍ୟାମେରା ଖୋଲନ୍ତୁ';

  @override
  String get analyzePhoto => 'ଫଟୋ ବିଶ୍ଳେଷଣ କରନ୍ତୁ';

  @override
  String get analyzing => 'ଆପଣଙ୍କ ଫସଲର ବିଶ୍ଳେଷଣ ହେଉଛି...';

  @override
  String get navProjects => 'ପ୍ରୋଜେକ୍ଟ';

  @override
  String get navCourse => 'କୋର୍ସ';

  @override
  String get projectsTitle => 'ପ୍ରୋଜେକ୍ଟ';

  @override
  String get agriFarmingProjects => 'କୃଷି ପ୍ରୋଜେକ୍ଟ';

  @override
  String get aquacultureProjects => 'ଜଳଚାଷ ପ୍ରୋଜେକ୍ଟ';

  @override
  String get livestockFarmingProjects => 'ପଶୁପାଳନ ପ୍ରୋଜେକ୍ଟ';

  @override
  String get farmEngineeringProjects => 'କୃଷି ଇଂଜିନିୟରିଂ ପ୍ରୋଜେକ୍ଟ';

  @override
  String get userDetailsTitle => 'ଆପଣଙ୍କ ବିଷୟରେ କୁହନ୍ତୁ';

  @override
  String get userDetailsSubtitle =>
      'ଆପଣଙ୍କ ଅଭିଜ୍ଞତାକୁ ବ୍ୟକ୍ତିଗତ କରିବାକୁ କିଛି ବିବରଣୀ';

  @override
  String get enterAddress => 'ଆପଣଙ୍କ ଗାଁ / ସହର ଲେଖନ୍ତୁ';

  @override
  String get addressHint => 'ଗାଁ, ତହସିଲ, ଜିଲ୍ଲା';

  @override
  String get completeProfile =>
      'ପ୍ରୋଫାଇଲ୍ ସମ୍ପୂର୍ଣ୍ଣ କରନ୍ତୁ ଏବଂ ଆପ୍‌ରେ ପ୍ରବେଶ କରନ୍ତୁ';
}
