import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/cubit/vendor_proof_cubit.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/cubit/vendor_proof_state.dart';
import 'package:bai_serve/features/vendor/features/vendor_details/model/vendor_proof_model.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class VendorProofScreen extends StatelessWidget {
  const VendorProofScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(title: AppString.vendorProof),
    body: Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 16),
      child: BlocProvider(
        create: (_) => VendorProofCubit()..fetch(),
        child: BlocBuilder<VendorProofCubit, VendorProofState>(
          builder: (context, state) {
            final cubit = context.read<VendorProofCubit>();
            final imageWidth = ((Utils.deviceSize.width - 32) / 3) - 15;
            return SmartListLoader(
              isLoading: state.isLoading,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.fetch,
              itemCount: state.vendorProofs?.length ?? 0,
              itemBuilder:
                  (context, index) => Column(
                    children: [
                      10.height,
                      CommonText(
                        text: '${AppString.vendor} ${index + 1}',
                        style: getTheme.textTheme.titleMedium?.copyWith(color: AppColors.primaryColor, fontSize: 21),
                      ),
                      10.height,
                      _buildItem(state.vendorProofs![index], imageWidth),
                    ],
                  ),
            );
          },
        ),
      ),
    ),
  );

  Widget _buildItem(VendorProofModel model, double imageWidth) => Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap:
                () => appRouter.push(
                  VendorDetailsRoute(
                    vendorModel: VendorModel(
                      name: model.name,
                      id: model.vendorId,
                      address: '',
                      applyDate: DateTime.now(),
                      phoneNumber: model.phone,
                      status: model.status,
                      image: model.profileImage,
                    ),
                  ),
                ),
            child: _profile(model),
          ),
          10.height,
          Container(height: 2, margin: const EdgeInsets.only(left: 10, right: 10), color: AppColors.stock2),
          CommonText(top: 10, bottom: 5, text: AppString.adminProof, style: getTheme.textTheme.titleMedium),

          Wrap(
            spacing: 10,
            children: [
              ...model.proofImages.map(
                (value) => CommonImage(
                  imageSrc: value,
                  width: imageWidth,
                  height: imageWidth * 1.4,
                  fill: BoxFit.cover,
                  borderRadius: 5,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );

  Widget _profile(VendorProofModel model) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(imageSrc: model.profileImage, size: 80, borderRadius: 80, fill: BoxFit.fill),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: model.name, style: getTheme.textTheme.titleMedium),
                CommonText(text: '${AppString.phoneNumber}: ${model.phone}', color: AppColors.primaryColor),
                CommonText(text: '${AppString.vendorId}: ${model.vendorId}', color: AppColors.primaryColor),
                CommonText(text: '${AppString.status}: ${model.status.displayName}', color: AppColors.primaryColor),
              ],
            ),
          ],
        ),
        10.height,
        CommonRichText(
          richTextContent: [
            CommonSimpleRichTextContent(
              text: '${AppString.profileLink}: ',
              style: getTheme.textTheme.titleSmall?.copyWith(color: AppColors.success),
            ),
            CommonSimpleRichTextContent(
              text: model.prifileLink,
              style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
            ),
          ],
        ),
      ],
    );
  }
}
