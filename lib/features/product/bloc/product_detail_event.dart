part of 'product_detail_bloc.dart';

sealed class ProductDetailEvent extends Equatable {
  const ProductDetailEvent();

  @override
  List<Object> get props => [];
}

final class LoadProductDetailById extends ProductDetailEvent {
  const LoadProductDetailById({required this.productId});

  final String productId;

  @override
  List<Object> get props => super.props..add(productId);
}

final class SetProductDetail extends ProductDetailEvent {
  const SetProductDetail({required this.product});

  final Product product;

  @override
  List<Object> get props => super.props..add(product);
}