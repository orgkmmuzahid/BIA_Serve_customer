// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

enum TransactionType { cashIn, CashOut }

class PaymentHistoryModel {
  final String id;
  final String image;
  final double amount;
  //enum
  final TransactionType transactionType;
  final DateTime transactionTime;
  PaymentHistoryModel({
    required this.id,
    required this.image,
    required this.amount,
    required this.transactionType,
    required this.transactionTime,
  });

  PaymentHistoryModel copyWith({
    String? id,
    String? image,
    double? amount,
    TransactionType? transactionType,
    DateTime? transactionTime,
  }) {
    return PaymentHistoryModel(
      id: id ?? this.id,
      image: image ?? this.image,
      amount: amount ?? this.amount,
      transactionType: transactionType ?? this.transactionType,
      transactionTime: transactionTime ?? this.transactionTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
      'amount': amount,
      'transactionType': transactionType.index,
      'transactionTime': transactionTime.millisecondsSinceEpoch,
    };
  }

  factory PaymentHistoryModel.fromMap(Map<String, dynamic> map) {
    return PaymentHistoryModel(
      id: map['id'] as String,
      image: map['image'] as String,
      amount: map['amount'] as double,
      transactionType: TransactionType.values[map['transactionType'] as int],
      transactionTime: DateTime.fromMillisecondsSinceEpoch(map['transactionTime'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentHistoryModel.fromJson(String source) =>
      PaymentHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentHistoryModel(id: $id, image: $image, amount: $amount, transactionType: $transactionType, transactionTime: $transactionTime)';
  }

  @override
  bool operator ==(covariant PaymentHistoryModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.image == image &&
        other.amount == amount &&
        other.transactionType == transactionType &&
        other.transactionTime == transactionTime;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        image.hashCode ^
        amount.hashCode ^
        transactionType.hashCode ^
        transactionTime.hashCode;
  }
}
