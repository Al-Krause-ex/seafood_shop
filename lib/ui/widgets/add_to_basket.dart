import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/ui/ui.dart';

class AddToBasket extends StatelessWidget {
  const AddToBasket({
    super.key,
    required this.product,
    required this.heightButton,
  });

  final Product product;
  final double heightButton;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        final basketIndex = state.basket.items
            .indexWhere((e) => e.productId == product.productId);

        if (basketIndex < 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: CustomElevatedButton(
              callback: () {
                context.read<BasketBloc>().add(AddItemBasket(
                    basketItem: BasketItem.createByProduct(product)));
              },
              title: 'В корзину',
              height: heightButton,
              margin: const EdgeInsets.symmetric(horizontal: 10),
            ),
          );
        }

        return BasketVerticalSettingButton(
          basketItem: state.basket.items[basketIndex],
          heightButton: heightButton,
        );
      },
    );
  }
}
