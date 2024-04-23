import 'package:flutter/material.dart';
import 'package:seafood_shop/ui/ui.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.title,
    required this.height,
    required this.callback,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = primaryColor,
    this.foregroundColor = Colors.white,
  });

  final String title;
  final double height;
  final VoidCallback callback;
  final EdgeInsets margin;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: Size(constraints.maxWidth, height),
              backgroundColor: backgroundColor,
              foregroundColor: foregroundColor,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            onPressed: callback,
            child: FittedBox(child: Text(title)),
          );
        },
      ),
    );
  }
}
