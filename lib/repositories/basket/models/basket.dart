import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';

part 'basket.g.dart';

@JsonSerializable()
class Basket extends Equatable {
  const Basket({
    required this.items,
  });

  final List<BasketItem> items;

  int getTotalPrice() {
    int total = 0;

    for (var item in items) {
      total += (item.price * item.quantity);
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

  factory Basket.fromJson(Map<String, dynamic> json) => _$BasketFromJson(json);
  Map<String, dynamic> toJson() => _$BasketToJson(this);

  @override
  List<Object> get props => [items];
}
