import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/repositories/product/product.dart';
import 'package:seafood_shop/repositories/product/product_repository_interface.dart';

part 'products_event.dart';

part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc({required ProductRepositoryInterface productRepositoryInterface})
      : _productRepositoryInterface = productRepositoryInterface,
        super(ProductsInitial()) {
    on<LoadProductsByCategory>(_loadByCategory);
  }

  final ProductRepositoryInterface _productRepositoryInterface;

  Future<void> _loadByCategory(
    LoadProductsByCategory event,
    Emitter<ProductsState> emit,
  ) async {
    try {
      emit(ProductsLoading());

      final products = await _productRepositoryInterface.getProductsByCategory(
        event.categoryId,
      );

      emit(ProductsLoaded(products: products));
    } catch (e) {
      log('PRODUCTS ERROR: $e');
      emit(ProductsFailure(error: e));
    }
  }
}
