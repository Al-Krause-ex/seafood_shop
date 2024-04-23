import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seafood_shop/repositories/product/models/models.dart';
import 'package:seafood_shop/repositories/product/product.dart';
import 'package:seafood_shop/repositories/product/product_repository_interface.dart';

part 'product_detail_event.dart';

part 'product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent, ProductDetailState> {
  ProductDetailBloc({
    required ProductRepositoryInterface productRepositoryInterface,
  })  : _productRepositoryInterface = productRepositoryInterface,
        super(ProductDetailInitial()) {
    on<LoadProductDetailById>(_loadById);
    on<SetProductDetail>(_setProduct);
  }

  final ProductRepositoryInterface _productRepositoryInterface;

  Future<void> _loadById(
    LoadProductDetailById event,
    Emitter<ProductDetailState> emit,
  ) async {
    try {
      emit(ProductDetailLoading());

      final product = await _productRepositoryInterface.getProductById(
        event.productId,
      );

      emit(ProductDetailLoaded(product: product));
    } catch (e) {
      log('PRODUCTS ERROR: $e');
      emit(ProductDetailFailure(error: e));
    }
  }

  Future<void> _setProduct(
    SetProductDetail event,
    Emitter<ProductDetailState> emit,
  ) async {
    try {
      emit(ProductDetailLoading());

      await Future.delayed(const Duration(milliseconds: 100));

      emit(ProductDetailLoaded(product: event.product));
    } catch (e) {
      log('PRODUCTS ERROR: $e');
      emit(ProductDetailFailure(error: e));
    }
  }
}
