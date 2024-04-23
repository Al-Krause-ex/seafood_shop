import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';

part 'basket_item.g.dart';

typedef WeightSuffix = (num, String);

@HiveType(typeId: 2)
@JsonSerializable()
class BasketItem extends Equatable {
  const BasketItem({
    required this.productId,
    required this.productName,
    required this.productImageUrl,
    required this.weight,
    required this.price,
  });

  @HiveField(0)
  @JsonKey(name: 'product_id')
  final String productId;

  @HiveField(1)
  @JsonKey(name: 'product_name')
  final String productName;

  @HiveField(2)
  @JsonKey(name: 'product_image_url')
  final String productImageUrl;

  @HiveField(3)
  final int weight;

  @HiveField(4)
  final int price;

  int get totalPrice => price * (weight ~/ 200);

  WeightSuffix getConvertedWeight() {
    if (weight < 1000) return (weight, 'гр');

    final weightKg = weight / 1000;
    if (weightKg < 1000) return (weightKg, 'кг');

    double weightTons = weightKg / 1000;
    return (weightTons, 'т');
  }

  BasketItem copyWith({
    String? productId,
    String? productName,
    String? productImageUrl,
    int? weight,
    int? price,
  }) {
    return BasketItem(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productImageUrl: productImageUrl ?? this.productImageUrl,
      weight: weight ?? this.weight,
      price: price ?? this.price,
    );
  }

  factory BasketItem.fromJson(Map<String, dynamic> json) =>
      _$BasketItemFromJson(json);

  Map<String, dynamic> toJson() => _$BasketItemToJson(this);

  factory BasketItem.createByProduct(Product product) {
    return BasketItem(
      productId: product.productId,
      productName: product.name,
      productImageUrl: product.avatar,
      weight: 200,
      price: product.price,
    );
  }

  @override
  List<Object> get props => [
        productId,
        productName,
        productImageUrl,
        weight,
        price,
      ];
}
