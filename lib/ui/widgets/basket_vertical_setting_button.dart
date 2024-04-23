import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/ui/widgets/basket_components/basket_components.dart';

class BasketVerticalSettingButton extends StatelessWidget {
  const BasketVerticalSettingButton({
    super.key,
    required this.basketItem,
    required this.heightButton,
  });

  final BasketItem basketItem;
  final double heightButton;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return BasketChangeWeight(
              basketItem: basketItem,
              widthButton: constraints.maxWidth,
              heightButton: heightButton,
            );
          },
        ),
        BasketTotalPrice(totalPrice: basketItem.totalPrice),
      ],
    );
  }
}
