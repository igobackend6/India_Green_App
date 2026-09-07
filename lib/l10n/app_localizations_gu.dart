// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get appTitle => 'ઇન્ડિયા ગ્રીન એપ';

  @override
  String get tagline => 'એક એપ. દરેક ખેડૂત. દરેક ભાગીદાર.';

  @override
  String get navHome => 'હોમ';

  @override
  String get navMarket => 'ઉત્પાદનો';

  @override
  String get navMandi => 'મંડી';

  @override
  String get navServices => 'સેવાઓ';

  @override
  String get navAiDoc => 'AI ડોક્ટર';

  @override
  String get navHubs => 'હબ';

  @override
  String welcomeUser(String name) {
    return 'સ્વાગત છે, $name!';
  }

  @override
  String get salemFarmerHub => 'સાલેમ ફાર્મર હબ';

  @override
  String get selectLanguage => 'તમારી ભાષા પસંદ કરો';

  @override
  String get selectLanguageSubtitle =>
      'આગળ વધવા માટે તમારી પસંદગીની ભાષા પસંદ કરો';

  @override
  String get selectRoles => 'તમારી ભૂમિકાઓ પસંદ કરો';

  @override
  String get selectRolesSubtitle => 'તમને વર્ણવતી એક અથવા વધુ ભૂમિકાઓ પસંદ કરો';

  @override
  String get continueBtn => 'આગળ વધો';

  @override
  String get loginWithOtp => 'OTP વડે લોગિન કરો';

  @override
  String get enterPhone => 'મોબાઇલ નંબર દાખલ કરો';

  @override
  String get enterOtp => '6 અંકનો OTP દાખલ કરો';

  @override
  String get verifyOtp => 'OTP ચકાસો';

  @override
  String get sendOtp => 'OTP મોકલો';

  @override
  String get resendOtp => 'OTP ફરીથી મોકલો';

  @override
  String get enterName => 'તમારું નામ દાખલ કરો';

  @override
  String get enterPincode => 'પિનકોડ દાખલ કરો';

  @override
  String get phoneHint => '9876543210';

  @override
  String otpSentTo(String phone) {
    return '+91 $phone પર OTP મોકલવામાં આવ્યો છે';
  }

  @override
  String pricePerQuintal(String price) {
    return '₹$price/Qtl';
  }

  @override
  String get addToBasket => 'બાસ્કેટમાં ઉમેરો';

  @override
  String get placeOrder => 'ઓર્ડર આપો';

  @override
  String basketItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count વસ્તુઓ',
      one: '1 વસ્તુ',
      zero: 'ખાલી બાસ્કેટ',
    );
    return '$_temp0';
  }

  @override
  String get cropDoctor => 'પાક ડોક્ટર';

  @override
  String get askCropDoctor => 'તમારી પાકની સમસ્યાનું વર્ણન કરો...';

  @override
  String get diagnosing => 'પાનની છબીનું વિશ્લેષણ થઈ રહ્યું છે...';

  @override
  String get farmWallet => 'ફાર્મ વોલેટ';

  @override
  String get addMoney => 'પૈસા ઉમેરો';

  @override
  String get applyLoan => 'લોન માટે અરજી કરો';

  @override
  String get govtSchemes => 'સરકારી યોજનાઓ';

  @override
  String get academy => 'IGO ક્લાસ એકેડેમી';

  @override
  String get startLesson => 'પાઠ શરૂ કરો';

  @override
  String get lessonComplete => 'પાઠ પૂર્ણ થયો!';

  @override
  String get jobPortal => 'કૃષિ જોબ પોર્ટલ';

  @override
  String get applyNow => 'હમણાં અરજી કરો';

  @override
  String get franchiseOpps => 'ફ્રેન્ચાઇઝી તકો';

  @override
  String get jointVentures => 'સંયુક્ત સાહસો';

  @override
  String get landListings => 'ખેતીની જમીનની યાદી';

  @override
  String get vendorDashboard => 'વિક્રેતા ડેશબોર્ડ';

  @override
  String get myProfile => 'મારી પ્રોફાઇલ';

  @override
  String get settings => 'સેટિંગ્સ';

  @override
  String get logout => 'લોગઆઉટ';

  @override
  String get markAllRead => 'બધું વાંચ્યું તરીકે ચિહ્નિત કરો';

  @override
  String get clearAll => 'બધું સાફ કરો';

  @override
  String get notifications => 'સૂચનાઓ';

  @override
  String get noNotifications => 'હજુ સુધી કોઈ સૂચના નથી';

  @override
  String get hubProfile => 'મારી પ્રોફાઇલ';

  @override
  String get hubVendor => 'વિક્રેતા ડેશબોર્ડ';

  @override
  String get hubFinance => 'ફાર્મ વોલેટ અને લોન';

  @override
  String get hubLearn => 'ક્લાસ એકેડેમી';

  @override
  String get hubOpps => 'એસ્ટેટ્સ અને ફ્રેન્ચાઇઝીસ';

  @override
  String get hubJobs => 'કૃષિ જોબ પોર્ટલ';

  @override
  String get comingSoon => 'ટૂંક સમયમાં આવી રહ્યું છે';

  @override
  String get featureUnderDevelopment => 'આ સુવિધા વિકાસ હેઠળ છે';

  @override
  String get quickActions => 'ઝડપી ક્રિયાઓ';

  @override
  String get igoBrands => 'IGO ગ્રુપ્સ';

  @override
  String get viewAll => 'બધું જુઓ';

  @override
  String get searchProducts => 'ઉત્પાદનો શોધો...';

  @override
  String get categories => 'શ્રેણીઓ';

  @override
  String get roleFarmer => 'ખેડૂત';

  @override
  String get roleFarmerDesc => 'ઇનપુટ ખરીદો, ઉત્પાદન વેચો, પાક સલાહ મેળવો';

  @override
  String get roleVendor => 'વિક્રેતા';

  @override
  String get roleVendorDesc =>
      'ઉત્પાદનોની યાદી બનાવો, ઓર્ડર્સ મેનેજ કરો, પેઆઉટ જુઓ';

  @override
  String get roleConsumer => 'ગ્રાહક';

  @override
  String get roleConsumerDesc => 'ખેતરોમાંથી તાજા ઓર્ગેનિક ઉત્પાદનો ખરીદો';

  @override
  String get roleInvestor => 'રોકાણકાર';

  @override
  String get roleInvestorDesc =>
      'ખેતીની જમીન, બોન્ડ અથવા ફ્રેન્ચાઇઝીમાં રોકાણ કરો';

  @override
  String get roleJobSeeker => 'નોકરી શોધનાર';

  @override
  String get roleJobSeekerDesc => 'સમગ્ર ભારતમાં કૃષિ નોકરીઓ શોધો';

  @override
  String get roleFranchise => 'ફ્રેન્ચાઇઝી ભાગીદાર';

  @override
  String get roleFranchiseDesc => 'સત્તાવાર FICO શાખાઓ શરૂ કરો અને વધારો';

  @override
  String get selectAtLeastOneRole => 'ઓછામાં ઓછી એક ભૂમિકા પસંદ કરો';

  @override
  String continueWithRoles(int count) {
    return '$count ભૂમિકાઓ સાથે આગળ વધો';
  }

  @override
  String get buyInputs => 'ઇનપુટ ખરીદો';

  @override
  String get sellProduce => 'ઉત્પાદન વેચો';

  @override
  String get mandiPrices => 'મંડી ભાવ';

  @override
  String get loanApply => 'લોન અરજી';

  @override
  String get agriJobs => 'કૃષિ નોકરીઓ';

  @override
  String get igoAcademy => 'IGO એકેડેમી';

  @override
  String get franchise => 'ફ્રેન્ચાઇઝી';

  @override
  String get language => 'ભાષા';

  @override
  String get darkMode => 'ડાર્ક મોડ';

  @override
  String get notificationPrefs => 'સૂચના પસંદગીઓ';

  @override
  String get aboutApp => 'INDIA GREEN APP વિશે';

  @override
  String get seedsCategory => 'કૃષિ\nઇનપુટ';

  @override
  String get polyhouseCategory => 'પોલીહાઉસ\nમાળખું';

  @override
  String get horticultureCatalogCategory => 'બાગાયત\nકેટલોગ';

  @override
  String get controlAutomationCategory => 'નિયંત્રણ અને\nઓટોમેશન';

  @override
  String get digitalAgriCategory => 'ડિજિટલ કૃષિ\n અને IoT';

  @override
  String get postHarvestLegacyCategory => 'લણણી પછી\n અને વારસો';

  @override
  String get featuredProducts => 'વિશેષ ઉત્પાદનો';

  @override
  String get addToCart => 'કાર્ટમાં ઉમેરો';

  @override
  String get liveMandiPrices => 'લાઇવ મંડી ભાવ';

  @override
  String get salemApmcMarket => 'સાલેમ APMC બજાર';

  @override
  String get change => 'ફેરફાર';

  @override
  String get arrival => 'આવક';

  @override
  String get scanCropDisease => 'પાક રોગ સ્કેન કરો';

  @override
  String get scanCropDiseaseDesc =>
      'તાત્કાલિક AI નિદાન અને સારવારની ભલામણો મેળવવા માટે તમારા અસરગ્રસ્ત પાકના પાનનો ફોટો લો.';

  @override
  String get openCamera => 'કેમેરો ખોલો';

  @override
  String get analyzePhoto => 'ફોટોનું વિશ્લેષણ કરો';

  @override
  String get analyzing => 'તમારા પાકનું વિશ્લેષણ થઈ રહ્યું છે...';

  @override
  String get navProjects => 'પ્રોજેક્ટ્સ';

  @override
  String get navCourse => 'કોર્સ';

  @override
  String get projectsTitle => 'પ્રોજેક્ટ્સ';

  @override
  String get agriFarmingProjects => 'કૃષિ પ્રોજેક્ટ્સ';

  @override
  String get aquacultureProjects => 'જળચર ખેતી પ્રોજેક્ટ્સ';

  @override
  String get livestockFarmingProjects => 'પશુપાલન પ્રોજેક્ટ્સ';

  @override
  String get farmEngineeringProjects => 'કૃષિ એન્જિનિયરિંગ પ્રોજેક્ટ્સ';

  @override
  String get userDetailsTitle => 'તમારા વિશે જણાવો';

  @override
  String get userDetailsSubtitle =>
      'તમારા અનુભવને વ્યક્તિગત બનાવવા માટે થોડી વિગતો';

  @override
  String get enterAddress => 'તમારું ગામ / શહેર દાખલ કરો';

  @override
  String get addressHint => 'ગામ, તાલુકો, જિલ્લો';

  @override
  String get completeProfile => 'પ્રોફાઇલ પૂર્ણ કરો અને એપમાં પ્રવેશ કરો';
}
