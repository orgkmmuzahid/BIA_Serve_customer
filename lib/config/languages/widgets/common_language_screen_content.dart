import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommonLanguageScreenContent extends StatelessWidget {
  const CommonLanguageScreenContent({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      CommonButton(
        buttonWidth: 287,
        titleText: Language.English.name,
        buttonColor: getTheme.scaffoldBackgroundColor,
        titleColor: getTheme.textTheme.bodyLarge!.color,
        borderColor: getTheme.colorScheme.outlineVariant,
        icon: const Padding(
          padding: EdgeInsetsGeometry.only(right: 17.9),
          child: CommonImage(imageSrc: AppImages.langEnglish, size: 24),
        ),
        onTap: () {
          _langugeUpdater(context, Language.English);
        },
      ).center,
      18.height,

      CommonButton(
        buttonWidth: 287,
        titleText: Language.Kiswahili.name,
        buttonColor: getTheme.scaffoldBackgroundColor,
        titleColor: getTheme.textTheme.bodyLarge!.color,
        borderColor: getTheme.colorScheme.outlineVariant,
        icon: const Padding(
          padding: EdgeInsetsGeometry.only(right: 17.9),
          child: CommonImage(imageSrc: AppImages.langSwahili, size: 24),
        ),
        onTap: () {
          _langugeUpdater(context, Language.Kiswahili);
        },
      ).center,
    ],
  );

  void _langugeUpdater(BuildContext context, Language language) {
    context.read<LanguageCubit>().changeLanguage(language);
    appRouter.pop();
  }
}
