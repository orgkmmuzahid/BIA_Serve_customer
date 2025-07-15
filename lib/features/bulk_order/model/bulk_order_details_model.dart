// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BulkOrderDetailsModel {
  double totalAmount;
  double discountedAmount;
  double totalPayable;
  BulkOrderDetailsModel({
    required this.totalAmount,
    required this.discountedAmount,
    required this.totalPayable,
  });

  BulkOrderDetailsModel copyWith({
    double? totalAmount,
    double? discountedAmount,
    double? totalPayable,
  }) {
    return BulkOrderDetailsModel(
      totalAmount: totalAmount ?? this.totalAmount,
      discountedAmount: discountedAmount ?? this.discountedAmount,
      totalPayable: totalPayable ?? this.totalPayable,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalAmount': totalAmount,
      'discountedAmount': discountedAmount,
      'totalPayable': totalPayable,
    };
  }

  factory BulkOrderDetailsModel.fromMap(Map<String, dynamic> map) {
    return BulkOrderDetailsModel(
      totalAmount: map['totalAmount'] as double,
      discountedAmount: map['discountedAmount'] as double,
      totalPayable: map['totalPayable'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory BulkOrderDetailsModel.fromJson(String source) => BulkOrderDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BulkOrderDetailsModel(totalAmount: $totalAmount, discountedAmount: $discountedAmount, totalPayable: $totalPayable)';

  @override
  bool operator ==(covariant BulkOrderDetailsModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.totalAmount == totalAmount &&
      other.discountedAmount == discountedAmount &&
      other.totalPayable == totalPayable;
  }

  @override
  int get hashCode => totalAmount.hashCode ^ discountedAmount.hashCode ^ totalPayable.hashCode;
}
