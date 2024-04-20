import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/catalog/bloc/category_bloc.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

import 'repositories/category/category.dart';

class SeafoodShop extends StatefulWidget {
  const SeafoodShop({super.key, required this.db});

  final FirebaseFirestore db;

  @override
  State<SeafoodShop> createState() => _SeafoodShopState();
}

class _SeafoodShopState extends State<SeafoodShop> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final categoryRepository = CategoryFirestoreRepository(db: widget.db);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc(
            categoryRepositoryInterface: categoryRepository,
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Seafood SHOP',
        theme: themeData,
        routerConfig: _router.config(),
      ),
    );
  }
}
