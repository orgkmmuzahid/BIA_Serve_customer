import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      const Scaffold(appBar: CommonAppBar(title: AppString.privacyPolicy));
}
