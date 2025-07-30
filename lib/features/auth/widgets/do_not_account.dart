import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/controllers/otp_controller.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/constants/app_string.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.doNotHaveAccount,
            style: getTheme.textTheme.titleSmall,
          ),

          /// Sign Up Button here
          TextSpan(
            text: ' ${AppString.signUp}',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    Get.find<OtpController>().changeOtpFor(OtpFor.signup);
                    appRouter.push(const OtpSendRoute());
                  },
            style: GoogleFonts.dmSans(
              color: getTheme.colorScheme.primary,
              fontSize: 12,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
