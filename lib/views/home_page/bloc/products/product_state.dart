part of 'product_bloc.dart';

final class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class ProductInitial extends ProductState {}

final class ProductLoading extends ProductState {}

final class ProductSuccess extends ProductState {
  final List<Product> products;

  const ProductSuccess({required this.products});
}

final class ProductFailed extends ProductState {
  final String errorMessage;

  const ProductFailed({required this.errorMessage});
}
