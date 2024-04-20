import 'package:flutter/material.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

class SeafoodShop extends StatefulWidget {
  const SeafoodShop({super.key});

  @override
  State<SeafoodShop> createState() => _SeafoodShopState();
}

class _SeafoodShopState extends State<SeafoodShop> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Seafood SHOP',
      theme: themeData,
      routerConfig: _router.config(),
    );
  }
}
