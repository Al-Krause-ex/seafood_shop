// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      orderId: json['order_id'] as String,
      userId: json['user_id'] as String,
      orderDate: DateTime.parse(json['order_date'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'order_id': instance.orderId,
      'user_id': instance.userId,
      'order_date': instance.orderDate.toIso8601String(),
    };
