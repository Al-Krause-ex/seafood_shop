import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.width = 50.0,
    this.height = 50.0,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 25),
      child: SizedBox(
        width: width,
        height: height,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
