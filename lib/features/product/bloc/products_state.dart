part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsLoaded extends ProductsState {
  const ProductsLoaded({required this.products});

  final List<Product> products;

  @override
  List<Object> get props => super.props..add(products);
}

final class ProductsFailure extends ProductsState {
  const ProductsFailure({required this.error});

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
