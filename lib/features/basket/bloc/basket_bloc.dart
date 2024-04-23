import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:seafood_shop/repositories/basket/basket.dart';
import 'package:seafood_shop/repositories/basket/basket_repository_interface.dart';
import 'package:seafood_shop/repositories/basket/models/models.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc({required BasketRepositoryInterface basketRepositoryInterface})
      : _basketRepositoryInterface = basketRepositoryInterface,
        super(BasketInitial(Basket.empty())) {
    on<LoadBasket>(_load);
    on<AddItemBasket>(_addItem);
    on<RemoveItemBasket>(_removeItem);
    on<ClearBasket>(_clearBasket);
  }

  final BasketRepositoryInterface _basketRepositoryInterface;

  Future<void> _load(LoadBasket event, Emitter<BasketState> emit) async {
    try {
      emit(BasketLoading(state.basket));

      final basket = await _basketRepositoryInterface.getData();

      emit(BasketLoaded(basket));
    } catch (e) {
      emit(BasketFailure(state.basket, e));
    }
  }

  Future<void> _addItem(AddItemBasket event, Emitter<BasketState> emit) async {
    try {
      emit(BasketLoading(state.basket));

      final currentBasket = state.basket;
      final updatedBasket = currentBasket.addBasketItem(event.basketItem);

      final basket = await _basketRepositoryInterface.updateData(updatedBasket);

      emit(BasketLoaded(basket));
    } catch (e) {
      log('BASKET ADD ERROR: $e');
      emit(BasketFailure(state.basket, e));
    }
  }

  Future<void> _removeItem(
    RemoveItemBasket event,
    Emitter<BasketState> emit,
  ) async {
    try {
      emit(BasketLoading(state.basket));

      final currentBasket = state.basket;
      final updatedBasket = currentBasket.removeBasketItem(event.basketItem);

      final basket = await _basketRepositoryInterface.updateData(updatedBasket);

      emit(BasketLoaded(basket));
    } catch (e) {
      log('BASKET REMOVE ERROR: $e');
      emit(BasketFailure(state.basket, e));
    }
  }

  Future<void> _clearBasket(
    ClearBasket event,
    Emitter<BasketState> emit,
  ) async {
    try {
      if (state.basket.items.isEmpty) return;

      emit(BasketLoading(state.basket));

      final emptyBasket = Basket.empty();
      await _basketRepositoryInterface.updateData(emptyBasket);

      emit(BasketLoaded(emptyBasket));
    } catch (e) {
      log('BASKET REMOVE ERROR: $e');
      emit(BasketFailure(state.basket, e));
    }
  }
}
