import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/widgets/counter_widget.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';
import 'package:lets_shop/views/cart_screen/widgets/checkout_bottombar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          context.tr(
            "cart_screen.title",
          ),
          style: AppStyles.title21,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white12,
          gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.orange,
            Colors.orange,
            Colors.orangeAccent,
            Colors.yellow.shade100,
          ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        ),
        child: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) => switch (state) {
            _ => ListView.builder(
                itemCount: BlocProvider.of<CartBloc>(Constants.globalContext)
                    .cart
                    .entries
                    .length,
                itemBuilder: (context, index) => _ProductItemWidget(
                    product: BlocProvider.of<CartBloc>(Constants.globalContext)
                        .cart
                        .keys
                        .toList()[index],
                    count: BlocProvider.of<CartBloc>(Constants.globalContext)
                        .cart
                        .values
                        .toList()[index]))
          },
        ),
      ),
      bottomNavigationBar: const CheckoutBottombar(),
    );
  }
}

class _ProductItemWidget extends StatelessWidget {
  final Product product;
  final int count;

  const _ProductItemWidget(
      {super.key, required this.product, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: product.imageUrl,
      ),
      title: Text(product.title),
      trailing: CounterView(
        number: count,
        increaseCallback: () =>
            BlocProvider.of<CartBloc>(Constants.globalContext)
                .add(AddToCart(product: product)),
        decreaseCallback: () =>
            BlocProvider.of<CartBloc>(Constants.globalContext).add(
          RemoveFromCart(product: product),
        ),
      ),
    );
  }
}
