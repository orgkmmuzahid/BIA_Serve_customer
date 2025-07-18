import 'dart:io';

import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/other_widgets/screenshot_priview.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/features/vendor_sourcing/controllers/vendor_sourcing_controller.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

final GlobalKey _previewContainerKey = GlobalKey();

class ViewProductScreen extends StatelessWidget {
  const ViewProductScreen({super.key});

  @override
  Widget build(BuildContext context) => RepaintBoundary(
    key: _previewContainerKey,
    child: Scaffold(
      appBar: CommonAppBar(title: AppString.viewProduct),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: GetBuilder<VendorSourcingController>(
          builder: (vendorSourcingController) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  CommonText(
                    text: AppString.productCategory,
                    style: theme.textTheme.bodyLarge,
                    bottom: 10,
                  ),
    
                  CommonButton(titleText: AppString.screenshot,  buttonColor: AppColors.primaryColor3, onTap: () {
                    Utils.takeScreenshot(_previewContainerKey).then((path){
                      if(path != null){
                        ScreenshotPreview( imagePath: path);
                      }
                    });
                    
                  },),
                  
                
                ],
              ),
            );
          },
        ),
      ),
    ),
  );
}