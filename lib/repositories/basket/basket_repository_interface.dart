import 'models/models.dart';

abstract interface class BasketRepositoryInterface {
  Future<Basket> getData();
  Future<Basket> updateData(Basket basket);
}
