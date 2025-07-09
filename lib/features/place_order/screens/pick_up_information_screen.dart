import 'package:bai_serve/common/common_notification_appbar.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:flutter/material.dart';

class PickUpInformationScreen  extends StatelessWidget {
  const PickUpInformationScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonNotificationAppbar(title: AppString.placeOrder),
    body: Form(child: Column(children: [
      
    ],)),
  );
}