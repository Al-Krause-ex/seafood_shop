import 'package:auto_route/auto_route.dart';
import 'package:seafood_shop/features/basket/view/view.dart';
import 'package:seafood_shop/features/catalog/view/view.dart';
import 'package:seafood_shop/features/explore/view/view.dart';
import 'package:seafood_shop/features/home/view/view.dart';
import 'package:seafood_shop/features/profile/view/view.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          children: [
            AutoRoute(
              page: ExploreRoute.page,
              path: 'explore',
            ),
            AutoRoute(
              page: CatalogRoute.page,
              path: 'catalog',
            ),
            AutoRoute(
              page: BasketRoute.page,
              path: 'basket',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),
      ];
}
