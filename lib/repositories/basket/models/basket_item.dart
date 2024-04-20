import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basket_item.g.dart';

@JsonSerializable()
class BasketItem extends Equatable {
  const BasketItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });

  @JsonKey(name: 'product_id')
  final String productId;
  final int quantity;
  final int price;

  BasketItem copyWith({
    String? productId,
    int? quantity,
    int? price,
  }) {
    return BasketItem(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);

  Map<String, dynamic> toJson() => _$BasketItemToJson(this);

  @override
  List<Object> get props => [productId, quantity, price];
}
