import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/ui/ui.dart';

class BasketChangeWeight extends StatelessWidget {
  const BasketChangeWeight({
    super.key,
    required this.basketItem,
    required this.widthButton,
    required this.heightButton,
  });

  final BasketItem basketItem;
  final double widthButton;
  final double heightButton;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final weightSuffix = basketItem.getConvertedWeight();

    return Container(
      width: widthButton,
      height: heightButton,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: expandedButtonColor,
      ),
      child: Row(
        children: [
          CustomInkWell(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(100),
            callback: () {
              context.read<BasketBloc>().add(RemoveItemBasket(
                  basketItem: basketItem.copyWith(weight: 200)));
            },
            child: SizedBox(
              width: heightButton,
              height: heightButton,
              child: const Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 3),
          Expanded(
            child: Center(
              child: AnimatedFlipCounter(
                value: weightSuffix.$1,
                fractionDigits: weightSuffix.$1 is int ? 0 : 1,
                suffix: weightSuffix.$2,
                textStyle: theme.textTheme.labelMedium
                    ?.copyWith(color: Colors.white),
                duration: const Duration(milliseconds: 400),
              ),
            ),
          ),
          const SizedBox(width: 3),
          CustomInkWell(
            color: theme.primaryColor,
            borderRadius: BorderRadius.circular(100),
            callback: () {
              context.read<BasketBloc>().add(AddItemBasket(
                  basketItem: basketItem.copyWith(weight: 200)));
            },
            child: SizedBox(
              width: heightButton,
              height: heightButton,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
