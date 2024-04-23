import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';

part 'basket.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Basket extends Equatable {
  const Basket({
    required this.items,
  });

  @HiveField(0)
  final List<BasketItem> items;

  int getTotalPrice() {
    int total = 0;

    for (var item in items) {
      total += (item.price * item.weight ~/ 200);
    }

    return total;
  }

  Basket copyWith({
    List<BasketItem>? items,
  }) {
    return Basket(
      items: items ?? this.items,
    );
  }

  factory Basket.empty() => const Basket(items: []);

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);

  Map<String, dynamic> toJson() => _$BasketToJson(this);

  Basket addBasketItem(BasketItem basketItem) {
    var updatedItems = List<BasketItem>.from(items);
    var isFound = false;

    for (var i = 0; i < updatedItems.length; i++) {
      if (updatedItems[i].productId == basketItem.productId) {
        final newQuantity = updatedItems[i].weight + basketItem.weight;
        updatedItems[i] = updatedItems[i].copyWith(weight: newQuantity);
        isFound = true;
        break;
      }
    }

    if (!isFound) updatedItems.add(basketItem);

    return copyWith(items: updatedItems);
  }

  Basket removeBasketItem(BasketItem basketItem) {
    var updatedItems = List<BasketItem>.from(items);

    final indexItem =
        updatedItems.indexWhere((e) => e.productId == basketItem.productId);

    if (updatedItems[indexItem].weight > 200) {
      updatedItems[indexItem] = updatedItems[indexItem]
          .copyWith(weight: updatedItems[indexItem].weight - 200);
    } else {
      updatedItems.removeAt(indexItem);
    }

    return copyWith(items: updatedItems);
  }

  @override
  List<Object> get props => [items];
}
