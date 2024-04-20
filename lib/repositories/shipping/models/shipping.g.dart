// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
      shippingId: json['shipping_id'] as String,
      orderId: json['order_id'] as String,
      shippingAddress: json['shipping_address'] as String,
      shippingStatus:
          $enumDecode(_$ShippingStatusEnumMap, json['shipping_status']),
      shippingDate: DateTime.parse(json['shipping_date'] as String),
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'shipping_id': instance.shippingId,
      'order_id': instance.orderId,
      'shipping_address': instance.shippingAddress,
      'shipping_status': _$ShippingStatusEnumMap[instance.shippingStatus]!,
      'shipping_date': instance.shippingDate.toIso8601String(),
    };

const _$ShippingStatusEnumMap = {
  ShippingStatus.initial: 'initial',
  ShippingStatus.onWay: 'on_way',
  ShippingStatus.success: 'success',
  ShippingStatus.cancel: 'cancel',
  ShippingStatus.failure: 'failure',
};
