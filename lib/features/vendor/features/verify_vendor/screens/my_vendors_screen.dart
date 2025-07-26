import 'package:auto_route/auto_route.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/config/route/app_router.dart';
import 'package:bai_serve/config/route/app_router.gr.dart';
import 'package:bai_serve/features/vendor/common_model/vendor_model.dart';
import 'package:bai_serve/features/vendor/common_widget/category_selector/category_model.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc.dart';
import 'package:bai_serve/features/vendor/features/verify_vendor/bloc/vendor_verification_bloc/vendor_list_bloc_event.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
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
          create: (_) => VendorListBloc(),
          child: BlocBuilder<VendorListBloc, VendorListBlocState>(
            builder: (context, state) {
              final bloc = context.read<VendorListBloc>();

              final vendors = state is VendorListLoadingSuccess ? state.vendors : [];

              return SmartListLoader(
                isLoading: state is VendorListLoading,
                onRefresh: () => bloc.add(VendorListFetched(categoryModel: CategoryModel(id: '', name: ''))),
                onLoadMore: () => bloc.add(VendorListLoadMoreRequested(categoryModel: CategoryModel(id: '', name: ''))),
                itemCount: vendors.length,
                itemBuilder: (_, index) {
                  return _itemBuilder(vendors[index]);
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
          child: Row(
            children: [
              CommonImage(imageSrc: data.image, size: 70, borderRadius: 70, fill: BoxFit.fill),
              10.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(text: data.name, style: getTheme.textTheme.titleMedium),
                  CommonText(text: '${AppString.vendorId}: ${data.id}', style: getTheme.textTheme.bodyMedium),
                  CommonText(
                    text: '${AppString.phoneNumber}: ${data.phoneNumber}',
                    style: getTheme.textTheme.bodyMedium,
                  ),
                  CommonText(text: '${AppString.address}: ${data.address}', style: getTheme.textTheme.bodyMedium),
                  CommonText(
                    text: '${AppString.VerifyApplyDate}: ${data.applyDate.date}',
                    style: getTheme.textTheme.bodyMedium,
                  ),
                ],
              ),
              10.width,
              CommonText(
                text: data.status.displayName,
                backgroundColor: isPending ? AppColors.primaryColor2 : AppColors.success,
                top: 5,
                bottom: 5,
                right: 10,
                left: 10,
                color: isPending ? AppColors.primaryText : AppColors.textWhite,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
