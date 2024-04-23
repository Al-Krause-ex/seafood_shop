import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/product/bloc/products_bloc.dart';
import 'package:seafood_shop/features/product/widgets/widgets.dart';
import 'package:seafood_shop/repositories/category/models/models.dart';
import 'package:seafood_shop/ui/ui.dart';

@RoutePage()
class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, required this.selectedCategory});

  final Category selectedCategory;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    context.read<ProductsBloc>().add(
          LoadProductsByCategory(
            categoryId: widget.selectedCategory.categoryId,
          ),
        );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomSliverAppBar(title: widget.selectedCategory.name),
          const SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          BlocBuilder<ProductsBloc, ProductsState>(
            builder: (context, state) {
              if (state is ProductsLoaded) {
                return SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 18)
                      .copyWith(bottom: 10),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 170,
                      mainAxisExtent: 180,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 1,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ProductCard(product: state.products[index]);
                      },
                      childCount: state.products.length,
                    ),
                  ),
                );
              }

              return const SliverToBoxAdapter(
                child: CustomCircularProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
