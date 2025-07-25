import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonAlert {
  CommonAlert({required this.title, required this.onTap, this.content}) {
    _alertBuilder();
  }
  final String title;
  final Function onTap;
  final Widget? content;

  Future<dynamic> _alertBuilder() {
    return showDialog(
      context: navigatorRouterKey.currentContext!,
      builder:
          (c) => AlertDialog(
            title: Text(title, style: getTheme.textTheme.titleMedium),
            actionsAlignment: MainAxisAlignment.center,
            content: content,
            actions: [
              CommonButton(
                titleText: AppString.no,
                buttonWidth: 70,
                buttonHeight: 35,
                buttonColor: AppColors.primaryColor3,
                titleColor: AppColors.textWhite,
                onTap: appRouter.pop,
              ),
              CommonButton(
                titleText: AppString.yes,
                buttonWidth: 70,
                buttonHeight: 35,
                buttonColor: AppColors.success,
                titleColor: AppColors.textWhite,
                onTap: () {
                  appRouter.pop();
                  onTap();
                },
              ),
            ],
          ),
    );
  }
}
