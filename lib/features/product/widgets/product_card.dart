import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/repositories/basket/models/basket_item.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          context.pushRoute(ProductDetailRoute(
            selectedProduct: product,
            productId: product.productId,
          ));
        },
        borderRadius: BorderRadius.circular(20),
        child: BaseContainer(
          isWithColor: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Expanded(
                  child: Center(
                    child: CustomCachedImage(url: product.avatar),
                  ),
                ),
                Text(
                  product.name,
                  style: theme.textTheme.labelLarge,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingComponent(
                      rating: product.rating,
                      textStyle: theme.textTheme.labelMedium?.copyWith(
                        color: theme.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                      iconSize: 10,
                    ),
                    Text(
                      '${product.price}₽ / 200г',
                      style: theme.textTheme.labelSmall
                          ?.copyWith(color: Colors.black38),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: BlocBuilder<BasketBloc, BasketState>(
                    builder: (context, state) {
                      final basketIndex = state.basket.items
                          .indexWhere((e) => e.productId == product.productId);

                      if (basketIndex < 0) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: CustomElevatedButton(
                            callback: () {
                              context.read<BasketBloc>().add(AddItemBasket(
                                  basketItem:
                                      BasketItem.createByProduct(product)));
                            },
                            title: 'В корзину',
                            height: 25,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        );
                      }

                      return BasketVerticalSettingButton(
                        basketItem: state.basket.items[basketIndex],
                        heightButton: 25,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
