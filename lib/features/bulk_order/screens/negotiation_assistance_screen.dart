import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_multiline_text_field.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/bulk_order/controllers/bulk_order_controller.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final _formKey = GlobalKey<FormState>();

@RoutePage()
class NegotiationAssistanceScreen extends StatelessWidget {
  const NegotiationAssistanceScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(AppString.homeBulkOrderAgents)),
    body: Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            CommonText(
              text: AppString.negotiationAssistance,
              style: getTheme.textTheme.bodyLarge,
            ).start,
            const CommonText(
              text: AppString.negotiationAssistanceSubTitle,
            ).start,
            14.height,
            CommonMultilineTextField(
              initialText: Get.find<BulkOrderController>().negotiationMessage,
              height: 202,
              onSave: (value) {},
            ),
            23.height,
            CommonButton(
              titleText: AppString.messageRequest,
              onTap: () {
                _formKey.currentState?.save();
                appRouter.push(ChatRoute(action: _sentOrderButton()));
              },
            ),
          ],
        ),
      ),
    ),
  );

  GestureDetector _sentOrderButton() {
    return GestureDetector(
                    onTap: () {
                      appRouter.push(const BulkOrderDetailsRoute());
                    },
                    child: Container(
                      height: 25,
                      width: 100,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: getTheme.colorScheme.secondary,
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        AppString.sentOrder,
                        style: getTheme.textTheme.bodyLarge?.copyWith(
                          color: getTheme.colorScheme.onSecondary,
                        ),
                      ),
                    ),
                  );
  }
}
