import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/features/auth/auth.dart';
import 'package:seafood_shop/features/basket/view/view.dart';
import 'package:seafood_shop/features/category/view/view.dart';
import 'package:seafood_shop/features/explore/view/view.dart';
import 'package:seafood_shop/features/navigation_screens/navigation_screens.dart';
import 'package:seafood_shop/features/product/view/product_detail_screen.dart';
import 'package:seafood_shop/features/product/view/view.dart';
import 'package:seafood_shop/features/profile/view/view.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';

import '../repositories/category/models/models.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignUpRoute.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(page: SignInRoute.page),
        AutoRoute(page: PasswordRecoveryRoute.page),
        AutoRoute(
          page: HomeRoute.page,
          children: [
            AutoRoute(page: ExploreRoute.page),
            AutoRoute(
              page: CategoryNavigationRoute.page,
              children: [
                AutoRoute(page: CategoryRoute.page, initial: true),
                AutoRoute(page: ProductsRoute.page),
                AutoRoute(page: ProductDetailRoute.page),
              ],
            ),
            AutoRoute(
              page: BasketNavigationRoute.page,
              children: [
                AutoRoute(page: BasketRoute.page, initial: true),
                AutoRoute(page: ProductDetailRoute.page),
              ],
            ),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
      ];
}
