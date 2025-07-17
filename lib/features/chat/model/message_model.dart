// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum UserStatus{online, offline}
class MessageModel {
  String messageId;
  String userImage;
  String userName;
  //enum
  UserStatus userStatus;
  DateTime lastSendMessageTime;
  MessageModel({
    required this.messageId,
    required this.userImage,
    required this.userName,
    required this.userStatus,
    required this.lastSendMessageTime,
  });

  MessageModel copyWith({
    String? messageId,
    String? userImage,
    String? userName,
    UserStatus? userStatus,
    DateTime? lastSendMessageTime,
  }) {
    return MessageModel(
      messageId: messageId ?? this.messageId,
      userImage: userImage ?? this.userImage,
      userName: userName ?? this.userName,
      userStatus: userStatus ?? this.userStatus,
      lastSendMessageTime: lastSendMessageTime ?? this.lastSendMessageTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'userImage': userImage,
      'userName': userName,
      'userStatus': userStatus.index,
      'lastSendMessageTime': lastSendMessageTime.millisecondsSinceEpoch,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'] as String,
      userImage: map['userImage'] as String,
      userName: map['userName'] as String,
      userStatus: UserStatus.values[map['userStatus'] as int],
      lastSendMessageTime: DateTime.fromMillisecondsSinceEpoch(map['lastSendMessageTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) => MessageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'MessageModel(messageId: $messageId, userImage: $userImage, userName: $userName, userStatus: $userStatus, lastSendMessageTime: $lastSendMessageTime)';
  }

  @override
  bool operator ==(covariant MessageModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.messageId == messageId &&
      other.userImage == userImage &&
      other.userName == userName &&
      other.userStatus == userStatus &&
      other.lastSendMessageTime == lastSendMessageTime;
  }

  @override
  int get hashCode {
    return messageId.hashCode ^
      userImage.hashCode ^
      userName.hashCode ^
      userStatus.hashCode ^
      lastSendMessageTime.hashCode;
  }
}
