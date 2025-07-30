import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/theme/dark_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/theme/light_theme.dart';

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
          (context, child) => MaterialApp.router(
            scrollBehavior: CustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            routerConfig: appRouter.config(),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeMode.light,
          ),
    );
  }
}
