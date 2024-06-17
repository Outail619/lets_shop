part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

final class AddToCart extends CartEvent {
  final Product product;
  const AddToCart({required this.product});
}

final class RemoveFromCart extends CartEvent {
  final Product product;
  const RemoveFromCart({required this.product});
}
