import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/category/bloc/category_bloc.dart';
import 'package:seafood_shop/features/category/widgets/category_card.dart';
import 'package:seafood_shop/ui/ui.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

@RoutePage()
class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    context.read<CategoryBloc>().add(LoadCategory());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(title: 'Категории'),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        SliverToBoxAdapter(
          child: SearchButton(
            onTap: () {},
            controller: TextEditingController(),
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoaded) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18)
                    .copyWith(bottom: 10),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 140,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return CategoryCard(category: state.categories[index]);
                    },
                    childCount: state.categories.length,
                  ),
                ),
              );
            }

            return const SliverToBoxAdapter(
              child: CustomCircularProgressIndicator(),
            );
          },
        )
      ],
    );
  }
}
