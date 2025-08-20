// File: chat_controller.dart

import 'package:bai_serve_customer/features/chat/model/chat_info.dart';
import 'package:bai_serve_customer/features/chat/model/chat_model.dart';
import 'package:bai_serve_customer/features/chat/model/chat_user_info.dart';
import 'package:bai_serve_customer/features/chat/model/message_model.dart';
import 'package:bai_serve_customer/utils/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Get.lazyPut(() => ChatController(), fenix: true);

class ChatController extends GetxController {

  final ImagePicker _picker = ImagePicker();

  List<MessageModel> chatPersons = [
    MessageModel(
      messageId: 'messageId',
      userImage: AppImages.homeBanner,
      userStatus: UserStatus.offline,
      lastSendMessageTime: DateTime.now(),
      userName: 'Cameron Williamson',
    ),
    MessageModel(
      messageId: 'messageId',
      userImage: AppImages.homeBanner,
      userStatus: UserStatus.offline,
      lastSendMessageTime: DateTime.now(),
      userName: 'Cameron Williamson',
    ),
    MessageModel(
      messageId: 'messageId',
      userImage: AppImages.homeBanner,
      userStatus: UserStatus.offline,
      lastSendMessageTime: DateTime.now(),
      userName: 'Cameron Williamson',
    ),
  ];

  String? selectedImagesPath;

  ChatInfo chatInfo = ChatInfo(
    chatId: 'chatId',
    chatName: 'Cameron Williamson',
    image: AppImages.loyaltyPonitsBackground,
    status: 'Online',
  );

  List<ChatModel> chats = [
    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.message,
      content:
          'Hello! I’m interested in the navy blue two-piece suit you posted. Is it still available in size 52?',
      userInfo: ChatUserInfo(
        userId: 'userId',
        name: 'Cameron Williamson',
        image: AppImages.loyaltyPonitsBackground,
      ),
      createdAt: DateTime.now(),
    ),

    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.message,
      content:
          'Hello! Yes, it’s still available. We have size 52 in stock and ready for delivery.',
      userInfo: ChatUserInfo(userId: '', name: '', image: AppImages.airtel),
      createdAt: DateTime.now(),
    ),

    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.image,
      content: AppImages.homeBanner,
      userInfo: ChatUserInfo(userId: '', name: '', image: AppImages.airtel),
      createdAt: DateTime.now(),
    ),

    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.image,
      content: AppImages.homeBanner,
      userInfo: ChatUserInfo(
        userId: 'userId',
        name: '',
        image: AppImages.loyaltyPonitsBackground,
      ),
      createdAt: DateTime.now(),
    ),

    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.callFailed,
      content: '',
      userInfo: ChatUserInfo(userId: '', name: '', image: AppImages.airtel),
      createdAt: DateTime.now(),
    ),

    ChatModel(
      chatId: 'chatId',
      chatType: ChatType.callSuccess,
      content: '',
      userInfo: ChatUserInfo(
        userId: 'userId',
        name: '',
        image: AppImages.loyaltyPonitsBackground,
      ),
      createdAt: DateTime.now(),
    ),
  ];

  Future<void> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      // imageQuality: 85, // reduce size if needed
    );
    if (pickedFile != null) {
      selectedImagesPath = pickedFile.path;
      update();
    }
  }

  void onCancelImage() {
    selectedImagesPath = null;
    update();
  }

  void onSend(String text) {
    if (selectedImagesPath != null) {
      //send image api
      selectedImagesPath = null;
      update();
      return;
    }

  }

}
