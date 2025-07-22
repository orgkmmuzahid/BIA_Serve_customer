// File: my_order_screen.dart
import 'package:bai_serve/common/app_bar/common_app_bar.dart';
import 'package:bai_serve/component/button/common_button.dart';
import 'package:bai_serve/component/common_bar/common_bottom_bar.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_rich_text.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/api/server_request.dart';
import 'package:bai_serve/features/home/model/order_list_model.dart';
import 'package:bai_serve/features/my_order/controllers/my_order_controller.dart';
import 'package:bai_serve/features/my_order/enum/order_filter_enum.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/constants/app_colors.dart';
import 'package:bai_serve/utils/constants/app_images.dart';
import 'package:bai_serve/utils/constants/app_string.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

// static const String myOrder = "/my_order_screen.dart";
// GetPage(name: myOrder, page: () => const MyOrderScreen()),

class MyOrderScreen extends StatelessWidget {
  MyOrderScreen({super.key})
    : orderListWidth = Utils.deviceSize.width - 32,
      orderlistImageWidth = (Utils.deviceSize.width - 32) / 3.2;

  //private constant fields.
  final double orderListWidth;
  final double orderlistImageWidth;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CommonAppBar(
      title: AppString.myOrder,
      leading: SizedBox(width: 0, height: 0),
    ),
    body: GetBuilder<MyOrderController>(
      builder: (myOrderController) {
        return Padding(
          padding: const EdgeInsetsGeometry.only(left: 16, right: 16),
          child: Column(
            children: [
              CommonTextField(
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: myOrderController.onSearch,
                ),
                hintText: AppString.searchForOrder,
                controller: myOrderController.searchController,
              ),
              10.height,
              _filters(myOrderController),
              10.height,
              if (myOrderController.orderList.data?.isNotEmpty == true)
                Expanded(child: ListView.builder(
                  itemCount: myOrderController.orderList.data?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (_,index)=> _orderListItem(myOrderController.orderList.data![index]))),
              if (myOrderController.orderList.requestStatus ==
                  RequestStatus.requesting)
                const Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        );
      },
    ),
    bottomNavigationBar: const CommonBottomNavBar(),
  );

  Widget _filters(MyOrderController controller) {
    // final double buttonWidth = ((Utils.deviceSize.width - 32) / 4) - 5;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:
            OrderFilterEnum.values
                .map(
                  (value) => Padding(
                    padding: const EdgeInsets.only(right: 5,),
                    child: GestureDetector(
                       onTap: () {
                          controller.onFilterOrderList(value);
                        },
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 90,
                        ),
                        child: CommonText(
                          text: value.displayName,
                          borderColor: AppColors.serfeceBG,
                          top: 10, bottom: 10, left: 10,right: 10,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          alignment: MainAxisAlignment.center,
                          backgroundColor:
                              controller.orderFilterEnum == value
                                  ? AppColors.lightRead
                                  : AppColors.cartBG,
                          color: AppColors.primaryText,
                          // buttonWidth: buttonWidth,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
      ),
    );
  }

  Widget _orderListItem(OrderListModel model) => SizedBox(
    width: orderListWidth,
    child: Card(
      elevation: .5,
      shadowColor:
          model.deliveryStatus == DeliveryStatus.cancel
              ? AppColors.lightRead
              : AppColors.cartBG2,
      color:
          model.deliveryStatus == DeliveryStatus.cancel
              ? AppColors.cartBG4
              : AppColors.cartBG2,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonImage(
              imageSrc: AppImages.appsIcon,
              size: orderlistImageWidth,
            ),
            10.width,
            CommonRichText(
              richTextContent: [
                CommonSimpleRichTextContent(
                  text: '#${model.orderNumber}\n',
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color:
                        model.deliveryStatus == DeliveryStatus.cancel
                            ? AppColors.error
                            : theme.primaryColor,
                  ),
                ),
                CommonSimpleRichTextContent(
                  text:
                      'Order Placed – ${Utils.formatDateTime(model.orderPlacedDate)}\n',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                CommonSimpleRichTextContent(
                  text:
                      'Parcel Picked Up – ${Utils.formatDateTime(model.percelPickedUp)}\n',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                CommonSimpleRichTextContent(
                  text:
                      'In Transit – ${Utils.formatDateTime(model.inTransition)}\n',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                CommonRichTextSpan(
                  textSpan: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Delivered – ',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),

                      TextSpan(
                        text: '${model.deliveryStatus.name}\n',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: const Color(0xffFFA500),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            if (model.deliveryStatus == DeliveryStatus.cancel ||
                model.deliveryStatus == DeliveryStatus.delivered)
              const Icon(Icons.more_vert),
          ],
        ),
      ),
    ),
  );
}
