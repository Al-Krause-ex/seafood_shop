import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/basket/bloc/basket_bloc.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

@RoutePage()
class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  void initState() {
    context.read<BasketBloc>().add(LoadBasket());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: 'Explore'),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
