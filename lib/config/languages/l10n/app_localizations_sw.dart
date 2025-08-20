// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swahili (`sw`).
class AppLocalizationsSw extends AppLocalizations {
  AppLocalizationsSw([String locale = 'sw']) : super(locale);

  @override
  String get requiredField => 'Huu uwanja unahitajika';

  @override
  String get invalidEmail => 'Tafadhali ingiza anwani ya barua pepe inayofaa';

  @override
  String get invalidPhone => 'Tafadhali ingiza nambari ya simu inayofaa';

  @override
  String get invalidPassword =>
      'Neno la siri lazima liwe na herufi 8 angalau, liwe na herufi kubwa, na nambari';

  @override
  String get invalidDate => 'Tafadhali ingiza tarehe inayofaa (YYYY-MM-DD)';

  @override
  String get passwordMismatch => 'Maneno ya siri hayatofautiani';

  @override
  String get invalidURL => 'Tafadhali ingiza URL inayofaa';

  @override
  String get invalidNumber => 'Tafadhali ingiza nambari inayofaa';

  @override
  String get invalidCreditCard =>
      'Tafadhali ingiza nambari ya kadi ya mkopo inayofaa (nambari 16)';

  @override
  String get invalidPostalCode => 'Tafadhali ingiza nambari ya posta inayofaa';

  @override
  String minLengthError(Object minLength) {
    return 'Ingizo lazima liwe na angalau $minLength wahusika';
  }

  @override
  String maxLengthError(Object maxLength) {
    return 'Ingizo lazima liwe na si zaidi ya $maxLength wahusika';
  }

  @override
  String get invalidPattern => 'Ingizo halifai na mfano unaohitajika';

  @override
  String invalidDateRange(Object endDate, Object startDate) {
    return 'Tarehe lazima iwe kati ya $startDate na $endDate';
  }

  @override
  String otpEntrySubtitle(Object username) {
    return 'Otp imetumwa kwa $username';
  }

  @override
  String get alphaNumericError => 'Herufi na nambari pekee zinazoruhusiwa';

  @override
  String get usernameError =>
      'Jina la mtumiaji lazima liwe na wahusika 3 hadi 15 na linaweza kuwa na herufi, nambari, na alama za chini ya mstari';

  @override
  String get invalidTime =>
      'Tafadhali ingiza muda unaofaa katika fomu ya HH:mm';

  @override
  String get invalidOTP => 'Tafadhali ingiza OTP inayofaa ya nambari 6';

  @override
  String get invalidCurrency =>
      'Tafadhali ingiza kiasi kinachofaa (mfano, 1234.56)';

  @override
  String get invalidIP => 'Tafadhali ingiza anwani ya IPv4 inayofaa';

  @override
  String get allDataLoaded => 'Data zote zimepakiwa';

  @override
  String get nidRequired => 'Nambari ya Kitaifa inahitajika.';

  @override
  String get nidInvalid =>
      'Tafadhali ingiza Nambari ya Kitaifa halali (tarakimu 12).';

  @override
  String get fullNameRequired => 'Jina kamili linahitajika.';

  @override
  String get fullNameInvalid =>
      'Tafadhali ingiza jina kamili halali (mfano: John Doe, O\'Connor, Mary-Jane).';

  @override
  String get seconds => 'Sekunde';

  @override
  String get dataEmpty => 'Data Imetosha';

  @override
  String get delivery => 'Uwasilishaji';

  @override
  String get noInternet => 'Hakuna Mtandao';

  @override
  String get checkInternet => 'Angalia Mtandao';

  @override
  String get back => 'Rudi';

  @override
  String get youSureWantToLogout => 'Je, unataka kweli kutoka?';

  @override
  String get uploadProofs => 'Pakia Ushahidi';

  @override
  String get no => 'Hapana';

  @override
  String get yes => 'Ndio';

  @override
  String get areYouSure => 'Je, una uhakika?';

  @override
  String get enterYouPassword => 'Ingiza neno lako la siri';

  @override
  String get deliveryProofMandatory =>
      'Picha ya bidhaa iliyoletwa na karatasi ya kusaini ya uwasilishaji zinahitajika.';

  @override
  String get cancel => 'Ghairi';

  @override
  String get done => 'Imekamilika';

  @override
  String get deleteDetails =>
      'Mabadiliko yako yote yatafutwa na hutakuwa na uwezo wa kuyapata tena.';

  @override
  String get someThingWrong => 'Kuna Tatizo';

  @override
  String get tryAgain => 'Jaribu Tena';

  @override
  String get phoneNumber => 'Namba ya Simu';

  @override
  String get phoneNo => 'Namba ya Simu';

  @override
  String get riderId => 'Kitambulisho cha Mpanda Pikipiki';

  @override
  String get hubName => 'Jina la Kituo';

  @override
  String get test => 'Jaribio';

  @override
  String get changePassword => 'Badilisha Neno la Siri';

  @override
  String get currentPassword => 'Neno la Siri la Sasa';

  @override
  String get newPassword => 'Neno la Siri Jipya';

  @override
  String get confirmPassword => 'Thibitisha Neno la Siri';

  @override
  String get allOrders => 'Agizo Zote';

  @override
  String get forgotPassword => 'Umesahau Neno la Siri?';

  @override
  String get confirm => 'Thibitisha';

  @override
  String get createNewPassword => 'Tengeneza Neno la Siri Jipya';

  @override
  String get createYourNewPassword => 'Tengeneza Neno lako la Siri Jipya';

  @override
  String get password => 'Neno la Siri';

  @override
  String get continues => 'Endelea';

  @override
  String get email => 'Barua Pepe';

  @override
  String get codeHasBeenSendTo => 'Nambari imetumwa kwa';

  @override
  String get otpIsInValid => 'OTP ni Batili';

  @override
  String get deliveryProof => 'Ushahidi wa Uwasilishaji';

  @override
  String get resendCode => 'Tuma Tena';

  @override
  String get resendCodeIn => 'Tuma nambari tena ndani ya';

  @override
  String get minute => 'dakika';

  @override
  String get verify => 'Thibitisha';

  @override
  String get verifyNow => 'Thibitisha Sasa';

  @override
  String get verifyVendor => 'Thibitisha Muuzaji';

  @override
  String get logIntoYourAccount => 'Ingia kwenye Akaunti yako';

  @override
  String get forgotThePassword => 'Umesahau Neno la Siri?';

  @override
  String get signIn => 'Ingia';

  @override
  String get doNotHaveAccount => 'Huna akaunti?';

  @override
  String get signUp => 'Jisajili';

  @override
  String get alreadyHaveAccount => 'Tayari una akaunti';

  @override
  String get fullName => 'Jina Kamili';

  @override
  String get createYourAccount => 'Tengeneza Akaunti yako';

  @override
  String get otpVerify => 'Thibitisha OTP';

  @override
  String get inbox => 'Inbox';

  @override
  String get searchProduct => 'Tafuta bidhaa';

  @override
  String get activeNow => 'Hai kwa Sasa';

  @override
  String get message => 'Ujumbe';

  @override
  String get notifications => 'Arifa';

  @override
  String get contact => 'Wasiliana';

  @override
  String get dateOfBirth => 'Tarehe ya Kuzaliwa';

  @override
  String get age => 'Umri';

  @override
  String get aboutMe => 'Kuhusu Mimi';

  @override
  String get gender => 'Jinsia';

  @override
  String get profile => 'Profaili';

  @override
  String get profilePhoto => 'Picha ya Profaili';

  @override
  String get saveAndChanges => 'Hifadhi na Mabadiliko';

  @override
  String get editProfile => 'Hariri Profaili';

  @override
  String get settings => 'Mipangilio';

  @override
  String get logOut => 'Toka';

  @override
  String get privacyPolicy => 'Sera ya Faragha';

  @override
  String get termsOfServices => 'Masharti ya Huduma';

  @override
  String get noInternetConnection => 'Hakuna Muunganisho wa Mtandao';

  @override
  String get badResponseRequest => 'Ombi Lenye Jibu Mbaya';

  @override
  String get requestTimeOut => 'Ombi Limeshindwa kwa Muda';

  @override
  String get thisFieldIsRequired => 'Sehemu hii ni ya lazima';

  @override
  String get enterValidEmail => 'Ingiza barua pepe halali';

  @override
  String get enterValidPhone => 'Ingiza namba ya simu halali';

  @override
  String get passwordMustBeeEightCharacters =>
      'Neno la siri lazima liwe na herufi 8 na liwe na herufi na namba';

  @override
  String get thePasswordDoesNotMatch => 'Neno la siri halilingani';

  @override
  String get startServer => 'Tafadhali anzisha Server';

  @override
  String get unknownError => 'Hitilafu Isiyojulikana';

  @override
  String get selectYourLanguage => 'Chagua Lugha Yako';

  @override
  String get zoneCollector => 'Mkusanyaji wa Eneo';

  @override
  String get hubTransfer => 'Uhamisho wa Kituo';

  @override
  String get lastMileDelivery => 'Uwasilishaji wa Mwisho wa Maili';

  @override
  String get loginWithContactNumber => 'Ingia kwa Namba ya Simu';

  @override
  String get loginWithGoogle => 'Ingia kwa Google';

  @override
  String get loginWithFacebook => 'Ingia kwa Facebook';

  @override
  String get otpTitleSignup => 'Nambari yako ya Simu ni Nini?';

  @override
  String get otpSubtitleSignup =>
      'Nambari imetumwa kwa simu yako. Tafadhali ingiza hapa chini.';

  @override
  String get otpTitleForgetPass => 'Nambari yako ya Simu ni Nini?';

  @override
  String get otpSubTitleForgetPass =>
      'Nambari imetumwa kwa simu yako. Tafadhali ingiza hapa chini.';

  @override
  String get otpSendButton => 'Tuma Nambari kwa SMS';

  @override
  String get enterVerifyCode => 'Ingiza nambari ili kuthibitisha akaunti yako.';

  @override
  String get didntReciveCode => 'Ikiwa haukupokea nambari.';

  @override
  String get save => 'Hifadhi';

  @override
  String get decline => 'Kataa';

  @override
  String get accept => 'Kubali';

  @override
  String get viewProfile => 'Tazama Profaili';

  @override
  String get drawerReturnsProduct => 'Rudisha Bidhaa';

  @override
  String get drawerLoyaltyPoints => 'Pointi za Uaminifu';

  @override
  String get drawerMessage => 'Ujumbe';

  @override
  String get drawerMyPayment => 'Malipo Yangu';

  @override
  String get drawerSupport => 'Msaada';

  @override
  String get drawerLanguage => 'Lugha';

  @override
  String get drawerDeleteAccount => 'Futa Akaunti';

  @override
  String get navHome => 'Nyumbani';

  @override
  String get navMyOrder => 'Agizo Langu';

  @override
  String get navTrackingOrder => 'Ufuatiliaji wa Agizo';

  @override
  String get navAccount => 'Akaunti';

  @override
  String get trackingID => 'Nambari ya Ufuatiliaji';

  @override
  String get homePlaceOrder => 'P Place Agizo';

  @override
  String get homeVendorSourcing => 'Chanzo cha Muuzaji';

  @override
  String get homePurchaseDelivery => 'Ununuzi & Uwasilishaji';

  @override
  String get homeBulkOrderAgents => 'Wakilishi wa Agizo Kubwa';

  @override
  String get homeVerifyVendor => 'Thibitisha Muuzaji';

  @override
  String get homeDoorToDoorPickup => 'Mkusanyiko kutoka Mlango kwa Mlango';

  @override
  String get myOrder => 'Agizo Langu';

  @override
  String get seeAll => 'Tazama Yote';

  @override
  String get placeOrder => 'P Place Agizo';

  @override
  String get setPickupDeliveryLocation =>
      'Wezesha Mahali pa Uwasilishaji na Mkusanyiko';

  @override
  String get deliveryLocation => 'Mahali pa Uwasilishaji';

  @override
  String get pickupAddress => 'Anwani ya Mkusanyiko';

  @override
  String get recentSearch => 'Utafutaji wa Karibuni';

  @override
  String get pickupInformation => 'Taarifa za Mkusanyiko';

  @override
  String get district => 'Wilaya';

  @override
  String get city => 'Jiji';

  @override
  String get outsideCity => 'Nje ya Jiji';

  @override
  String get ward => 'Kata';

  @override
  String get subWard => 'Sub-Kata';

  @override
  String get plotApartment => 'Plot/Apartment/Njia';

  @override
  String get itemDetails => 'Maelezo ya Bidhaa';

  @override
  String get pickupTime => 'Wakati wa Mkusanyiko';

  @override
  String get serviceType => 'Aina ya Huduma';

  @override
  String get addImage => 'Ongeza Picha';

  @override
  String get productWieght => 'Uzito wa Bidhaa';

  @override
  String get quantity => 'Kiasi';

  @override
  String get deliveryAddress => 'Anwani ya Uwasilishaji';

  @override
  String get couponCode => 'Nambari ya Coupon';

  @override
  String get noCouponCode => 'Hakuna Nambari ya Coupon';

  @override
  String get regularCustomersLoyaltyPoints =>
      'Pointi za Uaminifu kwa Wateja wa Kawaida';

  @override
  String get regularCustomersLoyaltyPointsMessage =>
      'Kadri unavyotumia programu, ndivyo unavyopata zawadi! Pointi za uaminifu, nambari za promo, na punguzo maalum vinakusubiri watumiaji wetu hai.';

  @override
  String get points => 'Pointi';

  @override
  String get points10000 => '10,000 Pointi';

  @override
  String get points1000 => '1,000 Pointi';

  @override
  String get off_10 => 'Punguzo la 10%';

  @override
  String get freeDelivery => 'Uwasilishaji Bila Malipo';

  @override
  String get viewRewards => 'Tazama Zawadi';

  @override
  String get myRewards => 'Zawadi Zangu';

  @override
  String get discount => 'Punguzo';

  @override
  String get claim => 'Dai';

  @override
  String get receivedCode => 'Nambari Iliyopokelewa';

  @override
  String get receiveOrder => 'Pokea Agizo';

  @override
  String get orderRiecevedSuccess => 'Agizo Limesha Pokelewa Kwa Mafanikio';

  @override
  String get orderNow => 'Agiza Sasa';

  @override
  String get backToHome => 'Rudi Nyumbani';

  @override
  String get submitCodeBy => 'Wasilisha Nambari: (Mteja wa Kawaida)';

  @override
  String get totalPrice => 'Bei Jumla';

  @override
  String get orderDetails => 'Maelezo ya Agizo';

  @override
  String get orderCode => 'Nambari ya Agizo';

  @override
  String get orderDelivered => 'Agizo Limeshachukuliwa';

  @override
  String get customer => 'Mteja';

  @override
  String get shippingAddress => 'Anwani ya Uwasilishaji';

  @override
  String get productDetails => 'Maelezo ya Bidhaa';

  @override
  String get deliverySuccessMessage => 'Agizo limetolewa kwa mafanikio';

  @override
  String get weight => 'Uzito';

  @override
  String get orderDateTime => 'Tarehe ya Agizo';

  @override
  String get orderStatus => 'Hali ya Agizo';

  @override
  String get deliveryCharge => 'Ada ya Uwasilishaji';

  @override
  String get charge => 'Ada';

  @override
  String get discountPercentage => 'Punguzo';

  @override
  String get distance => 'Umbali';

  @override
  String get totalAmount => 'Jumla ya Kiasi';

  @override
  String get bankPayment => 'Malipo ya Benki';

  @override
  String get payment => 'Malipo';

  @override
  String get paymentHistory => 'Historia ya Malipo';

  @override
  String get checkout => 'Maliza';

  @override
  String get mobileBanking => 'Benki ya Simu';

  @override
  String get totalPay => 'Jumla ya Kulipa';

  @override
  String get pickupFromMe => 'Chukua Kwangu';

  @override
  String get pickupFromVendor => 'Chukua Kwa Muuzaji';

  @override
  String get urgentDelivery => 'Uwasilishaji wa Dharura';

  @override
  String get regularDelivery => 'Uwasilishaji wa Kawaida';

  @override
  String get listOfSupplier => 'Orodha ya Wauzaji';

  @override
  String get addProduct => '+ Ongeza Bidhaa';

  @override
  String get negotiationAssistance => 'Msaada wa Mazungumzo';

  @override
  String get messageRequest => 'Omba Ujumbe';

  @override
  String get negotiationAssistanceSubTitle =>
      'Omba msaada wa mazungumzo kutoka kwa msimamizi kwa bei bora.';

  @override
  String get sentOrder => 'Agizo Limesha Tumwa';

  @override
  String get orderSummery => 'Muhtasari wa Agizo';

  @override
  String get submitPromoCode => 'Wasilisha Nambari ya Promo';

  @override
  String get vendorName => 'Jina la Muuzaji';

  @override
  String get vendorId => 'Nambari ya Muuzaji';

  @override
  String get vendorLocation => 'Mahali pa Muuzaji';

  @override
  String get uplaodScreenshot => 'Pakia Picha ya Skrini';

  @override
  String get vendorContactNumber => 'Namba ya Mawasiliano ya Muuzaji';

  @override
  String get productAmount => 'Kiasi cha Bidhaa';

  @override
  String get deliveryType => 'Aina ya Uwasilishaji';

  @override
  String get deliveryAdress => 'Anwani ya Uwasilishaji';

  @override
  String get productDescription => 'Maelezo ya Bidhaa';

  @override
  String get serviceFee => 'Ada ya Huduma';

  @override
  String get monySign => 'TSH';

  @override
  String get availableEarning => 'Mapato Yanayopatikana';

  @override
  String get percelTracking => 'Ufuatiliaji wa Kipande';

  @override
  String get account => 'Akaunti';

  @override
  String get searchForOrder => 'Tafuta Agizo';

  @override
  String get logoutMessage => 'Je, unahakikisha kutoka?';

  @override
  String get productReturnSuccessMessage => 'Ombi la Kurudisha Limetimia.';

  @override
  String get accountDeleteMessage => 'Je, unahakikisha kufuta akaunti yako?';

  @override
  String get termsCondition => 'Masharti ya Huduma';

  @override
  String get changePersonalInfo => 'Badilisha Habari za Kibinafsi';

  @override
  String get profileInfo => 'Habari za Profaili';

  @override
  String get submittedProofs => 'Ushahidi Uliowasilishwa';

  @override
  String get myPayment => 'Malipo Yangu';

  @override
  String get withdraw => 'Ondoa';

  @override
  String get deleteUser => 'Futa Mtumiaji';

  @override
  String get blockUser => 'zuia Mtumiaji';

  @override
  String get estimatedDeliveryTime => 'Muda wa Uwasilishaji ulio Estimishwa';

  @override
  String get senderName => 'Jina la Mjumbe';

  @override
  String get deliveryHistory => 'Historia ya Uwasilishaji';

  @override
  String get reciverName => 'Jina la Mpokeaji';

  @override
  String get riderName => 'Jina la Mpanda Pikipiki';

  @override
  String get hubCode => 'Nambari ya Kituo';

  @override
  String get totalParcel => 'Jumla ya Kipande';

  @override
  String get address => 'Anwani';

  @override
  String get productCategory => 'Aina ya Bidhaa';

  @override
  String get numberOfVendor => 'Idadi ya Wauzaji';

  @override
  String get budget => 'Bajeti';

  @override
  String get specialInstruction => 'Maelekezo Maalum';

  @override
  String get submitRequest => 'Wasilisha Ombi';

  @override
  String get allProducts => 'Bidhaa Zote';

  @override
  String get allVendors => 'Wauzaji Wote';

  @override
  String get vendorSourcingCategory => 'Chanzo cha Muuzaji';

  @override
  String get viewProduct => 'Tazama Bidhaa';

  @override
  String get screenshot => 'Picha ya Skrini';

  @override
  String get availableColor => 'Rangi Zinazopatikana';

  @override
  String get availableSize => 'Ukubwa Zinazopatikana';

  @override
  String get riderDetails => 'Maelezo ya Mpanda Pikipiki';

  @override
  String get callNow => 'Piga Sasa';

  @override
  String get myVendors => 'Wauzaji Wangu';

  @override
  String get verifyApplyDate => 'Tarehe ya Maombi';

  @override
  String get shareThroughWhatsUp => 'Shiriki kupitia WhatsApp';

  @override
  String get verificationStatus => 'Hali ya Uthibitishaji';

  @override
  String get verificationFee => 'Ada ya Uthibitishaji';

  @override
  String get inTransit => 'Katika Usafiri';

  @override
  String get vendorProof => 'Ushahidi wa Muuzaji';

  @override
  String get profileLink => 'Kiungo cha Profaili';

  @override
  String get adminProof => 'Ushahidi wa Admin';

  @override
  String get vendor => 'Muuzaji';

  @override
  String get status => 'Hali';

  @override
  String get addMoreDetails => 'Ongeza maelezo zaidi';

  @override
  String get orderHistory => 'Historia ya Agizo';

  @override
  String get orderNo => 'Nambari ya Agizo';

  @override
  String get checkIn => 'Ingia';

  @override
  String get lateDuty => 'Kazi ya Kuchelewa';

  @override
  String get totalAttendance => 'Idadi ya Hudhuriaji';

  @override
  String get checkOut => 'Ondoka';

  @override
  String get review => 'Review';

  @override
  String get attendance => 'Attendance';

  @override
  String get parcelReceived => 'Kipande Kilichopokelewa';

  @override
  String get days => 'Siku';

  @override
  String get addDocuments => 'Add Documents';

  @override
  String get myDocuments => 'My Documents';

  @override
  String get searchOrderNumber => 'Tafuta Nambari ya Agizo';

  @override
  String get receivedHistory => 'Historia ya Kupokelewa';

  @override
  String get receivedOrder => 'Agizo Liliopokelewa';

  @override
  String get pendingDelivery => 'Uwasilishaji unaosubiri';

  @override
  String get successDelivery => 'Uwasilishaji wa Mafanikio';

  @override
  String get tracking => 'Ufuatiliaji';

  @override
  String get myTask => 'Kazi Zangu';

  @override
  String get dailyTask => 'Kazi za Kila Siku';

  @override
  String get weeklyTask => 'Kazi za Kila Wiki';

  @override
  String get monthlyTask => 'Kazi za Kila Mwezi';

  @override
  String get noDetailsAvailableForThisNotification =>
      'Arifa hii haina maelezo zaidi.';

  @override
  String get vendorVerificationRequestMessage =>
      'Ombi lako la Uthibitishaji wa Muuzaji limetumwa. Timu yetu itakujulisha hivi karibuni.';

  @override
  String get loyaltyClaimingMessage =>
      'You’ve received a \$value on your next order! Don’t miss out';

  @override
  String get selectZone => 'Chagua Eneo';

  @override
  String get driverLicenseNumber => 'Nambari ya Leseni ya Dereva';

  @override
  String get licenseExpireDate => 'Tarehe ya Kumalizika kwa Leseni';

  @override
  String get uploadLicensePhoto => 'Pakia Picha ya Leseni';

  @override
  String get enterVehiclesRegistrationNumber => 'Nambari ya Usajili wa Gari';

  @override
  String get enterVehiclesInsuranceNumber => 'Nambari ya Bima ya Gari';

  @override
  String get uploadVehiclesPhoto => 'Pakia Picha ya Gari';

  @override
  String get selectCategory => 'Chagua Aina';

  @override
  String get personal => 'Binafsi';

  @override
  String get licenses => 'License';

  @override
  String get vehicles => 'Magari';

  @override
  String get vehiclesManufacturer => 'Mtengenezaji wa Magari';

  @override
  String get vehiclesModel => 'Mfano wa Gari';

  @override
  String get manufacturedYear => 'Mwaka wa Utengenezaji';

  @override
  String get personalInformation => 'Habari Binafsi';

  @override
  String get driverLicenseInformation => 'Habari za Leseni ya Dereva';

  @override
  String get vehiclesInformation => 'Habari za Magari';

  @override
  String get vendorFilters_allVendor => 'Muuzaji Wote';

  @override
  String get vendorFilters_verified => 'Iliyothibitishwa';

  @override
  String get vendorFilters_newVendor => 'Muuzaji Mpya';

  @override
  String get orderHistoryFilters_receivedDelivery =>
      'Uwasilishaji Uliopokelewa';

  @override
  String get orderHistoryFilters_completeDelivery => 'Uwasilishaji Kamili';

  @override
  String get returnTypes_replacement => 'Replacement';

  @override
  String get returnTypes_returnProduct => 'Rudisha Bidhaa';

  @override
  String get returnReason_vendorSentWrong => 'Muuzaji alituma kibaya';

  @override
  String get returnReason_damagedItem => 'Bidhaa Imepata Uharibifu';

  @override
  String get returnReason_deliveryRiderMistake =>
      'Mpanda Pikipiki alifanya makosa';

  @override
  String get returnReason_other => 'Nyingine';

  @override
  String get genderList_male => 'Mwanaume';

  @override
  String get genderList_female => 'Mwanamke';

  @override
  String get activePayment => 'Malipo';

  @override
  String get totalEarning => 'Mapato';

  @override
  String get completeOrder => 'Agizo Kamili';

  @override
  String get pendingOrder => 'Agizo Lilioingizwa';

  @override
  String get successOrder => 'Agizo Lililofanikiwa';

  @override
  String get addtoStore => 'Ongeza Duka';

  @override
  String get myProduct => 'Bidhaa Yangu';

  @override
  String get newOrder => 'Agizo Jipya';

  @override
  String get archive => 'Hifadhi';

  @override
  String get favorite => 'Pendwa';

  @override
  String get price => 'Bei';

  @override
  String get agentInformation => 'Habari za Wakala';

  @override
  String get nationalIDcard => 'Kadi ya ID';

  @override
  String get bankName => 'Jina la Benki';

  @override
  String get bankAccount => 'Akaunti ya Benki';

  @override
  String get myStore => 'Duka Langu';

  @override
  String get deliveryTime => 'Muda wa Uwasilishaji';

  @override
  String get availableProducts => 'Bidhaa Zinazopatikana';

  @override
  String get stock => 'Hisa';

  @override
  String get vendorDetails => 'Maelezo ya Muuzaji';

  @override
  String get submitToVendor => 'Wasilisha kwa Muuzaji';

  @override
  String get chatWithVendor => 'Chat na Muuzaji';

  @override
  String get productSize => 'Ukubwa wa Bidhaa';

  @override
  String get transactionId => 'Nambari ya Muamala';

  @override
  String get paymentStatus => 'Hali ya Malipo';

  @override
  String get customerName => 'Jina la Mteja';

  @override
  String get orderId => 'Nambari ya Agizo';

  @override
  String get submitOrder => 'Wasilisha Agizo';

  @override
  String get requestedOrderDetails => 'Maelezo ya Agizo Lililohitajika';

  @override
  String get viewDetails => 'Tazama Maelezo';

  @override
  String get submit => 'Wasilisha';

  @override
  String get editProduct => 'Hariri Bidhaa';

  @override
  String get deleteProduct => 'Futa Bidhaa';

  @override
  String get updateProduct => 'Sasisha Bidhaa';

  @override
  String get loaltyClaimingMessage =>
      'Umepokea # kwa agizo lako linalofuata! Usikose';
}
