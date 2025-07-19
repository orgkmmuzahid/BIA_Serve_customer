import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonAlert {
  CommonAlert({required this.title, required this.onTap, this.content}) {
    _alertBuilder();
  }
  final String title;
  final Function onTap;
  final Widget? content;

  Future<dynamic> _alertBuilder() {
    return showDialog(
      context: Get.context!,
      builder:
          (c) => AlertDialog(
            title: Text(title, style: theme.textTheme.titleMedium),
            actionsAlignment: MainAxisAlignment.center,
            content: content,
            actions: [
              CommonButton(
                titleText: AppString.no,
                buttonWidth: 70,
                buttonHeight: 30,
                buttonColor: AppColors.primaryColor3,
                titleColor: AppColors.textWhite,
                onTap: () {
                  Navigator.pop(Get.context!);
                },
              ),
              CommonButton(
                titleText: AppString.yes,
                buttonWidth: 70,
                buttonHeight: 30,
                buttonColor: AppColors.success,
                titleColor: AppColors.textWhite,
                onTap: () {
                  Navigator.pop(Get.context!);
                  onTap();
                },
              ),
            ],
          ),
    );
  }
}
