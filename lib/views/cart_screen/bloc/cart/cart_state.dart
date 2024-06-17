part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {
  final int count = 0;
}

final class CartUpdated extends CartState {
  final int count;

  const CartUpdated({required this.count});
}
