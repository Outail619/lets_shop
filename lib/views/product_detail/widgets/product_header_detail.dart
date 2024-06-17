import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';
import 'package:lets_shop/core/widgets/counter_widget.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';

class ProductHeaderDetail extends StatelessWidget {
  final Product product;
  const ProductHeaderDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.xxl,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              product.title,
              textAlign: TextAlign.left,
              style: AppStyles.title21.copyWith(fontWeight: FontWeight.w600),
              maxLines: 3,
            ),
          ),
          const SizedBox(
            width: AppSpacings.md,
          ),
          Column(
            children: [
              Text(
                "${product.price.convertFrenchCentToEuro()}€",
                style: AppStyles.title21.copyWith(fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: AppSpacings.md,
              ),
              BlocBuilder<CartBloc, CartState>(
                builder: (context, state) => switch (state) {
                  _ => CounterView(
                      number: BlocProvider.of<CartBloc>(Constants.globalContext)
                              .cart[product] ??
                          0,
                      increaseCallback: () =>
                          BlocProvider.of<CartBloc>(Constants.globalContext)
                              .add(AddToCart(product: product)),
                      decreaseCallback: () =>
                          BlocProvider.of<CartBloc>(Constants.globalContext)
                              .add(
                        RemoveFromCart(product: product),
                      ),
                    )
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
