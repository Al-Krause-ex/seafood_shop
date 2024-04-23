import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/router/router.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        ExploreRoute(),
        CategoryRoute(),
        BasketRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: SafeArea(
            child: Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                // boxShadow: [
                //   BoxShadow(
                //       color: Colors.black38, spreadRadius: 0, blurRadius: 10),
                // ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: BottomNavigationBar(
                  selectedFontSize: 0,
                  unselectedFontSize: 0,
                  currentIndex: tabsRouter.activeIndex,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) => _openPage(index, tabsRouter),
                  items: [
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Главная',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.category),
                      label: 'Каталог',
                    ),
                    BottomNavigationBarItem(
                      icon: BlocBuilder<BasketBloc, BasketState>(
                        builder: (context, state) {
                          return Badge(
                            label: Text('${state.basket.items.length}'),
                            isLabelVisible: state.basket.items.isNotEmpty,
                            child: const Icon(Icons.shopping_basket),
                          );
                        },
                      ),
                      label: 'Корзина',
                    ),
                    const BottomNavigationBarItem(
                      icon: Icon(Icons.account_box),
                      label: 'Кабинет',
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _openPage(int index, TabsRouter tabsRouter) {
    tabsRouter.setActiveIndex(index);
  }
}
