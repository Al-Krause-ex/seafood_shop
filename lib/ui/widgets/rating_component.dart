import 'package:flutter/material.dart';

class RatingComponent extends StatelessWidget {
  const RatingComponent({
    super.key,
    required this.rating,
    this.textStyle,
    required this.iconSize,
  });

  final double rating;
  final TextStyle? textStyle;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          rating % 1 == 0
              ? rating.toStringAsFixed(0)
              : rating.toStringAsFixed(1),
          style: textStyle,
        ),
        Icon(
          Icons.star,
          color: theme.primaryColor,
          size: iconSize,
        ),
      ],
    );
  }
}
