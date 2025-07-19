// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoyaltyOfferModel {
  String title;
  int rewardPoints;
  LoyaltyOfferModel({required this.title, required this.rewardPoints});

  LoyaltyOfferModel copyWith({String? title, int? rewardPoints}) {
    return LoyaltyOfferModel(
      title: title ?? this.title,
      rewardPoints: rewardPoints ?? this.rewardPoints,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'title': title, 'rewardPoints': rewardPoints};
  }

  factory LoyaltyOfferModel.fromMap(Map<String, dynamic> map) {
    return LoyaltyOfferModel(
      title: map['title'] as String,
      rewardPoints: map['rewardPoints'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoyaltyOfferModel.fromJson(String source) =>
      LoyaltyOfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoyaltyOfferModel(title: $title, rewardPoints: $rewardPoints)';

  @override
  bool operator ==(covariant LoyaltyOfferModel other) {
    if (identical(this, other)) return true;

    return other.title == title && other.rewardPoints == rewardPoints;
  }

  @override
  int get hashCode => title.hashCode ^ rewardPoints.hashCode;
}
