import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';

class BasketTotalPrice extends StatelessWidget {
  const BasketTotalPrice({super.key, required this.totalPrice});

  final int totalPrice;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedFlipCounter(
      value: totalPrice,
      suffix: '₽',
      textStyle:
          theme.textTheme.bodyMedium?.copyWith(color: theme.primaryColor),
      duration: const Duration(milliseconds: 400),
    );
  }
}
