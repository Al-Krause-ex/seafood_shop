import 'package:hive_flutter/hive_flutter.dart';
import 'package:seafood_shop/core/constants/constants.dart';
import 'package:seafood_shop/repositories/basket/basket.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';

class BasketHiveRepository implements BasketRepositoryInterface {
  const BasketHiveRepository({required this.basketBox});

  final Box<Basket> basketBox;

  @override
  Future<Basket> getData() async {
    final basket = basketBox.get(
      HiveFieldKey.basket,
      defaultValue: const Basket(items: []),
    );

    return basket!;
  }

  @override
  Future<Basket> updateData(Basket basket) async {
    await basketBox.put(HiveFieldKey.basket, basket);

    return basket;
  }
}
