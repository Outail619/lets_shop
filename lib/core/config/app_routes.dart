import 'package:flutter/material.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/views/cart_screen/cart_screen.dart';
import 'package:lets_shop/views/home_page/home_screen.dart';
import 'package:lets_shop/views/product_detail/product_detail_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    RoutesPath.homeScreen: (_) => const HomeScreen(),
    RoutesPath.cartScreen: (_) => const CartScreen(),
  };

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesPath.productDetail:
        return MaterialPageRoute(
          builder: (context) =>
              ProductDetailScreen(product: settings.arguments as Product),
        );
      default:
        return null;
    }
  }
}

class RoutesPath {
  RoutesPath._();

  static const homeScreen = "/home";
  static const cartScreen = "/cart";
  static const productDetail = "/product/detail";
}
