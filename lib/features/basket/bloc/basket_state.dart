part of 'basket_bloc.dart';

sealed class BasketState extends Equatable {
  const BasketState(this.basket);

  final Basket basket;

  @override
  List<Object> get props => [basket];
}

final class BasketInitial extends BasketState {
  const BasketInitial(super.basket);
}

final class BasketLoading extends BasketState {
  const BasketLoading(super.basket);
}

final class BasketLoaded extends BasketState {
  const BasketLoaded(super.basket);
}

final class BasketFailure extends BasketState {
  const BasketFailure(super.basket, this.error);

  final Object error;

  @override
  List<Object> get props => super.props..add(error);
}
