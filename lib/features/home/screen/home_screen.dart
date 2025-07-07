import 'package:bai_serve/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/widgets/custom_app_bar.dart';
import 'package:bai_serve/features/home/widgets/home_content.dart';
import 'package:bai_serve/features/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:
        (controller) => Scaffold(
          appBar: CustomAppBar(
            availableCountries: controller.availableCountries,
            slectedCountry: controller.selectedCountry,
            userName: controller.name,
            address: controller.address,
            onCountryChange: controller.onCountryChange,
            notificationCount: controller.notificationCount,
          ),
          drawer: HomeDrawer(
            userName: controller.name,
            address: controller.address,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: HomeContent(controller: controller),
          ),
          bottomNavigationBar: CommonBottomNavBar(currentIndex: 0 ),
        ),
  );
}
