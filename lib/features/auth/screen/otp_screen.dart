import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/otp_cubit.dart';
import 'package:bai_serve_customer/features/auth/cubit/otp_state.dart';
import 'package:bai_serve_customer/features/auth/widgets/already_accunt_rich_text.dart';
import 'package:bai_serve_customer/features/auth/widgets/otp_send_widget.dart';
import 'package:bai_serve_customer/features/auth/widgets/otp_verify_widget.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../component/text/common_text.dart';
import '../widgets/common_logo.dart';

@RoutePage()
class OtpScreen extends StatelessWidget {
  const OtpScreen({required this.onSuccess, super.key});
  final Function() onSuccess;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: BlocProvider(
        create: (context) => OtpCubit(),
        child: BlocBuilder<OtpCubit, OtpState>(
          builder: (context, state) {
            return Column(
              children: [
                const Spacer(),
                const CommonLogo().center,
                50.height,
                if (!(state.verificationId.isNotEmpty || state.isLoading))
                  CommonText(
                    text: AppString.otpTitleSignup,
                    style: getTheme.textTheme.bodyLarge,
                    alignment: MainAxisAlignment.center,
                  ),
                if (state.verificationId.isNotEmpty || state.isLoading) ...[
                  CommonText(
                    text: AppString.enterVerifyCode,
                    style: getTheme.textTheme.bodyLarge,
                    alignment: MainAxisAlignment.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                        text: AppString.otpEntrySubtitle(state.username),
                        style: getTheme.textTheme.bodyMedium,
                        alignment: MainAxisAlignment.center,
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<OtpCubit>().resetState();
                        },
                        icon: const Icon(Icons.edit_note_outlined, color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                ],
                20.height,
                AnimatedCrossFade(
                  firstChild: const OtpSend(),
                  secondChild: OtpVerifyWidget(onSuccess: onSuccess, state: state),
                  crossFadeState:
                      state.verificationId.isNotEmpty || state.isLoading
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 300), // Increase the duration
                ),

                const Spacer(),

                ///  Sign In Instruction here
                const AlreadyAccountRichText(),
                85.height,
              ],
            );
          },
        ),
      ),
    ),
  );
}
