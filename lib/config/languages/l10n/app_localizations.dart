import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_sw.dart';

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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('sw'),
  ];

  /// No description provided for @dataEmpty.
  ///
  /// In en, this message translates to:
  /// **'Data Empty'**
  String get dataEmpty;

  /// No description provided for @delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery;

  /// No description provided for @noInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet'**
  String get noInternet;

  /// No description provided for @checkInternet.
  ///
  /// In en, this message translates to:
  /// **'Check Internet'**
  String get checkInternet;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @youSureWantToLogout.
  ///
  /// In en, this message translates to:
  /// **'You sure want to logout'**
  String get youSureWantToLogout;

  /// No description provided for @uploadProofs.
  ///
  /// In en, this message translates to:
  /// **'Upload Proofs'**
  String get uploadProofs;

  /// No description provided for @no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @areYouSure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure'**
  String get areYouSure;

  /// No description provided for @enterYouPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get enterYouPassword;

  /// No description provided for @deliveryProofMandatory.
  ///
  /// In en, this message translates to:
  /// **'Delivered item photo and signed delivery note are required.'**
  String get deliveryProofMandatory;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @deleteDetails.
  ///
  /// In en, this message translates to:
  /// **'All your changes will be deleted and you will no longer be able to access them.'**
  String get deleteDetails;

  /// No description provided for @someThingWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get someThingWrong;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try Again'**
  String get tryAgain;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @phoneNo.
  ///
  /// In en, this message translates to:
  /// **'Phone No.'**
  String get phoneNo;

  /// No description provided for @riderId.
  ///
  /// In en, this message translates to:
  /// **'Rider Id'**
  String get riderId;

  /// No description provided for @hubName.
  ///
  /// In en, this message translates to:
  /// **'Hub Name'**
  String get hubName;

  /// No description provided for @test.
  ///
  /// In en, this message translates to:
  /// **'Test'**
  String get test;

  /// No description provided for @changePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get changePassword;

  /// No description provided for @currentPassword.
  ///
  /// In en, this message translates to:
  /// **'Current Password'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get newPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @allOrders.
  ///
  /// In en, this message translates to:
  /// **'All Orders'**
  String get allOrders;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotPassword;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @createNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create New Password'**
  String get createNewPassword;

  /// No description provided for @createYourNewPassword.
  ///
  /// In en, this message translates to:
  /// **'Create Your New Password'**
  String get createYourNewPassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @continues.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continues;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @codeHasBeenSendTo.
  ///
  /// In en, this message translates to:
  /// **'Code has been sent to'**
  String get codeHasBeenSendTo;

  /// No description provided for @otpIsInValid.
  ///
  /// In en, this message translates to:
  /// **'Otp is invalid'**
  String get otpIsInValid;

  /// No description provided for @deliveryProof.
  ///
  /// In en, this message translates to:
  /// **'Delivery Proof'**
  String get deliveryProof;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend'**
  String get resendCode;

  /// No description provided for @resendCodeIn.
  ///
  /// In en, this message translates to:
  /// **'Resend code in'**
  String get resendCodeIn;

  /// No description provided for @minute.
  ///
  /// In en, this message translates to:
  /// **'minute'**
  String get minute;

  /// No description provided for @verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify;

  /// No description provided for @verifyNow.
  ///
  /// In en, this message translates to:
  /// **'Verify Now'**
  String get verifyNow;

  /// No description provided for @verifyVendor.
  ///
  /// In en, this message translates to:
  /// **'Verify Vendor'**
  String get verifyVendor;

  /// No description provided for @logIntoYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Login to Your Account'**
  String get logIntoYourAccount;

  /// No description provided for @forgotThePassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password'**
  String get forgotThePassword;

  /// No description provided for @signIn.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// No description provided for @doNotHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get doNotHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signUp;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account'**
  String get alreadyHaveAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get createYourAccount;

  /// No description provided for @otpVerify.
  ///
  /// In en, this message translates to:
  /// **'OTP Verify'**
  String get otpVerify;

  /// No description provided for @inbox.
  ///
  /// In en, this message translates to:
  /// **'Inbox'**
  String get inbox;

  /// No description provided for @searchProduct.
  ///
  /// In en, this message translates to:
  /// **'Search product'**
  String get searchProduct;

  /// No description provided for @activeNow.
  ///
  /// In en, this message translates to:
  /// **'Active Now'**
  String get activeNow;

  /// No description provided for @message.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get contact;

  /// No description provided for @dateOfBirth.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get dateOfBirth;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @aboutMe.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMe;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @profilePhoto.
  ///
  /// In en, this message translates to:
  /// **'Profile Photo'**
  String get profilePhoto;

  /// No description provided for @saveAndChanges.
  ///
  /// In en, this message translates to:
  /// **'Save and Changes'**
  String get saveAndChanges;

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @logOut.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get logOut;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfServices.
  ///
  /// In en, this message translates to:
  /// **'Terms of Services'**
  String get termsOfServices;

  /// No description provided for @noInternetConnection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get noInternetConnection;

  /// No description provided for @badResponseRequest.
  ///
  /// In en, this message translates to:
  /// **'Bad Response Request'**
  String get badResponseRequest;

  /// No description provided for @requestTimeOut.
  ///
  /// In en, this message translates to:
  /// **'Request Time Out'**
  String get requestTimeOut;

  /// No description provided for @thisFieldIsRequired.
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get thisFieldIsRequired;

  /// No description provided for @enterValidEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter valid email'**
  String get enterValidEmail;

  /// No description provided for @enterValidPhone.
  ///
  /// In en, this message translates to:
  /// **'Enter valid phone'**
  String get enterValidPhone;

  /// No description provided for @passwordMustBeeEightCharacters.
  ///
  /// In en, this message translates to:
  /// **'Password must be 8 characters & contain both alphabets and numerics'**
  String get passwordMustBeeEightCharacters;

  /// No description provided for @thePasswordDoesNotMatch.
  ///
  /// In en, this message translates to:
  /// **'The password does not match'**
  String get thePasswordDoesNotMatch;

  /// No description provided for @startServer.
  ///
  /// In en, this message translates to:
  /// **'Please, start the Server'**
  String get startServer;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Unknown Error'**
  String get unknownError;

  /// No description provided for @selectYourLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Your Language'**
  String get selectYourLanguage;

  /// No description provided for @zoneCollector.
  ///
  /// In en, this message translates to:
  /// **'Zone Collector'**
  String get zoneCollector;

  /// No description provided for @hubTransfer.
  ///
  /// In en, this message translates to:
  /// **'Hub Transfer'**
  String get hubTransfer;

  /// No description provided for @lastMileDelivery.
  ///
  /// In en, this message translates to:
  /// **'Last-Mile Delivery'**
  String get lastMileDelivery;

  /// No description provided for @loginWithContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Log in With Contact Number'**
  String get loginWithContactNumber;

  /// No description provided for @loginWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Log in With Google'**
  String get loginWithGoogle;

  /// No description provided for @loginWithFacebook.
  ///
  /// In en, this message translates to:
  /// **'Log in With Facebook'**
  String get loginWithFacebook;

  /// No description provided for @otpTitleSignup.
  ///
  /// In en, this message translates to:
  /// **'What\'s Your Mobile Number?'**
  String get otpTitleSignup;

  /// No description provided for @otpSubtitleSignup.
  ///
  /// In en, this message translates to:
  /// **'Code sent to your mobile. Please enter it below.'**
  String get otpSubtitleSignup;

  /// No description provided for @otpTitleForgetPass.
  ///
  /// In en, this message translates to:
  /// **'What\'s Your Mobile Number?'**
  String get otpTitleForgetPass;

  /// No description provided for @otpSubTitleForgetPass.
  ///
  /// In en, this message translates to:
  /// **'Code sent to your mobile. Please enter it below.'**
  String get otpSubTitleForgetPass;

  /// No description provided for @otpSendButton.
  ///
  /// In en, this message translates to:
  /// **'Send Code Via SMS'**
  String get otpSendButton;

  /// No description provided for @enterVerifyCode.
  ///
  /// In en, this message translates to:
  /// **'Enter the code to verify your account.'**
  String get enterVerifyCode;

  /// No description provided for @didntReciveCode.
  ///
  /// In en, this message translates to:
  /// **'If you didn’t receive a code.'**
  String get didntReciveCode;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @decline.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get decline;

  /// No description provided for @accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get accept;

  /// No description provided for @viewProfile.
  ///
  /// In en, this message translates to:
  /// **'View Profile'**
  String get viewProfile;

  /// No description provided for @drawerReturnsProduct.
  ///
  /// In en, this message translates to:
  /// **'Returns Product'**
  String get drawerReturnsProduct;

  /// No description provided for @drawerLoyaltyPoints.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Points'**
  String get drawerLoyaltyPoints;

  /// No description provided for @drawerMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get drawerMessage;

  /// No description provided for @drawerMyPayment.
  ///
  /// In en, this message translates to:
  /// **'My Payment'**
  String get drawerMyPayment;

  /// No description provided for @drawerSupport.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get drawerSupport;

  /// No description provided for @drawerLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get drawerLanguage;

  /// No description provided for @drawerDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get drawerDeleteAccount;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navMyOrder.
  ///
  /// In en, this message translates to:
  /// **'My Order'**
  String get navMyOrder;

  /// No description provided for @navTrackingOrder.
  ///
  /// In en, this message translates to:
  /// **'Tracking Order'**
  String get navTrackingOrder;

  /// No description provided for @navAccount.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get navAccount;

  /// No description provided for @trackingID.
  ///
  /// In en, this message translates to:
  /// **'Tracking ID'**
  String get trackingID;

  /// No description provided for @homePlaceOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get homePlaceOrder;

  /// No description provided for @homeVendorSourcing.
  ///
  /// In en, this message translates to:
  /// **'Vendor Sourcing'**
  String get homeVendorSourcing;

  /// No description provided for @homePurchaseDelivery.
  ///
  /// In en, this message translates to:
  /// **'Purchase & Delivery'**
  String get homePurchaseDelivery;

  /// No description provided for @homeBulkOrderAgents.
  ///
  /// In en, this message translates to:
  /// **'Bulk Order Agents'**
  String get homeBulkOrderAgents;

  /// No description provided for @homeVerifyVendor.
  ///
  /// In en, this message translates to:
  /// **'Verify Vendor'**
  String get homeVerifyVendor;

  /// No description provided for @homeDoorToDoorPickup.
  ///
  /// In en, this message translates to:
  /// **'Door-to-Door Pickup'**
  String get homeDoorToDoorPickup;

  /// No description provided for @myOrder.
  ///
  /// In en, this message translates to:
  /// **'My Order'**
  String get myOrder;

  /// No description provided for @seeAll.
  ///
  /// In en, this message translates to:
  /// **'See All'**
  String get seeAll;

  /// No description provided for @placeOrder.
  ///
  /// In en, this message translates to:
  /// **'Place Order'**
  String get placeOrder;

  /// No description provided for @setPickupDeliveryLocation.
  ///
  /// In en, this message translates to:
  /// **'Set Pickup & Delivery Location'**
  String get setPickupDeliveryLocation;

  /// No description provided for @deliveryLocation.
  ///
  /// In en, this message translates to:
  /// **'Delivery Location'**
  String get deliveryLocation;

  /// No description provided for @pickupAddress.
  ///
  /// In en, this message translates to:
  /// **'Pickup Address'**
  String get pickupAddress;

  /// No description provided for @recentSearch.
  ///
  /// In en, this message translates to:
  /// **'Recent Search'**
  String get recentSearch;

  /// No description provided for @pickupInformation.
  ///
  /// In en, this message translates to:
  /// **'Pickup Information'**
  String get pickupInformation;

  /// No description provided for @district.
  ///
  /// In en, this message translates to:
  /// **'District'**
  String get district;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @outsideCity.
  ///
  /// In en, this message translates to:
  /// **'Outside City'**
  String get outsideCity;

  /// No description provided for @ward.
  ///
  /// In en, this message translates to:
  /// **'Ward'**
  String get ward;

  /// No description provided for @subWard.
  ///
  /// In en, this message translates to:
  /// **'Sub-Ward'**
  String get subWard;

  /// No description provided for @plotApartment.
  ///
  /// In en, this message translates to:
  /// **'Plot/Apartment/Road'**
  String get plotApartment;

  /// No description provided for @itemDetails.
  ///
  /// In en, this message translates to:
  /// **'Item Details'**
  String get itemDetails;

  /// No description provided for @pickupTime.
  ///
  /// In en, this message translates to:
  /// **'Pickup Time'**
  String get pickupTime;

  /// No description provided for @serviceType.
  ///
  /// In en, this message translates to:
  /// **'Service Type'**
  String get serviceType;

  /// No description provided for @addImage.
  ///
  /// In en, this message translates to:
  /// **'Add Images'**
  String get addImage;

  /// No description provided for @productWieght.
  ///
  /// In en, this message translates to:
  /// **'Product Weight'**
  String get productWieght;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @deliveryAddress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAddress;

  /// No description provided for @couponCode.
  ///
  /// In en, this message translates to:
  /// **'Coupon Code'**
  String get couponCode;

  /// No description provided for @noCouponCode.
  ///
  /// In en, this message translates to:
  /// **'No Coupon Code'**
  String get noCouponCode;

  /// No description provided for @regularCustomersLoyaltyPoints.
  ///
  /// In en, this message translates to:
  /// **'Loyalty Points for Regular Customers'**
  String get regularCustomersLoyaltyPoints;

  /// No description provided for @regularCustomersLoyaltyPointsMessage.
  ///
  /// In en, this message translates to:
  /// **'The more you use the app, the more rewards you earn! Loyalty points, promo codes, and special discounts await our active users.'**
  String get regularCustomersLoyaltyPointsMessage;

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @points10000.
  ///
  /// In en, this message translates to:
  /// **'10,000 Points'**
  String get points10000;

  /// No description provided for @points1000.
  ///
  /// In en, this message translates to:
  /// **'1,000 Points'**
  String get points1000;

  /// No description provided for @off_10.
  ///
  /// In en, this message translates to:
  /// **'10% Off'**
  String get off_10;

  /// No description provided for @freeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Free Delivery'**
  String get freeDelivery;

  /// No description provided for @viewRewards.
  ///
  /// In en, this message translates to:
  /// **'View Rewards'**
  String get viewRewards;

  /// No description provided for @myRewards.
  ///
  /// In en, this message translates to:
  /// **'My Rewards'**
  String get myRewards;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @claim.
  ///
  /// In en, this message translates to:
  /// **'Claim'**
  String get claim;

  /// No description provided for @receivedCode.
  ///
  /// In en, this message translates to:
  /// **'Received Code'**
  String get receivedCode;

  /// No description provided for @receiveOrder.
  ///
  /// In en, this message translates to:
  /// **'Received Order'**
  String get receiveOrder;

  /// No description provided for @orderRiecevedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Order Has Been Received Successfully'**
  String get orderRiecevedSuccess;

  /// No description provided for @orderNow.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get orderNow;

  /// No description provided for @backToHome.
  ///
  /// In en, this message translates to:
  /// **'Back to Home'**
  String get backToHome;

  /// No description provided for @submitCodeBy.
  ///
  /// In en, this message translates to:
  /// **'Submit Code: (Regular Customer)'**
  String get submitCodeBy;

  /// No description provided for @totalPrice.
  ///
  /// In en, this message translates to:
  /// **'Total Price'**
  String get totalPrice;

  /// No description provided for @orderDetails.
  ///
  /// In en, this message translates to:
  /// **'Order Details'**
  String get orderDetails;

  /// No description provided for @orderCode.
  ///
  /// In en, this message translates to:
  /// **'Order Code'**
  String get orderCode;

  /// No description provided for @orderDelivered.
  ///
  /// In en, this message translates to:
  /// **'Order Delivered'**
  String get orderDelivered;

  /// No description provided for @customer.
  ///
  /// In en, this message translates to:
  /// **'Customer'**
  String get customer;

  /// No description provided for @shippingAddress.
  ///
  /// In en, this message translates to:
  /// **'Shipping Address'**
  String get shippingAddress;

  /// No description provided for @productDetails.
  ///
  /// In en, this message translates to:
  /// **'Product Details'**
  String get productDetails;

  /// No description provided for @deliverySuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'The order has been delivered successfully'**
  String get deliverySuccessMessage;

  /// No description provided for @weight.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weight;

  /// No description provided for @orderDateTime.
  ///
  /// In en, this message translates to:
  /// **'Order date'**
  String get orderDateTime;

  /// No description provided for @orderStatus.
  ///
  /// In en, this message translates to:
  /// **'Order status'**
  String get orderStatus;

  /// No description provided for @deliveryCharge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charge'**
  String get deliveryCharge;

  /// No description provided for @charge.
  ///
  /// In en, this message translates to:
  /// **'Charge'**
  String get charge;

  /// No description provided for @discountPercentage.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discountPercentage;

  /// No description provided for @distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get distance;

  /// No description provided for @totalAmount.
  ///
  /// In en, this message translates to:
  /// **'Total Amount'**
  String get totalAmount;

  /// No description provided for @bankPayment.
  ///
  /// In en, this message translates to:
  /// **'Bank Payment'**
  String get bankPayment;

  /// No description provided for @payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get payment;

  /// No description provided for @paymentHistory.
  ///
  /// In en, this message translates to:
  /// **'Payment History'**
  String get paymentHistory;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @mobileBanking.
  ///
  /// In en, this message translates to:
  /// **'Mobile Banking'**
  String get mobileBanking;

  /// No description provided for @totalPay.
  ///
  /// In en, this message translates to:
  /// **'Total pay'**
  String get totalPay;

  /// No description provided for @pickupFromMe.
  ///
  /// In en, this message translates to:
  /// **'Pick Up from Me'**
  String get pickupFromMe;

  /// No description provided for @pickupFromVendor.
  ///
  /// In en, this message translates to:
  /// **'Pick Up from Vendor'**
  String get pickupFromVendor;

  /// No description provided for @urgentDelivery.
  ///
  /// In en, this message translates to:
  /// **'Urgent Delivery'**
  String get urgentDelivery;

  /// No description provided for @regularDelivery.
  ///
  /// In en, this message translates to:
  /// **'Regular Delivery'**
  String get regularDelivery;

  /// No description provided for @listOfSupplier.
  ///
  /// In en, this message translates to:
  /// **'List of Supplier'**
  String get listOfSupplier;

  /// No description provided for @addProduct.
  ///
  /// In en, this message translates to:
  /// **'+ Add Product'**
  String get addProduct;

  /// No description provided for @negotiationAssistance.
  ///
  /// In en, this message translates to:
  /// **'Negotiation Assistance'**
  String get negotiationAssistance;

  /// No description provided for @messageRequest.
  ///
  /// In en, this message translates to:
  /// **'Message Request'**
  String get messageRequest;

  /// No description provided for @negotiationAssistanceSubTitle.
  ///
  /// In en, this message translates to:
  /// **'Request negotiation help from admin for better pricing.'**
  String get negotiationAssistanceSubTitle;

  /// No description provided for @sentOrder.
  ///
  /// In en, this message translates to:
  /// **'Sent Order'**
  String get sentOrder;

  /// No description provided for @orderSummery.
  ///
  /// In en, this message translates to:
  /// **'Order Summary'**
  String get orderSummery;

  /// No description provided for @submitPromoCode.
  ///
  /// In en, this message translates to:
  /// **'Submit Promo Code'**
  String get submitPromoCode;

  /// No description provided for @vendorName.
  ///
  /// In en, this message translates to:
  /// **'Vendors Name'**
  String get vendorName;

  /// No description provided for @vendorId.
  ///
  /// In en, this message translates to:
  /// **'Vendor ID'**
  String get vendorId;

  /// No description provided for @vendorLocation.
  ///
  /// In en, this message translates to:
  /// **'Vendor Location'**
  String get vendorLocation;

  /// No description provided for @uplaodScreenshot.
  ///
  /// In en, this message translates to:
  /// **'Upload Screenshot'**
  String get uplaodScreenshot;

  /// No description provided for @vendorContactNumber.
  ///
  /// In en, this message translates to:
  /// **'Vendor Contact Number'**
  String get vendorContactNumber;

  /// No description provided for @productAmount.
  ///
  /// In en, this message translates to:
  /// **'Product Amount'**
  String get productAmount;

  /// No description provided for @deliveryType.
  ///
  /// In en, this message translates to:
  /// **'Delivery Type'**
  String get deliveryType;

  /// No description provided for @deliveryAdress.
  ///
  /// In en, this message translates to:
  /// **'Delivery Address'**
  String get deliveryAdress;

  /// No description provided for @productDescription.
  ///
  /// In en, this message translates to:
  /// **'Product Description'**
  String get productDescription;

  /// No description provided for @serviceFee.
  ///
  /// In en, this message translates to:
  /// **'Service Fee'**
  String get serviceFee;

  /// No description provided for @monySign.
  ///
  /// In en, this message translates to:
  /// **'TSH'**
  String get monySign;

  /// No description provided for @availableEarning.
  ///
  /// In en, this message translates to:
  /// **'Available Earning'**
  String get availableEarning;

  /// No description provided for @percelTracking.
  ///
  /// In en, this message translates to:
  /// **'Parcel Tracking'**
  String get percelTracking;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @searchForOrder.
  ///
  /// In en, this message translates to:
  /// **'Search For Order'**
  String get searchForOrder;

  /// No description provided for @logoutMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to log out?'**
  String get logoutMessage;

  /// No description provided for @productReturnSuccessMessage.
  ///
  /// In en, this message translates to:
  /// **'Return Request Successful.'**
  String get productReturnSuccessMessage;

  /// No description provided for @accountDeleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete your account?'**
  String get accountDeleteMessage;

  /// No description provided for @termsCondition.
  ///
  /// In en, this message translates to:
  /// **'Terms & Condition'**
  String get termsCondition;

  /// No description provided for @changePersonalInfo.
  ///
  /// In en, this message translates to:
  /// **'Change Personal Info'**
  String get changePersonalInfo;

  /// No description provided for @profileInfo.
  ///
  /// In en, this message translates to:
  /// **'Profile Info'**
  String get profileInfo;

  /// No description provided for @submittedProofs.
  ///
  /// In en, this message translates to:
  /// **'Submitted Proofs'**
  String get submittedProofs;

  /// No description provided for @myPayment.
  ///
  /// In en, this message translates to:
  /// **'My Payment'**
  String get myPayment;

  /// No description provided for @withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get withdraw;

  /// No description provided for @deleteUser.
  ///
  /// In en, this message translates to:
  /// **'Delete User'**
  String get deleteUser;

  /// No description provided for @blockUser.
  ///
  /// In en, this message translates to:
  /// **'Block User'**
  String get blockUser;

  /// No description provided for @estimatedDeliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Estimated Delivery Time'**
  String get estimatedDeliveryTime;

  /// No description provided for @senderName.
  ///
  /// In en, this message translates to:
  /// **'Sender Name'**
  String get senderName;

  /// No description provided for @deliveryHistory.
  ///
  /// In en, this message translates to:
  /// **'Delivery History'**
  String get deliveryHistory;

  /// No description provided for @reciverName.
  ///
  /// In en, this message translates to:
  /// **'Receiver Name'**
  String get reciverName;

  /// No description provided for @riderName.
  ///
  /// In en, this message translates to:
  /// **'Rider Name'**
  String get riderName;

  /// No description provided for @hubCode.
  ///
  /// In en, this message translates to:
  /// **'Hub code'**
  String get hubCode;

  /// No description provided for @totalParcel.
  ///
  /// In en, this message translates to:
  /// **'Total Parcel'**
  String get totalParcel;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @productCategory.
  ///
  /// In en, this message translates to:
  /// **'Product Category'**
  String get productCategory;

  /// No description provided for @numberOfVendor.
  ///
  /// In en, this message translates to:
  /// **'Number of Vendor'**
  String get numberOfVendor;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget'**
  String get budget;

  /// No description provided for @specialInstruction.
  ///
  /// In en, this message translates to:
  /// **'Special Instruction'**
  String get specialInstruction;

  /// No description provided for @submitRequest.
  ///
  /// In en, this message translates to:
  /// **'Submit Request'**
  String get submitRequest;

  /// No description provided for @allProducts.
  ///
  /// In en, this message translates to:
  /// **'All Products'**
  String get allProducts;

  /// No description provided for @allVendors.
  ///
  /// In en, this message translates to:
  /// **'All Vendors'**
  String get allVendors;

  /// No description provided for @vendorSourcingCategory.
  ///
  /// In en, this message translates to:
  /// **'Vendor Sourcing'**
  String get vendorSourcingCategory;

  /// No description provided for @viewProduct.
  ///
  /// In en, this message translates to:
  /// **'View Product'**
  String get viewProduct;

  /// No description provided for @screenshot.
  ///
  /// In en, this message translates to:
  /// **'Screenshot'**
  String get screenshot;

  /// No description provided for @availableColor.
  ///
  /// In en, this message translates to:
  /// **'Available Color'**
  String get availableColor;

  /// No description provided for @availableSize.
  ///
  /// In en, this message translates to:
  /// **'Available Size'**
  String get availableSize;

  /// No description provided for @riderDetails.
  ///
  /// In en, this message translates to:
  /// **'Rider Details'**
  String get riderDetails;

  /// No description provided for @callNow.
  ///
  /// In en, this message translates to:
  /// **'Call Now'**
  String get callNow;

  /// No description provided for @myVendors.
  ///
  /// In en, this message translates to:
  /// **'My Vendors'**
  String get myVendors;

  /// No description provided for @verifyApplyDate.
  ///
  /// In en, this message translates to:
  /// **'Apply Date'**
  String get verifyApplyDate;

  /// No description provided for @shareThroughWhatsUp.
  ///
  /// In en, this message translates to:
  /// **'Share through WhatsApp'**
  String get shareThroughWhatsUp;

  /// No description provided for @verificationStatus.
  ///
  /// In en, this message translates to:
  /// **'Verification Status'**
  String get verificationStatus;

  /// No description provided for @verificationFee.
  ///
  /// In en, this message translates to:
  /// **'Verification Fee'**
  String get verificationFee;

  /// No description provided for @inTransit.
  ///
  /// In en, this message translates to:
  /// **'In Transit'**
  String get inTransit;

  /// No description provided for @vendorProof.
  ///
  /// In en, this message translates to:
  /// **'Vendor Proof'**
  String get vendorProof;

  /// No description provided for @profileLink.
  ///
  /// In en, this message translates to:
  /// **'Profile Link'**
  String get profileLink;

  /// No description provided for @adminProof.
  ///
  /// In en, this message translates to:
  /// **'Admin Proof'**
  String get adminProof;

  /// No description provided for @vendor.
  ///
  /// In en, this message translates to:
  /// **'Vendor'**
  String get vendor;

  /// No description provided for @status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @addMoreDetails.
  ///
  /// In en, this message translates to:
  /// **'Add more details'**
  String get addMoreDetails;

  /// No description provided for @orderHistory.
  ///
  /// In en, this message translates to:
  /// **'Order History'**
  String get orderHistory;

  /// No description provided for @orderNo.
  ///
  /// In en, this message translates to:
  /// **'Order No.'**
  String get orderNo;

  /// No description provided for @checkIn.
  ///
  /// In en, this message translates to:
  /// **'Check in'**
  String get checkIn;

  /// No description provided for @lateDuty.
  ///
  /// In en, this message translates to:
  /// **'Late Duty'**
  String get lateDuty;

  /// No description provided for @totalAttendance.
  ///
  /// In en, this message translates to:
  /// **'Total Attendance'**
  String get totalAttendance;

  /// No description provided for @checkOut.
  ///
  /// In en, this message translates to:
  /// **'Check out'**
  String get checkOut;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @attendance.
  ///
  /// In en, this message translates to:
  /// **'Attendance'**
  String get attendance;

  /// No description provided for @parcelReceived.
  ///
  /// In en, this message translates to:
  /// **'Parcel Received'**
  String get parcelReceived;

  /// No description provided for @days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get days;

  /// No description provided for @addDocuments.
  ///
  /// In en, this message translates to:
  /// **'Add Documents'**
  String get addDocuments;

  /// No description provided for @myDocuments.
  ///
  /// In en, this message translates to:
  /// **'My Documents'**
  String get myDocuments;

  /// No description provided for @searchOrderNumber.
  ///
  /// In en, this message translates to:
  /// **'Search Order Number'**
  String get searchOrderNumber;

  /// No description provided for @receivedHistory.
  ///
  /// In en, this message translates to:
  /// **'Received History'**
  String get receivedHistory;

  /// No description provided for @receivedOrder.
  ///
  /// In en, this message translates to:
  /// **'Received Order'**
  String get receivedOrder;

  /// No description provided for @pendingDelivery.
  ///
  /// In en, this message translates to:
  /// **'Pending Delivery'**
  String get pendingDelivery;

  /// No description provided for @successDelivery.
  ///
  /// In en, this message translates to:
  /// **'Successful Delivery'**
  String get successDelivery;

  /// No description provided for @tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tracking;

  /// No description provided for @myTask.
  ///
  /// In en, this message translates to:
  /// **'My Task'**
  String get myTask;

  /// No description provided for @dailyTask.
  ///
  /// In en, this message translates to:
  /// **'Daily Task'**
  String get dailyTask;

  /// No description provided for @weeklyTask.
  ///
  /// In en, this message translates to:
  /// **'Weekly Task'**
  String get weeklyTask;

  /// No description provided for @monthlyTask.
  ///
  /// In en, this message translates to:
  /// **'Monthly Task'**
  String get monthlyTask;

  /// No description provided for @noDetailsAvailableForThisNotification.
  ///
  /// In en, this message translates to:
  /// **'This notification has no further information.'**
  String get noDetailsAvailableForThisNotification;

  /// No description provided for @vendorVerificationRequestMessage.
  ///
  /// In en, this message translates to:
  /// **'Your Vendor Verify Request has been submitted. Our team will get back to you shortly.'**
  String get vendorVerificationRequestMessage;

  /// No description provided for @loyaltyClaimingMessage.
  ///
  /// In en, this message translates to:
  /// **'You’ve received a \$value on your next order! Don’t miss out'**
  String get loyaltyClaimingMessage;

  /// No description provided for @selectZone.
  ///
  /// In en, this message translates to:
  /// **'Select Zone'**
  String get selectZone;

  /// No description provided for @driverLicenseNumber.
  ///
  /// In en, this message translates to:
  /// **'Driver License Number'**
  String get driverLicenseNumber;

  /// No description provided for @licenseExpireDate.
  ///
  /// In en, this message translates to:
  /// **'License Expire Date'**
  String get licenseExpireDate;

  /// No description provided for @uploadLicensePhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload License Photo'**
  String get uploadLicensePhoto;

  /// No description provided for @enterVehiclesRegistrationNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Registration Number'**
  String get enterVehiclesRegistrationNumber;

  /// No description provided for @enterVehiclesInsuranceNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Insurance Number'**
  String get enterVehiclesInsuranceNumber;

  /// No description provided for @uploadVehiclesPhoto.
  ///
  /// In en, this message translates to:
  /// **'Upload Vehicles Photo'**
  String get uploadVehiclesPhoto;

  /// No description provided for @selectCategory.
  ///
  /// In en, this message translates to:
  /// **'Select Category'**
  String get selectCategory;

  /// No description provided for @personal.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get personal;

  /// No description provided for @licenses.
  ///
  /// In en, this message translates to:
  /// **'License'**
  String get licenses;

  /// No description provided for @vehicles.
  ///
  /// In en, this message translates to:
  /// **'Vehicles'**
  String get vehicles;

  /// No description provided for @vehiclesManufacturer.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Manufacturer'**
  String get vehiclesManufacturer;

  /// No description provided for @vehiclesModel.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Model'**
  String get vehiclesModel;

  /// No description provided for @manufacturedYear.
  ///
  /// In en, this message translates to:
  /// **'Manufactured Year'**
  String get manufacturedYear;

  /// No description provided for @personalInformation.
  ///
  /// In en, this message translates to:
  /// **'Personal Information'**
  String get personalInformation;

  /// No description provided for @driverLicenseInformation.
  ///
  /// In en, this message translates to:
  /// **'Driver License Information'**
  String get driverLicenseInformation;

  /// No description provided for @vehiclesInformation.
  ///
  /// In en, this message translates to:
  /// **'Vehicles Information'**
  String get vehiclesInformation;

  /// No description provided for @vendorFilters_allVendor.
  ///
  /// In en, this message translates to:
  /// **'All Vendor'**
  String get vendorFilters_allVendor;

  /// No description provided for @vendorFilters_verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get vendorFilters_verified;

  /// No description provided for @vendorFilters_newVendor.
  ///
  /// In en, this message translates to:
  /// **'New Vendor'**
  String get vendorFilters_newVendor;

  /// No description provided for @orderHistoryFilters_receivedDelivery.
  ///
  /// In en, this message translates to:
  /// **'Received Delivery'**
  String get orderHistoryFilters_receivedDelivery;

  /// No description provided for @orderHistoryFilters_completeDelivery.
  ///
  /// In en, this message translates to:
  /// **'Complete Delivery'**
  String get orderHistoryFilters_completeDelivery;

  /// No description provided for @returnTypes_replacement.
  ///
  /// In en, this message translates to:
  /// **'Replacement'**
  String get returnTypes_replacement;

  /// No description provided for @returnTypes_returnProduct.
  ///
  /// In en, this message translates to:
  /// **'Return Product'**
  String get returnTypes_returnProduct;

  /// No description provided for @returnReason_vendorSentWrong.
  ///
  /// In en, this message translates to:
  /// **'Vendor sent wrong'**
  String get returnReason_vendorSentWrong;

  /// No description provided for @returnReason_damagedItem.
  ///
  /// In en, this message translates to:
  /// **'Damaged item'**
  String get returnReason_damagedItem;

  /// No description provided for @returnReason_deliveryRiderMistake.
  ///
  /// In en, this message translates to:
  /// **'Delivery rider made a mistake'**
  String get returnReason_deliveryRiderMistake;

  /// No description provided for @returnReason_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get returnReason_other;

  /// No description provided for @genderList_male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderList_male;

  /// No description provided for @genderList_female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderList_female;

  /// No description provided for @activePayment.
  ///
  /// In en, this message translates to:
  /// **'Active Payment'**
  String get activePayment;

  /// No description provided for @totalEarning.
  ///
  /// In en, this message translates to:
  /// **'Total Earning'**
  String get totalEarning;

  /// No description provided for @completeOrder.
  ///
  /// In en, this message translates to:
  /// **'Complete Order'**
  String get completeOrder;

  /// No description provided for @pendingOrder.
  ///
  /// In en, this message translates to:
  /// **'Pending Order'**
  String get pendingOrder;

  /// No description provided for @successOrder.
  ///
  /// In en, this message translates to:
  /// **'Success Order'**
  String get successOrder;

  /// No description provided for @addtoStore.
  ///
  /// In en, this message translates to:
  /// **'Add to Store'**
  String get addtoStore;

  /// No description provided for @myProduct.
  ///
  /// In en, this message translates to:
  /// **'My Product'**
  String get myProduct;

  /// No description provided for @newOrder.
  ///
  /// In en, this message translates to:
  /// **'New order'**
  String get newOrder;

  /// No description provided for @archive.
  ///
  /// In en, this message translates to:
  /// **'Archive'**
  String get archive;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @agentInformation.
  ///
  /// In en, this message translates to:
  /// **'Agent Information'**
  String get agentInformation;

  /// No description provided for @nationalIDcard.
  ///
  /// In en, this message translates to:
  /// **'National ID card'**
  String get nationalIDcard;

  /// No description provided for @bankName.
  ///
  /// In en, this message translates to:
  /// **'Bank Name'**
  String get bankName;

  /// No description provided for @bankAccount.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bankAccount;

  /// No description provided for @myStore.
  ///
  /// In en, this message translates to:
  /// **'My Store'**
  String get myStore;

  /// No description provided for @deliveryTime.
  ///
  /// In en, this message translates to:
  /// **'Delivery Time'**
  String get deliveryTime;

  /// No description provided for @availableProducts.
  ///
  /// In en, this message translates to:
  /// **'Available Products'**
  String get availableProducts;

  /// No description provided for @stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get stock;

  /// No description provided for @vendorDetails.
  ///
  /// In en, this message translates to:
  /// **'Vendor Details'**
  String get vendorDetails;

  /// No description provided for @submitToVendor.
  ///
  /// In en, this message translates to:
  /// **'Submit to Vendor'**
  String get submitToVendor;

  /// No description provided for @chatWithVendor.
  ///
  /// In en, this message translates to:
  /// **'Chat With Vendor'**
  String get chatWithVendor;

  /// No description provided for @productSize.
  ///
  /// In en, this message translates to:
  /// **'Product Size'**
  String get productSize;

  /// No description provided for @transactionId.
  ///
  /// In en, this message translates to:
  /// **'Transaction Id'**
  String get transactionId;

  /// No description provided for @paymentStatus.
  ///
  /// In en, this message translates to:
  /// **'Payment Status'**
  String get paymentStatus;

  /// No description provided for @customerName.
  ///
  /// In en, this message translates to:
  /// **'Customer Name'**
  String get customerName;

  /// No description provided for @orderId.
  ///
  /// In en, this message translates to:
  /// **'Order Id'**
  String get orderId;

  /// No description provided for @submitOrder.
  ///
  /// In en, this message translates to:
  /// **'Submit Order'**
  String get submitOrder;

  /// No description provided for @requestedOrderDetails.
  ///
  /// In en, this message translates to:
  /// **'Requested Order Details'**
  String get requestedOrderDetails;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// No description provided for @editProduct.
  ///
  /// In en, this message translates to:
  /// **'Edit Product'**
  String get editProduct;

  /// No description provided for @deleteProduct.
  ///
  /// In en, this message translates to:
  /// **'Delete Product'**
  String get deleteProduct;

  /// No description provided for @updateProduct.
  ///
  /// In en, this message translates to:
  /// **'Update Product'**
  String get updateProduct;

  /// No description provided for @loaltyClaimingMessage.
  ///
  /// In en, this message translates to:
  /// **'You’ve received a # on your next order! Don’t miss out'**
  String get loaltyClaimingMessage;
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
      <String>['en', 'sw'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'sw':
      return AppLocalizationsSw();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
