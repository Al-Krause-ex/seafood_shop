import 'package:seafood_shop/repositories/category/models/models.dart';

abstract interface class CategoryRepositoryInterface {
  Future<List<Category>> getCategories();
}
