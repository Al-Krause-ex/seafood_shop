import 'package:flutter/material.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/ui/widgets/basket_components/basket_components.dart';

class BasketHorizontalSettingButton extends StatelessWidget {
  const BasketHorizontalSettingButton({super.key, required this.basketItem});

  final BasketItem basketItem;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BasketTotalPrice(totalPrice: basketItem.totalPrice),
          BasketChangeWeight(
            basketItem: basketItem,
            widthButton: 120.0,
            heightButton: 25,
          ),
        ],
      ),
    );
  }
}
