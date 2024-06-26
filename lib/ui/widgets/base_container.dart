import 'package:flutter/material.dart';

class BaseContainer extends StatelessWidget {
  const BaseContainer({
    super.key,
    required this.child,
    this.width,
    this.height,
    this.margin,
    this.padding = const EdgeInsets.only(),
    this.borderRadius = 20.0,
    this.isWithColor = true,
  });

  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final bool isWithColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: isWithColor ? theme.cardColor : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: child,
    );
  }
}
