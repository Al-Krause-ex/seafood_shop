import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/features/category/bloc/category_bloc.dart';
import 'package:seafood_shop/features/product/bloc/product_detail_bloc.dart';
import 'package:seafood_shop/features/product/bloc/products_bloc.dart';
import 'package:seafood_shop/repositories/basket/basket_hive_repository.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';
import 'package:seafood_shop/repositories/product/product_firestore_repository.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

import 'repositories/category/category.dart';

class SeafoodShop extends StatefulWidget {
  const SeafoodShop({super.key, required this.db, required this.basketBox});

  final FirebaseFirestore db;
  final Box<Basket> basketBox;

  @override
  State<SeafoodShop> createState() => _SeafoodShopState();
}

class _SeafoodShopState extends State<SeafoodShop> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final categoryRepository = CategoryFirestoreRepository(db: widget.db);
    final productsRepository = ProductFirestoreRepository(db: widget.db);
    final basketRepository = BasketHiveRepository(basketBox: widget.basketBox);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryRepositoryInterface: categoryRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ProductsBloc(
            productRepositoryInterface: productsRepository,
          ),
        ),
        BlocProvider(
          create: (context) => ProductDetailBloc(
            productRepositoryInterface: productsRepository,
          ),
        ),
        BlocProvider(
          create: (context) => BasketBloc(
            basketRepositoryInterface: basketRepository,
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Seafood SHOP',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(),
      ),
    );
  }
}
