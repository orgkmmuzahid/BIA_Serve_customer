// ignore_for_file: public_member_api_docs, sort_constructors_first
// File: chat_model.dart

import 'dart:convert';

import 'package:bai_serve/features/chat/model/chat_user_info.dart';

enum ChatType { message, image, callSuccess, callFailed }

class ChatModel {
  String chatId;
  //enum
  ChatType chatType;
  String content;
  ChatUserInfo userInfo;
  DateTime createdAt;
  ChatModel({
    required this.chatId,
    required this.chatType,
    required this.content,
    required this.userInfo,
    required this.createdAt,
  });

  ChatModel copyWith({
    String? chatId,
    ChatType? chatType,
    String? content,
    ChatUserInfo? userInfo,
    DateTime? createdAt,
  }) {
    return ChatModel(
      chatId: chatId ?? this.chatId,
      chatType: chatType ?? this.chatType,
      content: content ?? this.content,
      userInfo: userInfo ?? this.userInfo,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
      'chatType': chatType.index,
      'content': content,
      'userInfo': userInfo.toMap(),
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      chatId: map['chatId'] as String,
      chatType: ChatType.values[map['chatType'] as int],
      content: map['content'] as String,
      userInfo: ChatUserInfo.fromMap(map['userInfo'] as Map<String, dynamic>),
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatModel(chatId: $chatId, chatType: $chatType, content: $content, userInfo: $userInfo, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;

    return other.chatId == chatId &&
        other.chatType == chatType &&
        other.content == content &&
        other.userInfo == userInfo &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
        chatType.hashCode ^
        content.hashCode ^
        userInfo.hashCode ^
        createdAt.hashCode;
  }
}
