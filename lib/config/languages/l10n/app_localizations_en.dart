// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get requiredField => 'This field is required';

  @override
  String get invalidEmail => 'Please enter a valid email address';

  @override
  String get invalidPhone => 'Please enter a valid phone number';

  @override
  String get invalidPassword =>
      'Password must be at least 8 characters long, contain an uppercase letter, and a digit';

  @override
  String get invalidDate => 'Please enter a valid date (YYYY-MM-DD)';

  @override
  String get passwordMismatch => 'Passwords do not match';

  @override
  String get invalidURL => 'Please enter a valid URL';

  @override
  String get invalidNumber => 'Please enter a valid number';

  @override
  String get invalidCreditCard =>
      'Please enter a valid credit card number (16 digits)';

  @override
  String get invalidPostalCode => 'Please enter a valid postal code';

  @override
  String minLengthError(Object minLength) {
    return 'Input must be at least $minLength characters';
  }

  @override
  String maxLengthError(Object maxLength) {
    return 'Input must be no more than $maxLength characters';
  }

  @override
  String get invalidPattern => 'Input does not match the required pattern';

  @override
  String invalidDateRange(Object endDate, Object startDate) {
    return 'Date must be between $startDate and $endDate';
  }

  @override
  String otpEntrySubtitle(Object username) {
    return 'Otp has been sent to $username';
  }

  @override
  String get alphaNumericError => 'Only alphanumeric characters are allowed';

  @override
  String get usernameError =>
      'Username must be between 3 to 15 characters and can only contain letters, numbers, and underscores';

  @override
  String get invalidTime => 'Please enter a valid time in HH:mm format';

  @override
  String get invalidOTP => 'Please enter a valid 6-digit OTP';

  @override
  String get invalidCurrency => 'Please enter a valid amount (e.g., 1234.56)';

  @override
  String get invalidIP => 'Please enter a valid IPv4 address';

  @override
  String get allDataLoaded => 'All data loaded';

  @override
  String get nidRequired => 'National ID is required.';

  @override
  String get nidInvalid => 'Please enter a valid National ID (12 digits).';

  @override
  String get fullNameRequired => 'Full name is required.';

  @override
  String get fullNameInvalid =>
      'Please enter a valid full name (e.g., John Doe, O\'Connor, Mary-Jane).';

  @override
  String get seconds => 'Seconds';

  @override
  String get dataEmpty => 'Data Empty';

  @override
  String get delivery => 'Delivery';

  @override
  String get noInternet => 'No Internet';

  @override
  String get checkInternet => 'Check Internet';

  @override
  String get back => 'Back';

  @override
  String get youSureWantToLogout => 'You sure want to logout';

  @override
  String get uploadProofs => 'Upload Proofs';

  @override
  String get no => 'No';

  @override
  String get yes => 'Yes';

  @override
  String get areYouSure => 'Are you sure';

  @override
  String get enterYouPassword => 'Enter your password';

  @override
  String get deliveryProofMandatory =>
      'Delivered item photo and signed delivery note are required.';

  @override
  String get cancel => 'Cancel';

  @override
  String get done => 'Done';

  @override
  String get deleteDetails =>
      'All your changes will be deleted and you will no longer be able to access them.';

  @override
  String get someThingWrong => 'Something went wrong';

  @override
  String get tryAgain => 'Try Again';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get phoneNo => 'Phone No.';

  @override
  String get riderId => 'Rider Id';

  @override
  String get hubName => 'Hub Name';

  @override
  String get test => 'Test';

  @override
  String get changePassword => 'Change Password';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get allOrders => 'All Orders';

  @override
  String get forgotPassword => 'Forgot Password';

  @override
  String get confirm => 'Confirm';

  @override
  String get createNewPassword => 'Create New Password';

  @override
  String get createYourNewPassword => 'Create Your New Password';

  @override
  String get password => 'Password';

  @override
  String get continues => 'Continue';

  @override
  String get email => 'Email';

  @override
  String get codeHasBeenSendTo => 'Code has been sent to';

  @override
  String get otpIsInValid => 'Otp is invalid';

  @override
  String get deliveryProof => 'Delivery Proof';

  @override
  String get resendCode => 'Resend';

  @override
  String get resendCodeIn => 'Resend code in';

  @override
  String get minute => 'minute';

  @override
  String get verify => 'Verify';

  @override
  String get verifyNow => 'Verify Now';

  @override
  String get verifyVendor => 'Verify Vendor';

  @override
  String get logIntoYourAccount => 'Login to Your Account';

  @override
  String get forgotThePassword => 'Forgot Password';

  @override
  String get signIn => 'Sign in';

  @override
  String get doNotHaveAccount => 'Don’t have an account?';

  @override
  String get signUp => 'Sign up';

  @override
  String get alreadyHaveAccount => 'Already have an account';

  @override
  String get fullName => 'Full Name';

  @override
  String get createYourAccount => 'Create Your Account';

  @override
  String get otpVerify => 'OTP Verify';

  @override
  String get inbox => 'Inbox';

  @override
  String get searchProduct => 'Search product';

  @override
  String get activeNow => 'Active Now';

  @override
  String get message => 'Message';

  @override
  String get notifications => 'Notifications';

  @override
  String get contact => 'Contact';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get age => 'Age';

  @override
  String get aboutMe => 'About Me';

  @override
  String get gender => 'Gender';

  @override
  String get profile => 'Profile';

  @override
  String get profilePhoto => 'Profile Photo';

  @override
  String get saveAndChanges => 'Save and Changes';

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get settings => 'Settings';

  @override
  String get logOut => 'Log Out';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfServices => 'Terms of Services';

  @override
  String get noInternetConnection => 'No internet connection';

  @override
  String get badResponseRequest => 'Bad Response Request';

  @override
  String get requestTimeOut => 'Request Time Out';

  @override
  String get thisFieldIsRequired => 'This field is required';

  @override
  String get enterValidEmail => 'Enter valid email';

  @override
  String get enterValidPhone => 'Enter valid phone';

  @override
  String get passwordMustBeeEightCharacters =>
      'Password must be 8 characters & contain both alphabets and numerics';

  @override
  String get thePasswordDoesNotMatch => 'The password does not match';

  @override
  String get startServer => 'Please, start the Server';

  @override
  String get unknownError => 'Unknown Error';

  @override
  String get selectYourLanguage => 'Select Your Language';

  @override
  String get zoneCollector => 'Zone Collector';

  @override
  String get hubTransfer => 'Hub Transfer';

  @override
  String get lastMileDelivery => 'Last-Mile Delivery';

  @override
  String get loginWithContactNumber => 'Log in With Contact Number';

  @override
  String get loginWithGoogle => 'Log in With Google';

  @override
  String get loginWithFacebook => 'Log in With Facebook';

  @override
  String get otpTitleSignup => 'What\'s Your Mobile Number?';

  @override
  String get otpSubtitleSignup =>
      'Code sent to your mobile. Please enter it below.';

  @override
  String get otpTitleForgetPass => 'What\'s Your Mobile Number?';

  @override
  String get otpSubTitleForgetPass =>
      'Code sent to your mobile. Please enter it below.';

  @override
  String get otpSendButton => 'Send Code Via SMS';

  @override
  String get enterVerifyCode => 'Enter the code to verify your account.';

  @override
  String get didntReciveCode => 'If you didn’t receive a code.';

  @override
  String get save => 'Save';

  @override
  String get decline => 'Decline';

  @override
  String get accept => 'Accept';

  @override
  String get viewProfile => 'View Profile';

  @override
  String get drawerReturnsProduct => 'Returns Product';

  @override
  String get drawerLoyaltyPoints => 'Loyalty Points';

  @override
  String get drawerMessage => 'Message';

  @override
  String get drawerMyPayment => 'My Payment';

  @override
  String get drawerSupport => 'Support';

  @override
  String get drawerLanguage => 'Language';

  @override
  String get drawerDeleteAccount => 'Delete Account';

  @override
  String get navHome => 'Home';

  @override
  String get navMyOrder => 'My Order';

  @override
  String get navTrackingOrder => 'Tracking Order';

  @override
  String get navAccount => 'Account';

  @override
  String get trackingID => 'Tracking ID';

  @override
  String get homePlaceOrder => 'Place Order';

  @override
  String get homeVendorSourcing => 'Vendor Sourcing';

  @override
  String get homePurchaseDelivery => 'Purchase & Delivery';

  @override
  String get homeBulkOrderAgents => 'Bulk Order Agents';

  @override
  String get homeVerifyVendor => 'Verify Vendor';

  @override
  String get homeDoorToDoorPickup => 'Door-to-Door Pickup';

  @override
  String get myOrder => 'My Order';

  @override
  String get seeAll => 'See All';

  @override
  String get placeOrder => 'Place Order';

  @override
  String get setPickupDeliveryLocation => 'Set Pickup & Delivery Location';

  @override
  String get deliveryLocation => 'Delivery Location';

  @override
  String get pickupAddress => 'Pickup Address';

  @override
  String get recentSearch => 'Recent Search';

  @override
  String get pickupInformation => 'Pickup Information';

  @override
  String get district => 'District';

  @override
  String get city => 'City';

  @override
  String get outsideCity => 'Outside City';

  @override
  String get ward => 'Ward';

  @override
  String get subWard => 'Sub-Ward';

  @override
  String get plotApartment => 'Plot/Apartment/Road';

  @override
  String get itemDetails => 'Item Details';

  @override
  String get pickupTime => 'Pickup Time';

  @override
  String get serviceType => 'Service Type';

  @override
  String get addImage => 'Add Images';

  @override
  String get productWieght => 'Product Weight';

  @override
  String get quantity => 'Quantity';

  @override
  String get deliveryAddress => 'Delivery Address';

  @override
  String get couponCode => 'Coupon Code';

  @override
  String get noCouponCode => 'No Coupon Code';

  @override
  String get regularCustomersLoyaltyPoints =>
      'Loyalty Points for Regular Customers';

  @override
  String get regularCustomersLoyaltyPointsMessage =>
      'The more you use the app, the more rewards you earn! Loyalty points, promo codes, and special discounts await our active users.';

  @override
  String get points => 'Points';

  @override
  String get points10000 => '10,000 Points';

  @override
  String get points1000 => '1,000 Points';

  @override
  String get off_10 => '10% Off';

  @override
  String get freeDelivery => 'Free Delivery';

  @override
  String get viewRewards => 'View Rewards';

  @override
  String get myRewards => 'My Rewards';

  @override
  String get discount => 'Discount';

  @override
  String get claim => 'Claim';

  @override
  String get receivedCode => 'Received Code';

  @override
  String get receiveOrder => 'Received Order';

  @override
  String get orderRiecevedSuccess => 'Order Has Been Received Successfully';

  @override
  String get orderNow => 'Order Now';

  @override
  String get backToHome => 'Back to Home';

  @override
  String get submitCodeBy => 'Submit Code: (Regular Customer)';

  @override
  String get totalPrice => 'Total Price';

  @override
  String get orderDetails => 'Order Details';

  @override
  String get orderCode => 'Order Code';

  @override
  String get orderDelivered => 'Order Delivered';

  @override
  String get customer => 'Customer';

  @override
  String get shippingAddress => 'Shipping Address';

  @override
  String get productDetails => 'Product Details';

  @override
  String get deliverySuccessMessage =>
      'The order has been delivered successfully';

  @override
  String get weight => 'Weight';

  @override
  String get orderDateTime => 'Order date';

  @override
  String get orderStatus => 'Order status';

  @override
  String get deliveryCharge => 'Delivery Charge';

  @override
  String get charge => 'Charge';

  @override
  String get discountPercentage => 'Discount';

  @override
  String get distance => 'Distance';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get bankPayment => 'Bank Payment';

  @override
  String get payment => 'Payment';

  @override
  String get paymentHistory => 'Payment History';

  @override
  String get checkout => 'Checkout';

  @override
  String get mobileBanking => 'Mobile Banking';

  @override
  String get totalPay => 'Total pay';

  @override
  String get pickupFromMe => 'Pick Up from Me';

  @override
  String get pickupFromVendor => 'Pick Up from Vendor';

  @override
  String get urgentDelivery => 'Urgent Delivery';

  @override
  String get regularDelivery => 'Regular Delivery';

  @override
  String get listOfSupplier => 'List of Supplier';

  @override
  String get addProduct => '+ Add Product';

  @override
  String get negotiationAssistance => 'Negotiation Assistance';

  @override
  String get messageRequest => 'Message Request';

  @override
  String get negotiationAssistanceSubTitle =>
      'Request negotiation help from admin for better pricing.';

  @override
  String get sentOrder => 'Sent Order';

  @override
  String get orderSummery => 'Order Summary';

  @override
  String get submitPromoCode => 'Submit Promo Code';

  @override
  String get vendorName => 'Vendors Name';

  @override
  String get vendorId => 'Vendor ID';

  @override
  String get vendorLocation => 'Vendor Location';

  @override
  String get uplaodScreenshot => 'Upload Screenshot';

  @override
  String get vendorContactNumber => 'Vendor Contact Number';

  @override
  String get productAmount => 'Product Amount';

  @override
  String get deliveryType => 'Delivery Type';

  @override
  String get deliveryAdress => 'Delivery Address';

  @override
  String get productDescription => 'Product Description';

  @override
  String get serviceFee => 'Service Fee';

  @override
  String get monySign => 'TSH';

  @override
  String get availableEarning => 'Available Earning';

  @override
  String get percelTracking => 'Parcel Tracking';

  @override
  String get account => 'Account';

  @override
  String get searchForOrder => 'Search For Order';

  @override
  String get logoutMessage => 'Are you sure you want to log out?';

  @override
  String get productReturnSuccessMessage => 'Return Request Successful.';

  @override
  String get accountDeleteMessage =>
      'Are you sure you want to delete your account?';

  @override
  String get termsCondition => 'Terms & Condition';

  @override
  String get changePersonalInfo => 'Change Personal Info';

  @override
  String get profileInfo => 'Profile Info';

  @override
  String get submittedProofs => 'Submitted Proofs';

  @override
  String get myPayment => 'My Payment';

  @override
  String get withdraw => 'Withdraw';

  @override
  String get deleteUser => 'Delete User';

  @override
  String get blockUser => 'Block User';

  @override
  String get estimatedDeliveryTime => 'Estimated Delivery Time';

  @override
  String get senderName => 'Sender Name';

  @override
  String get deliveryHistory => 'Delivery History';

  @override
  String get reciverName => 'Receiver Name';

  @override
  String get riderName => 'Rider Name';

  @override
  String get hubCode => 'Hub code';

  @override
  String get totalParcel => 'Total Parcel';

  @override
  String get address => 'Address';

  @override
  String get productCategory => 'Product Category';

  @override
  String get numberOfVendor => 'Number of Vendor';

  @override
  String get budget => 'Budget';

  @override
  String get specialInstruction => 'Special Instruction';

  @override
  String get submitRequest => 'Submit Request';

  @override
  String get allProducts => 'All Products';

  @override
  String get allVendors => 'All Vendors';

  @override
  String get vendorSourcingCategory => 'Vendor Sourcing';

  @override
  String get viewProduct => 'View Product';

  @override
  String get screenshot => 'Screenshot';

  @override
  String get availableColor => 'Available Color';

  @override
  String get availableSize => 'Available Size';

  @override
  String get riderDetails => 'Rider Details';

  @override
  String get callNow => 'Call Now';

  @override
  String get myVendors => 'My Vendors';

  @override
  String get verifyApplyDate => 'Apply Date';

  @override
  String get shareThroughWhatsUp => 'Share through WhatsApp';

  @override
  String get verificationStatus => 'Verification Status';

  @override
  String get verificationFee => 'Verification Fee';

  @override
  String get inTransit => 'In Transit';

  @override
  String get vendorProof => 'Vendor Proof';

  @override
  String get profileLink => 'Profile Link';

  @override
  String get adminProof => 'Admin Proof';

  @override
  String get vendor => 'Vendor';

  @override
  String get status => 'Status';

  @override
  String get addMoreDetails => 'Add more details';

  @override
  String get orderHistory => 'Order History';

  @override
  String get orderNo => 'Order No.';

  @override
  String get checkIn => 'Check in';

  @override
  String get lateDuty => 'Late Duty';

  @override
  String get totalAttendance => 'Total Attendance';

  @override
  String get checkOut => 'Check out';

  @override
  String get review => 'Review';

  @override
  String get attendance => 'Attendance';

  @override
  String get parcelReceived => 'Parcel Received';

  @override
  String get days => 'Days';

  @override
  String get addDocuments => 'Add Documents';

  @override
  String get myDocuments => 'My Documents';

  @override
  String get searchOrderNumber => 'Search Order Number';

  @override
  String get receivedHistory => 'Received History';

  @override
  String get receivedOrder => 'Received Order';

  @override
  String get pendingDelivery => 'Pending Delivery';

  @override
  String get successDelivery => 'Successful Delivery';

  @override
  String get tracking => 'Tracking';

  @override
  String get myTask => 'My Task';

  @override
  String get dailyTask => 'Daily Task';

  @override
  String get weeklyTask => 'Weekly Task';

  @override
  String get monthlyTask => 'Monthly Task';

  @override
  String get noDetailsAvailableForThisNotification =>
      'This notification has no further information.';

  @override
  String get vendorVerificationRequestMessage =>
      'Your Vendor Verify Request has been submitted. Our team will get back to you shortly.';

  @override
  String get loyaltyClaimingMessage =>
      'You’ve received a \$value on your next order! Don’t miss out';

  @override
  String get selectZone => 'Select Zone';

  @override
  String get driverLicenseNumber => 'Driver License Number';

  @override
  String get licenseExpireDate => 'License Expire Date';

  @override
  String get uploadLicensePhoto => 'Upload License Photo';

  @override
  String get enterVehiclesRegistrationNumber => 'Vehicles Registration Number';

  @override
  String get enterVehiclesInsuranceNumber => 'Vehicles Insurance Number';

  @override
  String get uploadVehiclesPhoto => 'Upload Vehicles Photo';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get personal => 'Personal';

  @override
  String get licenses => 'License';

  @override
  String get vehicles => 'Vehicles';

  @override
  String get vehiclesManufacturer => 'Vehicles Manufacturer';

  @override
  String get vehiclesModel => 'Vehicles Model';

  @override
  String get manufacturedYear => 'Manufactured Year';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get driverLicenseInformation => 'Driver License Information';

  @override
  String get vehiclesInformation => 'Vehicles Information';

  @override
  String get vendorFilters_allVendor => 'All Vendor';

  @override
  String get vendorFilters_verified => 'Verified';

  @override
  String get vendorFilters_newVendor => 'New Vendor';

  @override
  String get orderHistoryFilters_receivedDelivery => 'Received Delivery';

  @override
  String get orderHistoryFilters_completeDelivery => 'Complete Delivery';

  @override
  String get returnTypes_replacement => 'Replacement';

  @override
  String get returnTypes_returnProduct => 'Return Product';

  @override
  String get returnReason_vendorSentWrong => 'Vendor sent wrong';

  @override
  String get returnReason_damagedItem => 'Damaged item';

  @override
  String get returnReason_deliveryRiderMistake =>
      'Delivery rider made a mistake';

  @override
  String get returnReason_other => 'Other';

  @override
  String get genderList_male => 'Male';

  @override
  String get genderList_female => 'Female';

  @override
  String get activePayment => 'Active Payment';

  @override
  String get totalEarning => 'Total Earning';

  @override
  String get completeOrder => 'Complete Order';

  @override
  String get pendingOrder => 'Pending Order';

  @override
  String get successOrder => 'Success Order';

  @override
  String get addtoStore => 'Add to Store';

  @override
  String get myProduct => 'My Product';

  @override
  String get newOrder => 'New order';

  @override
  String get archive => 'Archive';

  @override
  String get favorite => 'Favorite';

  @override
  String get price => 'Price';

  @override
  String get agentInformation => 'Agent Information';

  @override
  String get nationalIDcard => 'National ID card';

  @override
  String get bankName => 'Bank Name';

  @override
  String get bankAccount => 'Bank Account';

  @override
  String get myStore => 'My Store';

  @override
  String get deliveryTime => 'Delivery Time';

  @override
  String get availableProducts => 'Available Products';

  @override
  String get stock => 'Stock';

  @override
  String get vendorDetails => 'Vendor Details';

  @override
  String get submitToVendor => 'Submit to Vendor';

  @override
  String get chatWithVendor => 'Chat With Vendor';

  @override
  String get productSize => 'Product Size';

  @override
  String get transactionId => 'Transaction Id';

  @override
  String get paymentStatus => 'Payment Status';

  @override
  String get customerName => 'Customer Name';

  @override
  String get orderId => 'Order Id';

  @override
  String get submitOrder => 'Submit Order';

  @override
  String get requestedOrderDetails => 'Requested Order Details';

  @override
  String get viewDetails => 'View Details';

  @override
  String get submit => 'Submit';

  @override
  String get editProduct => 'Edit Product';

  @override
  String get deleteProduct => 'Delete Product';

  @override
  String get updateProduct => 'Update Product';

  @override
  String get loaltyClaimingMessage =>
      'You’ve received a # on your next order! Don’t miss out';
}
