// File: payment_controller.dart

import 'package:get/get.dart';

// Get.lazyPut(() => PaymentController(), fenix: true);

class PaymentController extends GetxController {
    String? selectedPayment;

    
  void onPaymentChange(String newPayment){
           selectedPayment = newPayment;
           update();
  }


  void processPayment()async{
    
  }

  
}