import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping.g.dart';

enum ShippingStatus {
  @JsonValue("initial")
  initial,
  @JsonValue("on_way")
  onWay,
  @JsonValue("success")
  success,
  @JsonValue("cancel")
  cancel,
  @JsonValue("failure")
  failure,
}

@JsonSerializable()
class Shipping extends Equatable {
  const Shipping({
    required this.shippingId,
    required this.orderId,
    required this.shippingAddress,
    required this.shippingStatus,
    required this.shippingDate,
  });

  @JsonKey(name: 'shipping_id')
  final String shippingId;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'shipping_address')
  final String shippingAddress;
  @JsonKey(name: 'shipping_status')
  final ShippingStatus shippingStatus;
  @JsonKey(name: 'shipping_date')
  final DateTime shippingDate;

  Shipping copyWith({
    String? shippingId,
    String? orderId,
    String? shippingAddress,
    ShippingStatus? shippingStatus,
    DateTime? shippingDate,
  }) {
    return Shipping(
      shippingId: shippingId ?? this.shippingId,
      orderId: orderId ?? this.orderId,
      shippingAddress: shippingAddress ?? this.shippingAddress,
      shippingStatus: shippingStatus ?? this.shippingStatus,
      shippingDate: shippingDate ?? this.shippingDate,
    );
  }

  factory Shipping.fromJson(Map<String, dynamic> json) =>
      _$ShippingFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingToJson(this);

  @override
  List<Object> get props {
    return [
      shippingId,
      orderId,
      shippingAddress,
      shippingStatus,
      shippingDate,
    ];
  }
}
