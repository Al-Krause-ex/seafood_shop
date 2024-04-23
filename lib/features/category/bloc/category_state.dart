part of 'category_bloc.dart';

sealed class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  const CategoryLoaded({required this.categories});

  final List<Category> categories;

  @override
  List<Object> get props => super.props..add(categories);
}

final class CategoryFailure extends CategoryState {
  const CategoryFailure(this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}