part of 'product_detail_bloc.dart';

sealed class ProductDetailState extends Equatable {
  const ProductDetailState();

  @override
  List<Object> get props => [];
}

final class ProductDetailInitial extends ProductDetailState {}

final class ProductDetailLoading extends ProductDetailState {}

final class ProductDetailLoaded extends ProductDetailState {
  const ProductDetailLoaded({required this.product});

  final Product product;

  @override
  List<Object> get props => super.props..add(product);
}

final class ProductDetailFailure extends ProductDetailState {
  const ProductDetailFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
