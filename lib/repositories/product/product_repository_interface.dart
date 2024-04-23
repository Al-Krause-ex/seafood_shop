import 'package:seafood_shop/repositories/product/models/models.dart';

abstract interface class ProductRepositoryInterface {
  Future<List<Product>> getProductsByCategory(String categoryId);
  Future<Product> getProductById(String productId);
}
