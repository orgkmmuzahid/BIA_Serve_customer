import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/button/common_button.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/other_widgets/smart_list_loader.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/payment/cubit/payment_history_cubit.dart';
import 'package:bai_serve_customer/payment/model/payment_history_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class MyPaymentScreen extends StatelessWidget {
  const MyPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.myPayment, actions: [

      ],
    ),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: [
          10.height,
          Container(
            decoration: BoxDecoration(
              color: AppColors.cartBG5,
              border: BoxBorder.all(width: 1.2.w, color: AppColors.primaryColor),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: SizedBox(
              height: 130,
              child: Row(
                children: [
                  15.width,
                  const CommonImage(imageSrc: AppImages.money, width: 100, height: 100),
                  30.width,
                  CommonText(
                    text: '${AppString.monySign} 3500',
                    style: getTheme.textTheme.bodyLarge?.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),

          10.height,

          CommonButton(
            icon: const Icon(Icons.monetization_on, color: AppColors.iconColorWhite),
            titleText: AppString.withdraw,
            buttonWidth: 180,
          ).center,
          CommonText(
            top: 10,
            bottom: 10,
            text: AppString.paymentHistory,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ).start,
          Expanded(
            child: BlocProvider(
              create: (context) => PaymentHistoryCubit()..fetch(),
              child: BlocBuilder<PaymentHistoryCubit, PaymentHistoryState>(
                builder: (context, state) {
                  final cubit = context.read<PaymentHistoryCubit>();
                  return SmartListLoader(
                    itemCount: state.paymentHistory?.length ?? 0,
                    onRefresh: cubit.fetch,
                    onLoadMore: cubit.loadMore,
                    isLoading: state.isLoading,
                    itemBuilder: (context, index) => _paymentItem(state.paymentHistory![index]),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );

  Widget _paymentItem(PaymentHistoryModel model) {
    final bool isCashIn = model.transactionType == TransactionType.cashIn;
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.disable, // You can set the desired color here
            width: 0.5.w, // Adjust the thickness as needed
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            CommonImage(imageSrc: model.image, size: 40, borderRadius: 4),
            10.width,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(text: model.id, fontWeight: FontWeight.bold),
                CommonText(
                  text: '${isCashIn ? '' : '-'}${AppString.monySign} ${model.amount}',
                  fontWeight: FontWeight.bold,
                  color: isCashIn ? AppColors.primaryColor : AppColors.warning,
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CommonText(
                  text: model.transactionType.displayName,
                  fontWeight: FontWeight.bold,
                  color: isCashIn ? AppColors.success : AppColors.warning,
                ),
                CommonText(text: Utils.formatDateTime(model.transactionTime)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
