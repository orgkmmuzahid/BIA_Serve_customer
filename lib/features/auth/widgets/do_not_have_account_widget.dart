import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../config/languages/cubit/language_cubit.dart';

class DoNotHaveAccount extends StatelessWidget {
  const DoNotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: AppString.doNotHaveAccount, style: getTheme.textTheme.titleSmall),

          /// Sign Up Button here
          TextSpan(
            text: ' ${AppString.signUp}',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    appRouter.push(
                      OtpRoute(
                        onSuccess: () {
                          appRouter.push(const SignUpRoute());
                        },
                      ),
                    );
                  },
            style: GoogleFonts.dmSans(color: getTheme.colorScheme.primary, fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
