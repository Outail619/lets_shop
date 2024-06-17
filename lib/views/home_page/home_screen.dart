import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';
import 'package:lets_shop/views/home_page/bloc/products/product_bloc.dart';
import 'package:lets_shop/views/home_page/widgets/homepage_appbar.dart';
import 'package:lets_shop/views/home_page/widgets/partners_list.dart';
import 'package:lets_shop/views/home_page/widgets/product_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ProductBloc>(Constants.globalContext).add(
      LoadProductsEvent(),
    );
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.sizeOf(context).width, 32.h(context)),
        child: BlocConsumer<CartBloc, CartState>(
          builder: (context, state) => switch (state) {
            _ => HomepageAppbar(
                count: BlocProvider.of<CartBloc>(Constants.globalContext).total)
          },
          listener: (context, state) {},
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) => switch (state) {
          //Showing a loader when fetching the request
          ProductInitial() || ProductLoading() => const Center(
              child: CircularProgressIndicator(),
            ),
          // Displaying the data on Success
          ProductSuccess() => Column(
              children: [
                // Showing up the partners list as a filter
                PartnerList(
                  filterPartner: (partnerName) {
                    BlocProvider.of<ProductBloc>(Constants.globalContext).add(
                      FilterProductEvent(partnerName: partnerName),
                    );
                  },
                  partners:
                      BlocProvider.of<ProductBloc>(Constants.globalContext)
                          .products
                          .map((e) => e.producer)
                          .toSet()
                          .toList()
                        ..insert(0, context.tr("homepage.seeAll")),
                ),
                //Showing up a Grid of the products
                Expanded(
                  child: GridView.builder(
                    itemCount: state.products.length,
                    scrollDirection: Axis.vertical,
                    padding: EdgeInsets.only(
                        top: 32.h(context), bottom: 32.h(context)),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: AppSpacings.xxxl * 2),
                    itemBuilder: (context, index) => ProductCardWidget(
                      productInfo: state.products[index],
                      addToCart: () {
                        BlocProvider.of<CartBloc>(Constants.globalContext).add(
                          AddToCart(
                            product: state.products[index],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          _ => const SizedBox()
        },
      ),
    );
  }
}
