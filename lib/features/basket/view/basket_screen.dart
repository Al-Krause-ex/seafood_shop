import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/features/basket/widgets/widgets.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

@RoutePage()
class BasketScreen extends StatefulWidget {
  const BasketScreen({super.key});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<BasketBloc, BasketState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            CustomSliverAppBar(
              title: 'Корзина',
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<BasketBloc>().add(ClearBasket());
                  },
                  icon: const Icon(Icons.delete_outline_outlined),
                ),
              ],
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 20),
            ),
            if (state is BasketLoaded) ...[
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                sliver: SliverList.list(
                  children: [
                    ...state.basket.items.map(
                      (e) => BasketItemCard(basketItem: e),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.basket.items.isNotEmpty) ...[
                        const Divider(),
                        const SizedBox(height: 5),
                      ],
                      Text(
                        'В вашем заказе',
                        style: theme.textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${state.basket.items.length} товара',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black45),
                          ),
                          AnimatedFlipCounter(
                            value: state.basket.getTotalPrice(),
                            suffix: '₽',
                            textStyle:
                            theme.textTheme.bodyMedium,
                            duration: const Duration(milliseconds: 400),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Доставка',
                            style: theme.textTheme.bodyMedium
                                ?.copyWith(color: Colors.black45),
                          ),
                          Text(
                            'Адрес не указан',
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'К оплате',
                            style: theme.textTheme.labelLarge,
                          ),
                          Text(
                            '${state.basket.getTotalPrice()}₽',
                            style: theme.textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      if (state.basket.items.isNotEmpty)
                        CustomElevatedButton(
                          title: 'Оформить заказ',
                          height: 40,
                          callback: () {},
                        ),
                    ],
                  ),
                ),
              ),
            ] else
              const SliverToBoxAdapter(
                child: CustomCircularProgressIndicator(),
              )
          ],
        );
      },
    );
  }
}
