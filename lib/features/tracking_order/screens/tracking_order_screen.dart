// File: tracking_order_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';

// static const String trackingOrder = "/tracking_order_screen.dart";
// GetPage(name: trackingOrder, page: () => const TrackingOrderScreen()),

class TrackingOrderScreen extends StatelessWidget {
  const TrackingOrderScreen({super.key});

   @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.percelTracking,leading: SizedBox(width: 0, height: 0),),
    body: Padding(padding: EdgeInsetsGeometry.only(left: 16, right: 16), 
     child: Column(children: [
       
     ]),
    ), bottomNavigationBar: CommonBottomNavBar());

}