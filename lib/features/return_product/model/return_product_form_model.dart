// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ReturnProductFormModel {
  final String id;
  final String? type;
  final String? reason;
  final List<String> images;
  final String details;
  ReturnProductFormModel({required this.id, required this.images, required this.details, this.type, this.reason});

  ReturnProductFormModel copyWith({String? id, String? type, String? reason, List<String>? images, String? details}) {
    return ReturnProductFormModel(
      id: id ?? this.id,
      type: type ?? this.type,
      reason: reason ?? this.reason,
      images: images ?? this.images,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'type': type, 'reason': reason, 'details': details};
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ReturnProductFormModel(id: $id, type: $type, reason: $reason, images: $images, details: $details)';
  }

  @override
  bool operator ==(covariant ReturnProductFormModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.reason == reason &&
        listEquals(other.images, images) &&
        other.details == details;
  }

  @override
  int get hashCode {
    return id.hashCode ^ type.hashCode ^ reason.hashCode ^ images.hashCode ^ details.hashCode;
  }
}
