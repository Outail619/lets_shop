part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

final class LoadProductsEvent extends ProductEvent {}

final class FilterProductEvent extends ProductEvent {
  final String partnerName;

  const FilterProductEvent({required this.partnerName});
}
