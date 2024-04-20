abstract interface class OrderRepositoryInterface {
  Future<void> getOrder();
  Future<void> createOrder();
}
