import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/auth/widgets/common_logo.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/app_images.dart';
import '../../../../utils/extensions/extension.dart';
import '../../component/button/common_button.dart';
import '../../component/image/common_image.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: Column(
          children: [
            180.height,
            const Center(child: CommonLogo()),
            50.height,
            CommonText(
              alignment: MainAxisAlignment.center,
              text: AppString.selectYourLanguage,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
            10.height,
            CommonButton(
              titleText: Language.English.name,
              buttonColor: getTheme.scaffoldBackgroundColor,
              titleColor: getTheme.textTheme.bodyLarge!.color,
              borderColor: getTheme.colorScheme.outlineVariant,
              icon: const Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langEnglish, size: 24),
              ),
              onTap: () => routeNext(Language.English),

            ),
            18.height,

            CommonButton(
              titleText: Language.Kiswahili.name,
              buttonColor: getTheme.scaffoldBackgroundColor,
              titleColor: getTheme.textTheme.bodyLarge!.color,
              borderColor: getTheme.colorScheme.outlineVariant,
              onTap: () => routeNext(Language.Kiswahili),
              icon: const Padding(
                padding: EdgeInsetsGeometry.only(right: 17.9),
                child: CommonImage(imageSrc: AppImages.langSwahili, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void routeNext(Language language) async {
    appRouter.navigatorKey.currentContext?.read<LanguageCubit>().changeLanguage(language);
    appRouter.push(const LoginOptionsRoute());
  }
}
