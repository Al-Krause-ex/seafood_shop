import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seafood_shop/repositories/category/category.dart';
import 'package:seafood_shop/repositories/category/models/models.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  CategoryBloc({
    required CategoryRepositoryInterface categoryRepositoryInterface,
  })  : _categoryRepositoryInterface = categoryRepositoryInterface,
        super(CategoryInitial()) {
    on<LoadCategory>(_load);
  }

  final CategoryRepositoryInterface _categoryRepositoryInterface;

  Future<void> _load(
    LoadCategory event,
    Emitter<CategoryState> emit,
  ) async {
    try {
      emit(CategoryLoading());

      final categories = await _categoryRepositoryInterface.getCategories();

      emit(CategoryLoaded(categories: categories));
    } catch (e) {
      emit(CategoryFailure(e));
    }
  }
}
