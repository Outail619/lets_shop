import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';

class CheckoutBottombar extends StatelessWidget {
  const CheckoutBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    // Adding a safe area so the bottombar doesn't conflict with the native os bottom bar
    return SafeArea(
      //Adding a BlocBuilder on the CartBloc to update the total checkout price
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) => switch (state) {
          //Showing the appBar only if total of products in our cart is superior to 0
          _ => BlocProvider.of<CartBloc>(Constants.globalContext).total > 0
              ? Container(
                  height: 56.h(context),
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.only(
                    left: AppSpacings.xxxl,
                    right: AppSpacings.xxxl,
                    top: AppSpacings.lg,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.tr("cart_screen.total"),
                            style: AppStyles.settingsSectionTextStyle,
                          ),
                          Row(
                            children: [
                              Text(
                                "${BlocProvider.of<CartBloc>(Constants.globalContext).sum.convertFrenchCentToEuro()}€",
                                style: AppStyles.title21,
                              ),
                              const SizedBox(
                                width: AppSpacings.xxl,
                              ),
                              Text(
                                "${context.tr("cart_screen.vat")} 5.5",
                                style: AppStyles.settingsSectionTextStyle,
                              )
                            ],
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacings.lg),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(48),
                              border: Border.all(color: AppColors.primaryColor),
                              color: Colors.white),
                          child: Text(
                            context.tr("cart_screen.checkout"),
                            style: AppStyles.title21
                                .copyWith(color: AppColors.primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        },
      ),
    );
  }
}
