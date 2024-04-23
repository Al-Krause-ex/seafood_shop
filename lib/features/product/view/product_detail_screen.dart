import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:seafood_shop/features/product/bloc/product_detail_bloc.dart';
import 'package:seafood_shop/features/product/widgets/rich_text_description.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/ui/ui.dart';

@RoutePage()
class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    super.key,
    this.selectedProduct,
    required this.productId,
  });

  final Product? selectedProduct;
  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  void initState() {
    if (widget.selectedProduct == null) {
      context
          .read<ProductDetailBloc>()
          .add(LoadProductDetailById(productId: widget.productId));
      return;
    }

    context
        .read<ProductDetailBloc>()
        .add(SetProductDetail(product: widget.selectedProduct!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: BlocBuilder<ProductDetailBloc, ProductDetailState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              const CustomSliverAppBar(title: 'Выбранный товар'),
              if (state is ProductDetailLoaded) ...[
                SliverToBoxAdapter(
                  child: Container(
                    color: theme.cardColor,
                    padding: const EdgeInsets.all(15),
                    child: CustomCachedImage(
                      url: state.product.avatar,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 5,
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 18)
                      .copyWith(top: 10),
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.product.name,
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        RichTextDescription(
                          title: 'Вкус',
                          value: state.product.taste,
                        ),
                        const SizedBox(height: 2),
                        RichTextDescription(
                          title: 'Происхождение',
                          value: state.product.origin,
                        ),
                        const SizedBox(height: 2),
                        RichTextDescription(
                          title: 'Питательные вещества',
                          value: state.product.nutrients,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Стоимость',
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '${state.product.price}₽ / 200гр',
                          style: theme.textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 10),
                        CustomInkWell(
                          color: theme.cardColor,
                          callback: () {},
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15.0,
                              vertical: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '0 отзывов',
                                  style: theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.primaryColor,
                                  ),
                                ),
                                RatingComponent(
                                  rating: state.product.rating,
                                  textStyle:
                                      theme.textTheme.bodyMedium?.copyWith(
                                    color: theme.primaryColor,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  iconSize: 12,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        Center(
                          child: AddToBasket(
                            product: state.product,
                            heightButton: 35,
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ] else
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: CustomCircularProgressIndicator(),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
