import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/domain/repository/impl/product_repository_impl.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final List<Product> products = [];
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) async {
      switch (event) {
        case LoadProductsEvent():
          emit(ProductLoading());
          final result = await ProductRepositoryImpl().getAllProducts();
          products.clear();
          products.addAll(result ?? []);
          await Future.delayed(Durations.extralong4);
          emit(
            result != null
                ? ProductSuccess(products: result)
                : const ProductFailed(errorMessage: "Error loading"),
          );
          break;
        case FilterProductEvent():
          emit(ProductLoading());

          emit(
            ProductSuccess(
                products: event.partnerName
                        .contains(Constants.globalContext.tr("homepage.seeAll"))
                    ? products
                    : products
                        .where(
                          (product) =>
                              product.producer.contains(event.partnerName),
                        )
                        .toList()),
          );
        default:
      }
    });
  }
}
