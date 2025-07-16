// File: account_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/bottom_nav_bar/common_bottom_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// static const String account = "/account_screen.dart";
// GetPage(name: account, page: () => const AccountScreen()),

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

    @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.account,leading: SizedBox(width: 0, height: 0),),
    body: Padding(padding: EdgeInsetsGeometry.only(left: 16, right: 16), 
     child: Column(children: [
      _buildMenu(image: AppImages.drawerLanguage, title: AppString.drawerLanguage, onTap:(){
        Get.toNamed(AppRoutes.language);
      }),
      _buildMenu(image: AppImages.drawerSupport, title: AppString.drawerSupport, onTap:(){
        Get.toNamed(AppRoutes.chat);
      }),

     ]),
    ), bottomNavigationBar: CommonBottomNavBar());


  ListTile _buildMenu({required String image,required String title,required Function() onTap}){
    return ListTile(leading: CommonImage(imageSrc: image, size: 24,), trailing: Icon(Icons.arrow_forward_ios),
     title: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
     onTap: () {
              onTap();
              // Handle logout logic
            },
     );
  }
}