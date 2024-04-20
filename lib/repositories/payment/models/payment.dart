import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment.g.dart';

enum PaymentStatus {
  @JsonValue("initial")
  initial,
  @JsonValue("pending")
  pending,
  @JsonValue("success")
  success,
  @JsonValue("cancel")
  cancel,
  @JsonValue("failure")
  failure,
}

@JsonSerializable()
class Payment extends Equatable {
  const Payment({
    required this.paymentId,
    required this.orderId,
    required this.userId,
    required this.amount,
    required this.paymentDate,
    required this.paymentStatus,
  });

  @JsonKey(name: 'payment_id')
  final String paymentId;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'user_id')
  final String userId;
  final int amount;
  @JsonKey(name: 'payment_date')
  final DateTime paymentDate;
  @JsonKey(name: 'payment_status')
  final PaymentStatus paymentStatus;

  Payment copyWith({
    String? paymentId,
    String? orderId,
    String? userId,
    int? amount,
    DateTime? paymentDate,
    PaymentStatus? paymentStatus,
  }) {
    return Payment(
      paymentId: paymentId ?? this.paymentId,
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      paymentDate: paymentDate ?? this.paymentDate,
      paymentStatus: paymentStatus ?? this.paymentStatus,
    );
  }

  factory Payment.fromJson(Map<String, dynamic> json) =>
      _$PaymentFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentToJson(this);

  @override
  List<Object> get props {
    return [
      paymentId,
      orderId,
      userId,
      amount,
      paymentDate,
      paymentStatus,
    ];
  }
}
