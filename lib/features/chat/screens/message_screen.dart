import 'package:auto_route/auto_route.dart';
import 'package:bai_serve_customer/common/app_bar/common_app_bar.dart';
import 'package:bai_serve_customer/component/image/common_image.dart';
import 'package:bai_serve_customer/component/pop_up/common_popup_menu.dart';
import 'package:bai_serve_customer/component/text/common_text.dart';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/route/app_router.gr.dart';
import 'package:bai_serve_customer/features/chat/controllers/chat_controller.dart';
import 'package:bai_serve_customer/features/chat/model/message_model.dart';
import 'package:bai_serve_customer/utils/app_utils.dart';
import 'package:bai_serve_customer/utils/constants/app_colors.dart';
import 'package:bai_serve_customer/config/languages/cubit/language_cubit.dart';
import 'package:bai_serve_customer/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: CommonAppBar(title: AppString.drawerMessage),
    body: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: GetBuilder<ChatController>(
        builder: (chatController) {
          return Column(
            children:
                chatController.chatPersons
                    .map(
                      (person) => GestureDetector(
                        onTap: () {
                          appRouter.push(ChatRoute());
                        },
                        child: Card(
                          color: AppColors.serfeceBG,
                          child: _chatItem(person),
                        ),
                      ),
                    )
                    .toList(),
          );
        },
      ),
    ),
  );

  Widget _chatItem(MessageModel person) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          CommonImage(
            imageSrc: person.userImage,
            fill: BoxFit.fill,
            size: 30,
            borderRadius: 30,
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: person.userName,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
              CommonText(
                text: person.userStatus.displayName,
                fontSize: 10,
                color: AppColors.primaryText,
              ),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonPopupMenu(
                showTextTrigger: false,
                showIconTrigger: true,
                items: [AppString.deleteUser, AppString.blockUser],
                icons: const [Icons.delete_outline, Icons.block_outlined],
                onItemSelected: (value) {
                  if (value == AppString.deleteUser) {
                    //delete user
                  } else if (value == AppString.blockUser) {
                    //block user
                  }
                },
              ),
              CommonText(
                text: Utils.formatTime(person.lastSendMessageTime),
                color: AppColors.disable,
                right: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
