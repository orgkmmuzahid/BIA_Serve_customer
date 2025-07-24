// File: chat_screen.dart
import 'dart:io';

import 'package:bai_serve/common/common_language_drop_down.dart';
import 'package:bai_serve/component/image/common_image.dart';
import 'package:bai_serve/component/text/common_text.dart';
import 'package:bai_serve/component/text_field/common_text_field.dart';
import 'package:bai_serve/config/route/app_routes.dart';
import 'package:bai_serve/config/storage/storage_service.dart';
import 'package:bai_serve/features/chat/controllers/chat_controller.dart';
import 'package:bai_serve/features/chat/model/chat_model.dart';
import 'package:bai_serve/features/home/controller/home_controller.dart';
import 'package:bai_serve/utils/app_utils.dart';
import 'package:bai_serve/utils/extensions/extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// static const String chat = "/chat_screen.dart";
// GetPage(name: chat, page: () => const ChatScreen()),

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key})
    : action = getArgument(name: 'action'),
      chatIemWidth = (Utils.deviceSize.width - 32) * .7;
  final Widget? action;
  final double chatIemWidth;

  @override
  Widget build(BuildContext context) => GetBuilder<ChatController>(
    builder: (chatController) {
      return Scaffold(
        appBar: _appBar(chatController),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  reverse: true,
                  child: Column(
                    children: chatController.chats.map(_chatItem).toList(),
                  ),
                ),
              ),
              SizedBox(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            color: getTheme.colorScheme.onSecondary,
                            child: _inputField(chatController),
                          ),
                        ),
                        10.width,
                        GestureDetector(
                          onTap: chatController.onSend,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: getTheme.colorScheme.onSecondary,
                            ),
                            child: Icon(
                              Icons.send,
                              color: getTheme.textTheme.bodyLarge?.color,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  Widget _inputField(ChatController chatController) {
    return chatController.selectedImagesPath != null
        ? Stack(
          children: [
            Image.file(height: 150, File(chatController.selectedImagesPath!)),
            Positioned(
              left: 5,
              child: IconButton(
                onPressed: chatController.onCancelImage,
                icon: const Icon(Icons.cancel_outlined, size: 30),
              ),
            ),
          ],
        )
        : CommonTextField(
          controller: chatController.inputMessageTextFiled,
          prefixIcon: GestureDetector(
            onTap: chatController.pickImage,
            child: const Icon(Icons.attach_file),
          ),
          borderColor: getTheme.colorScheme.onSecondary,
        );
  }

  Widget _chatItem(ChatModel model) {
    final bool isMe = model.userInfo.userId == Get.find<StorageService>().userLoginInfoModel.id;
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child:
          model.chatType == ChatType.image
              ? SizedBox(
                width: chatIemWidth,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CommonImage(imageSrc: model.content),
                      CommonText(
                        text: Utils.formatDateTime(model.createdAt),
                      ).end,
                    ],
                  ),
                ),
              )
              : Card(
                color:
                    isMe
                        ? getTheme.colorScheme.outlineVariant
                        : getTheme.dividerColor.withAlpha(20),
                child: SizedBox(
                  width: chatIemWidth,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        if (model.chatType == ChatType.message)
                          Text(model.content),
                        if (model.chatType == ChatType.callFailed)
                          Row(
                            children: [
                              Icon(
                                Icons.call_missed_rounded,
                                color:
                                    isMe
                                        ? getTheme.textTheme.bodySmall?.color
                                        : getTheme.colorScheme.error,
                              ),
                              CommonText(
                                text: 'Voice Call',
                                color:
                                    isMe
                                        ? getTheme.textTheme.bodySmall?.color
                                        : getTheme.colorScheme.error,
                              ),
                            ],
                          ),
                        if (model.chatType == ChatType.callSuccess)
                          Row(
                            children: [
                              Icon(
                                isMe ? Icons.call_made : Icons.call_received,
                              ),
                              const CommonText(text: 'Voice Call'),
                            ],
                          ),
                        CommonText(
                          text: Utils.formatDateTime(model.createdAt),
                        ).end,
                      ],
                    ),
                  ),
                ),
              ),
    );
  }

  AppBar _appBar(ChatController chatController) {
    return AppBar(
      backgroundColor: getTheme.colorScheme.outlineVariant,
      title: Row(
        children: [
          CommonImage(
            imageSrc: chatController.chatInfo.image,
            size: 29,
            borderRadius: 29,
            fill: BoxFit.fill,
          ),
          10.width,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonText(
                text: chatController.chatInfo.chatName,
                style: getTheme.textTheme.titleSmall,
              ),
              CommonText(text: chatController.chatInfo.status),
            ],
          ),
        ],
      ),
      leadingWidth: 40,
      leading: GestureDetector(
        onTap: Get.back,
        child: const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      actionsPadding: const EdgeInsets.only(right: 10),
      titleSpacing: 0,
      actions: [
        action != null
            ? action!
            : GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.calling);
              },
              child: Icon(
                Icons.call_rounded,
                color: getTheme.primaryColor,
                size: 27,
              ),
            ).paddingOnly(right: 10),
        GetBuilder<HomeController>(
          builder:
              (homeController) => CommonLanguageDropDown(
                slectedCountry: homeController.selectedCountry,
                availableCountries: homeController.availableCountries,
                onCountryChange: homeController.onCountryChange,
              ),
        ),
      ],
    );
  }
}
