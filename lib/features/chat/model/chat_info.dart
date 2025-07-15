// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChatInfo {
  String chatId;
  String chatName;
  String status;
  String image;
  ChatInfo({
    required this.chatId,
    required this.chatName,
    required this.status,
    required this.image,
  });

  ChatInfo copyWith({
    String? chatId,
    String? chatName,
    String? status,
    String? image,
  }) {
    return ChatInfo(
      chatId: chatId ?? this.chatId,
      chatName: chatName ?? this.chatName,
      status: status ?? this.status,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'chatId': chatId,
      'chatName': chatName,
      'status': status,
      'image': image,
    };
  }

  factory ChatInfo.fromMap(Map<String, dynamic> map) {
    return ChatInfo(
      chatId: map['chatId'] as String,
      chatName: map['chatName'] as String,
      status: map['status'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatInfo.fromJson(String source) => ChatInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChatInfo(chatId: $chatId, chatName: $chatName, status: $status, image: $image)';
  }

  @override
  bool operator ==(covariant ChatInfo other) {
    if (identical(this, other)) return true;
  
    return 
      other.chatId == chatId &&
      other.chatName == chatName &&
      other.status == status &&
      other.image == image;
  }

  @override
  int get hashCode {
    return chatId.hashCode ^
      chatName.hashCode ^
      status.hashCode ^
      image.hashCode;
  }
}
