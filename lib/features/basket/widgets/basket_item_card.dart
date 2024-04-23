import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

class BasketItemCard extends StatelessWidget {
  const BasketItemCard({super.key, required this.basketItem});

  final BasketItem basketItem;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: CustomInkWell(
        color: theme.cardColor,
        callback: () {
          context.pushRoute(
            ProductDetailRoute(productId: basketItem.productId),
          );
        },
        borderRadius: BorderRadius.circular(20),
        child: BaseContainer(
          width: MediaQuery.of(context).size.width,
          height: 100,
          isWithColor: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomCachedImage(
                  url: basketItem.productImageUrl,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        basketItem.productName,
                        style: theme.textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      const Spacer(),
                      BasketHorizontalSettingButton(basketItem: basketItem),
                    ],
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
