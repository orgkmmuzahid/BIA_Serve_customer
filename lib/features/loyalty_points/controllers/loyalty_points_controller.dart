// File: loyalty_points_controller.dart

import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/loyalty_points/model/loyalty_offer_model.dart';
import 'package:bai_serve/features/order/place_order/controllers/place_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/log/app_log.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// Get.lazyPut(() => LoyaltyPointsController(), fenix: true);

class LoyaltyPointsController extends GetxController {
  int loyaltyPoints = 500;
  String rewardsLevel = 'Cameron Williamson';
  List<LoyaltyOfferModel> loyltyOffers = [
    LoyaltyOfferModel(title: '10% Discount', rewardPoints: 400),
    LoyaltyOfferModel(title: 'Free Delivery', rewardPoints: 600),
  ];
  String? offercode;

  void onClaim(LoyaltyOfferModel claimedOffer) {
    //afterClaiming

    offercode = 'OFFERCODE';

    if (Get.find<PlaceOrderController>()
                .placeOrderModel
                .marchentAdressOnMap
                ?.isEmpty ==
            true ||
        Get.find<PlaceOrderController>().placeOrderModel.marchentAdressOnMap ==
            null) {
        appRouter.popUntilRouteWithName(HomeRoute.name);
        appRouter.push(PlaceOrderRoute(title: AppString.placeOrder));
    } else {
      appRouter.popUntilRouteWithName(PickUpInformationRoute.name);
    }
    update();
  }

  void clean() {
    offercode = null;
  }

  @override
  void dispose() {
    AppLogger.debug('Loyalty controller Disposed');
    super.dispose();
  }
}
