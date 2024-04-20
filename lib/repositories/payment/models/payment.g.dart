// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Payment _$PaymentFromJson(Map<String, dynamic> json) => Payment(
      paymentId: json['payment_id'] as String,
      orderId: json['order_id'] as String,
      userId: json['user_id'] as String,
      amount: json['amount'] as int,
      paymentDate: DateTime.parse(json['payment_date'] as String),
      paymentStatus:
          $enumDecode(_$PaymentStatusEnumMap, json['payment_status']),
    );

Map<String, dynamic> _$PaymentToJson(Payment instance) => <String, dynamic>{
      'payment_id': instance.paymentId,
      'order_id': instance.orderId,
      'user_id': instance.userId,
      'amount': instance.amount,
      'payment_date': instance.paymentDate.toIso8601String(),
      'payment_status': _$PaymentStatusEnumMap[instance.paymentStatus]!,
    };

const _$PaymentStatusEnumMap = {
  PaymentStatus.initial: 'initial',
  PaymentStatus.pending: 'pending',
  PaymentStatus.success: 'success',
  PaymentStatus.cancel: 'cancel',
  PaymentStatus.failure: 'failure',
};
