import 'package:bai_serve_customer/config/languages/l10n/app_localizations.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/theme/cubit/theme_cubit.dart';
import 'package:bai_serve_customer/config/theme/cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/languages/cubit/language_cubit.dart';
import 'config/languages/cubit/language_state.dart';

class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics(); // or ClampingScrollPhysics, etc.
  }

  @override
  ScrollViewKeyboardDismissBehavior getKeyboardDismissBehavior(BuildContext context) {
    return ScrollViewKeyboardDismissBehavior.onDrag;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      ensureScreenSize: true,
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812), // ✅ Use the size your UI was designed for
      // designSize: const Size(428, 926),
      builder:
          (context, child) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (_) => ThemeCubit()..update()),
              BlocProvider(create: (_) => LanguageCubit()..init()),
            ],
            child: BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, themeState) {
                return BlocBuilder<LanguageCubit, LanguageState>(
                  builder: (context, languageState) {
                    return MaterialApp.router(
                      scrollBehavior: CustomScrollBehavior(),
                      debugShowCheckedModeBanner: false,
                      routerConfig: appRouter.config(),
                      theme: themeState.themeData,
                      supportedLocales: const [
                        Locale('en'), // English
                        Locale('sw'), // Swahili (Tanzania)
                      ],
                      localizationsDelegates: const [
                        ...GlobalMaterialLocalizations.delegates,
                        GlobalWidgetsLocalizations.delegate,
                        // Localization delegate for auto-generated messages
                        AppLocalizations.delegate, // Initialize with the locale
                      ],

                      locale: languageState.locale,
                    );
                  },
                );
              },
            ),
          ),
    );
  }
}
