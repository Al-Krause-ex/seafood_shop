part of 'basket_bloc.dart';

sealed class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  List<Object> get props => [];
}

final class LoadBasket extends BasketEvent {}

final class AddItemBasket extends BasketEvent {
  const AddItemBasket({required this.basketItem});

  final BasketItem basketItem;

  @override
  List<Object> get props => super.props..add(basketItem);
}

final class RemoveItemBasket extends BasketEvent {
  const RemoveItemBasket({required this.basketItem});

  final BasketItem basketItem;

  @override
  List<Object> get props => super.props..add(basketItem);
}

final class ClearBasket extends BasketEvent {}
