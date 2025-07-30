import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';

class VendorAvaterWidget extends StatelessWidget {
  const VendorAvaterWidget({
    required this.model,
    super.key,
    this.width = 70,
    this.height = 110,
    this.isFixedNameWidth = true,
    this.style,
  });

  final double width;
  final double height;
  final TextStyle? style;
  final VendorModel model;
  final bool isFixedNameWidth;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () {
      appRouter.push(VendorDetailsRoute(vendorModel: model));
    },
    child: SizedBox(
      width: isFixedNameWidth ? width : double.infinity,
      height: height + 10,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: CommonImage(
                  imageSrc: model.image,
                  size: width - 10,
                  borderRadius: width - 10,
                  fill: BoxFit.fill,
                ),
              ),
              if (model.status == VerificationStatus.verified) _buildVerifyStatus(borderRadious: width - 10),
            ],
          ),
          CommonText(
            alignment: MainAxisAlignment.center,
            text: model.name,
            style:
                style ??
                getTheme.textTheme.bodyMedium?.copyWith(color: AppColors.primaryText, fontWeight: FontWeight.bold),
            overflow: TextOverflow.visible,
          ),
        ],
      ),
    ),
  );

  Widget _buildVerifyStatus({required double borderRadious}) {
    return Container(
      height: 20,
      width: 20,
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.loyaltyPonitsBackground)),
        borderRadius: BorderRadius.all(Radius.circular(18)),
        boxShadow: [BoxShadow(color: AppColors.cartBG2, spreadRadius: 2)],
      ),
      child: const Icon(Icons.done, color: AppColors.iconColorWhite, size: 18),
    );
  }
}
