import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/dual_field_row_widget.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/model/vendor_verification_details_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/vendor_verification_details_cubit/vendor_verification_details_cubit.dart';

@RoutePage()
class VerificationStatusScreen extends StatelessWidget {
  const VerificationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.verificationStatus),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: BlocProvider(
        create: (context) => VendorVerificationDetailsCubit()..fetch(id: ''),
        child: BlocBuilder<VendorVerificationDetailsCubit, VendorVerificationDetailsState>(
          builder: (context, state) {
            if (state is VendorVerificationLoding) {
              return const CircularProgressIndicator().center;
            } else if (state is VendorVerificationLodingSuccess) {
              return _details(state.vendorVerificationDetails);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    ),
  );

  Column _details(VendorVerificationDetailsModel model) {
    final imageWidth = ((Utils.deviceSize.width - 32) / 3) - 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DualFieldRow(
          left: CommonText(text: '${AppString.vendorName}:', style: getTheme.textTheme.titleMedium),
          right: CommonText(text: model.vendorName),
          enableSpacer: false,
        ),
        DualFieldRow(
          enableSpacer: false,
          left: CommonText(text: '${AppString.phoneNumber}:', style: getTheme.textTheme.titleMedium),
          right: CommonText(text: model.phoneNumber),
        ),
        DualFieldRow(
          enableSpacer: false,
          left: CommonText(text: '${AppString.vendorLocation}:', style: getTheme.textTheme.titleMedium),
          right: CommonText(text: model.venodorLocation),
        ),
        CommonText(text: AppString.uplaodScreenshot, style: getTheme.textTheme.titleMedium, bottom: 10),
        Wrap(
          spacing: 10,
          children:
              model.images
                  .map(
                    (url) => CommonImage(
                      imageSrc: url,
                      width: imageWidth,
                      height: imageWidth * 1.5,
                      borderRadius: 4,
                      fill: BoxFit.fill,
                    ),
                  )
                  .toList(),
        ),
        10.height,

        DualFieldRow(
          enableSpacer: false,
          left: SizedBox(
            width: 140,
            child: CommonText(
              text: '${AppString.verificationFee}:',
              style: getTheme.textTheme.titleMedium?.copyWith(overflow: TextOverflow.fade),
            ),
          ),
          right: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: CommonText(
              text: '${AppString.monySign} ${model.verifciationFee}',
              enableBorder: true,
              left: 10,
              top: 5,
              bottom: 5,
            ),
          ),
        ),

        DualFieldRow(
          enableSpacer: false,
          left: SizedBox(
            width: 140,
            child: CommonText(
              text: '${AppString.verificationStatus}:',
              style: getTheme.textTheme.titleMedium?.copyWith(overflow: TextOverflow.fade),
            ),
          ),
          right: Padding(
            padding: const EdgeInsets.only(right: 50),
            child: CommonText(
              text: model.verificationStatus.displayName,
              enableBorder: true,
              left: 10,
              top: 5,
              bottom: 5,
            ),
          ),
        ),
      ],
    );
  }
}
