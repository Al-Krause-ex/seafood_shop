import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/repositories/category/models/models.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      color: theme.cardColor,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: () {
          context.pushRoute(ProductsRoute(selectedCategory: category));
        },
        borderRadius: BorderRadius.circular(20),
        child: BaseContainer(
          isWithColor: false,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CustomCachedImage(url: category.imageUrl),
                const Spacer(),
                Text(category.name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
