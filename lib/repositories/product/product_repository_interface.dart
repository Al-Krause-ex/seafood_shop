abstract interface class ProductRepositoryInterface {
  Future<void> getProductsByCategory(String categoryId);
}
