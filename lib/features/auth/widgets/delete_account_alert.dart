import 'package:bai_serve_customer/component/pop_up/common_alert.dart';
import 'package:bai_serve_customer/component/text_field/common_text_field.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteAccountAlert {
  DeleteAccountAlert() {
    CommonAlert(
      title: AppString.accountDeleteMessage,
      content: SizedBox(
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// current Password section
            CommonTextField(
              hintText: AppString.password,
              validationType: ValidationType.validatePassword,
              prefixIcon: Icon(Icons.lock, size: 20.sp),
            ),
          ],
        ),
      ),
      onTap: (){},
    );
  }
}
