import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order extends Equatable {
  const Order({
    required this.orderId,
    required this.userId,
    required this.orderDate,
  });

  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'user_id')
  final String userId;
  @JsonKey(name: 'order_date')
  final DateTime orderDate;

  Order copyWith({
    String? orderId,
    String? userId,
    DateTime? orderDate,
  }) {
    return Order(
      orderId: orderId ?? this.orderId,
      userId: userId ?? this.userId,
      orderDate: orderDate ?? this.orderDate,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

  @override
  List<Object> get props => [orderId, userId, orderDate];
}
