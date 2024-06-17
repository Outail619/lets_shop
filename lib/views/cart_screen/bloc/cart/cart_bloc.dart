import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lets_shop/domain/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final Map<Product, int> cart = {};
  int total = 0;
  double sum = 0;
  CartBloc() : super(CartInitial()) {
    on<CartEvent>((event, emit) {
      switch (event) {
        case AddToCart():
          emit(CartInitial());
          if (cart.keys
              .where((product) => product.id == event.product.id)
              .isEmpty) {
            cart[event.product] = 1;
          } else {
            cart[event.product] = cart[event.product]! + 1;
          }
          sum += event.product.price;
          total++;
          emit(CartUpdated(count: total));
          break;
        case RemoveFromCart():
          emit(CartInitial());
          cart[event.product] = cart[event.product]! - 1;
          if (cart[event.product]! < 1) {
            cart.remove(event.product);
          }
          sum -= event.product.price;
          total--;
          emit(CartUpdated(count: total));
        default:
      }
    });
  }
}
