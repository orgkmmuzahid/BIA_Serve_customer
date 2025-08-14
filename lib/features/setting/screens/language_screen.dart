import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/config/languages/widgets/common_language_screen_content.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text(AppString.drawerLanguage), centerTitle: true),
    body: const CommonLanguageScreenContent(),
  );
}
