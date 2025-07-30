import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class CommonAlert {
  CommonAlert({
    required this.title,
    required this.onTap,
    this.content,
    this.disableActionButton = false,
    this.disableCancelButton = false,
    this.actionButtonTittle = AppString.yes,
    this.cancelButtonTittle = AppString.no,
  }) {
    _alertBuilder();
  }
  final String title;
  final String actionButtonTittle;
  final String cancelButtonTittle;
  final Function onTap;
  final Widget? content;
  final bool disableActionButton;
  final bool disableCancelButton;
  Future<dynamic> _alertBuilder() {
    return showDialog(
      context: navigatorRouterKey.currentContext!,
      builder:
          (c) => AlertDialog(
            title: Text(title, style: getTheme.textTheme.titleMedium),
            actionsAlignment: MainAxisAlignment.center,
            content: content,
            actions: [
              if (disableActionButton == false)
                CommonButton(
                  titleText: cancelButtonTittle,
                  buttonWidth: 70,
                  buttonHeight: 35,
                  buttonColor: AppColors.primaryColor3,
                  titleColor: AppColors.textWhite,
                  onTap: appRouter.pop,
                ),
              if (disableCancelButton == false)
                CommonButton(
                  titleText: actionButtonTittle,
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
