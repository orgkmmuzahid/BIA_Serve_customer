import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc.dart';
import 'package:bai_serve_customer/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc_event.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_string.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class MyVendorScreen extends StatelessWidget {
  const MyVendorScreen({super.key});

  @override
  Widget build(_) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppString.myVendors), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocProvider(
          create:
              (_) =>
                  VendorListBloc()
                    ..add(const VendorListFetched(filters: [VerificationStatus.pending, VerificationStatus.verified])),
          child: BlocBuilder<VendorListBloc, VendorListBlocState>(
            builder: (context, state) {
              final bloc = context.read<VendorListBloc>();
              return SmartListLoader(
                isLoading: state.isLoading,
                onRefresh: () => bloc.add(VendorListFetched(filters: state.filters)),
                onLoadMore: () => bloc.add(const VendorListLoadMoreRequested()),
                itemCount: state.vendors.length,
                itemBuilder: (_, index) {
                  return _itemBuilder(state.vendors[index]);
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(VendorModel data) {
    final bool isPending = data.status == VerificationStatus.pending;
    return GestureDetector(
      onTap: () {
        if (isPending) {
          appRouter.push(const VerificationStatusRoute());
        } else {
          appRouter.push(VendorDetailsRoute(vendorModel: data));
        }
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(
            builder: (context, constrains) {
              return Row(
                children: [
                  CommonImage(imageSrc: data.image, size: 70, borderRadius: 70, fill: BoxFit.fill),
                  10.width,
                  SizedBox(
                    width: constrains.maxWidth * .5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(text: data.name, style: getTheme.textTheme.titleMedium),
                        CommonText(text: '${AppString.vendorId}: ${data.id}', style: getTheme.textTheme.bodyMedium),
                        CommonText(
                          text: '${AppString.phoneNumber}: ${data.phoneNumber}',
                          style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                        ),
                        CommonText(
                          text: '${AppString.address}: ${data.address}',
                          style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                        ),
                        CommonText(
                          alignment: MainAxisAlignment.start,
                          text: '${AppString.VerifyApplyDate}: ${data.applyDate.date}',
                          style: getTheme.textTheme.bodyMedium?.copyWith(overflow: TextOverflow.fade),
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  const Spacer(),
                  SizedBox(
                    width: 80,
                    child: CommonText(
                      fontSize: 10,
                      alignment: MainAxisAlignment.center,
                      text: data.status.displayName,
                      backgroundColor: isPending ? AppColors.primaryColor2 : AppColors.success,
                      top: 5,
                      bottom: 5,
                      color: isPending ? AppColors.primaryText : AppColors.textWhite,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
