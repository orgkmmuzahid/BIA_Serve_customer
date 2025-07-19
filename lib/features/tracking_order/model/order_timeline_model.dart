// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderTimelineModel {
  DateTime time;
  bool isCleared;
  String title;
  String subtitle;
  OrderTimelineModel({
    required this.time,
    required this.isCleared,
    required this.title,
    required this.subtitle,
  });

  OrderTimelineModel copyWith({
    DateTime? time,
    bool? isCleared,
    String? title,
    String? subtitle,
  }) {
    return OrderTimelineModel(
      time: time ?? this.time,
      isCleared: isCleared ?? this.isCleared,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'time': time.millisecondsSinceEpoch,
      'isCleared': isCleared,
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory OrderTimelineModel.fromMap(Map<String, dynamic> map) {
    return OrderTimelineModel(
      time: DateTime.fromMillisecondsSinceEpoch(map['time'] as int),
      isCleared: map['isCleared'] as bool,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderTimelineModel.fromJson(String source) =>
      OrderTimelineModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrderTimelineModel(time: $time, isCleared: $isCleared, title: $title, subtitle: $subtitle)';
  }

  @override
  bool operator ==(covariant OrderTimelineModel other) {
    if (identical(this, other)) return true;

    return other.time == time &&
        other.isCleared == isCleared &&
        other.title == title &&
        other.subtitle == subtitle;
  }

  @override
  int get hashCode {
    return time.hashCode ^
        isCleared.hashCode ^
        title.hashCode ^
        subtitle.hashCode;
  }
}
