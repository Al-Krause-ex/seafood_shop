import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.title,
    this.actions = const [],
  });

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      snap: true,
      floating: true,
      centerTitle: true,
      title: Text(title),
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      actions: actions,
    );
  }
}
