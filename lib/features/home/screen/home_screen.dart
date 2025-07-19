import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/features/home/widgets/home_content.dart';
import 'package:bai_serve/features/home/widgets/home_drawer.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => GetBuilder<HomeController>(
    builder:
        (controller) => Scaffold(
          appBar: CommonAppBar(
            leading: _leading(),
            isCenterTitle: false,
            titleWidget: _title(controller),
          ),
          drawer: HomeDrawer(
            userName: controller.name,
            address: controller.address,
            controller: controller,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: HomeContent(homeController: controller),
          ),
          bottomNavigationBar: const CommonBottomNavBar(),
        ),
  );

  Column _title(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          controller.name,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.primaryColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(controller.address, style: theme.textTheme.bodySmall),
      ],
    );
  }

  Builder _leading() {
    return Builder(
      builder:
          (context) => IconButton(
            icon: Icon(Icons.menu, color: theme.textTheme.bodyMedium?.color),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
    );
  }
}
