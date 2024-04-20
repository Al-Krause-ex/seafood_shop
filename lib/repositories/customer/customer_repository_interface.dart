import 'package:seafood_shop/repositories/customer/models/models.dart';

abstract interface class CustomerRepositoryInterface {
  Future<Customer> getData();
  Future<void> updateData();
  Future<void> updateAvatar();
}
