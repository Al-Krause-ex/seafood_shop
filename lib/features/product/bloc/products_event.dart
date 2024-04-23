part of 'products_bloc.dart';

sealed class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object> get props => [];
}

final class LoadProductsByCategory extends ProductsEvent {
  const LoadProductsByCategory({required this.categoryId});

  final String categoryId;

  @override
  List<Object> get props => super.props..add(categoryId);
}
