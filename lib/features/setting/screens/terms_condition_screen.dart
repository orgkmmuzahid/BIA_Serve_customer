import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:flutter/material.dart';


@RoutePage()
class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(appBar: CommonAppBar(title: AppString.termsCondition));
}
