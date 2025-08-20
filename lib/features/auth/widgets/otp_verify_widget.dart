import 'package:bai_serve_customer/component/button/common_gradient_button.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/component/text_field/input_helper.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/otp_cubit.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../cubit/otp_state.dart';

class OtpVerifyWidget extends StatefulWidget {
  const OtpVerifyWidget({required this.onSuccess, required this.state, super.key});
  final Function onSuccess;
  final OtpState state;

  @override
  State<OtpVerifyWidget> createState() => _OtpVerifyWidgetState();
}

class _OtpVerifyWidgetState extends State<OtpVerifyWidget> {
  late TextEditingController controller;
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Form(key: formKey, child: _otpBuilder(context)),
      _resendOtpTimerBuilder(widget.state).end,
      20.height,
      CommonGradientButton(
        titleText: AppString.verify,
        isLoading: false,
        buttonWidth: 160,
        buttonHeight: 40.h,
        titleSize: 12,
        titleWeight: FontWeight.w500,
        onTap: () {
          if (formKey.currentState?.validate() == true) {
            context.read<OtpCubit>().verifyOtp(controller.text);
            widget.onSuccess();
          }
        },
      ),
    ],
  );

  Widget _resendOtpTimerBuilder(OtpState state) {
    return state.count == 0
        ? _resendMessageBuilder(state)
        : CommonText(
          alignment: MainAxisAlignment.end,
          text: '${AppString.resendCodeIn} ${state.count} ${AppString.seconds}',
          style: const TextStyle(fontWeight: FontWeight.bold, color: AppColors.primaryColor2),
        );
  }

  Widget _resendMessageBuilder(OtpState state) => Align(
    alignment: Alignment.centerRight,
    child: Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: AppString.didntReciveCode,
            style: GoogleFonts.dmSans(
              color: getTheme.textTheme.bodySmall?.color,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),

          /// Sign Up Button here
          TextSpan(
            text: ' ${AppString.resendCode}',
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    context.read<OtpCubit>().sendOtp(state.username);
                  },
            style: GoogleFonts.lato(color: getTheme.colorScheme.primary, fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    ),
  );

  Flexible _otpBuilder(BuildContext context) {
    return Flexible(
      flex: 0,
      child: PinCodeTextField(
        controller: controller,
        autoDisposeControllers: false,
        cursorColor: getTheme.textSelectionTheme.cursorColor,
        textStyle: getTheme.textTheme.bodyMedium?.copyWith(fontSize: 25, color: AppColors.primaryColor),
        appContext: (context),
        autoFocus: true,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(04),
          fieldHeight: 40,
          fieldWidth: 40,
          activeFillColor: AppColors.transparent,
          selectedFillColor: AppColors.transparent,
          inactiveFillColor: AppColors.transparent,
          borderWidth: 0.1,
          selectedColor: getTheme.primaryColor.withAlpha(80),
          activeColor: getTheme.primaryColor.withAlpha(80),
          inactiveColor: getTheme.primaryColor.withAlpha(80),
        ),
        length: 6,
        keyboardType: InputHelper.getKeyboardType(ValidationType.validateOTP),
        inputFormatters: InputHelper.getInputFormatters(ValidationType.validateOTP),
        autovalidateMode: AutovalidateMode.disabled,
        enableActiveFill: true,
        validator: (value) => InputHelper.validate(ValidationType.validateOTP, value),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
