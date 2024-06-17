import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_shop/core/config/app_routes.dart';
import 'package:lets_shop/core/theme/app_assets.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';
import 'package:lets_shop/views/cart_screen/bloc/cart/cart_bloc.dart';
import 'package:lets_shop/views/settings/bloc/language_cubit.dart';

class HomepageAppbar extends StatelessWidget {
  final int count;
  const HomepageAppbar({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Using a DropdownButton for the languages and fixing its height with a SizedBox at 24 width
          SizedBox(
            width: 24.w(context),
            child: DropdownButton(
              isDense: true,
              isExpanded: true,
              icon: SvgPicture.asset(
                "assets/icons/${context.locale.languageCode}.svg",
                width: 24.w(context),
                fit: BoxFit.fitWidth,
              ),
              items: [
                DropdownMenuItem(
                  value: "en",
                  child: SvgPicture.asset(
                    AppAssets.englishFlag,
                    width: 24.w(context),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                DropdownMenuItem(
                  value: "fr",
                  child: SvgPicture.asset(
                    AppAssets.frenchFlag,
                    width: 24.w(context),
                    fit: BoxFit.fitWidth,
                  ),
                )
              ],
              //On Changed language we call the changeLanguage event from our LanguageCubit and pass it the new language Value
              onChanged: (value) {
                BlocProvider.of<LanguageCubit>(Constants.globalContext)
                    .changeLanguage(Locale(value ?? "en"));
              },
            ),
          ),
          Text(
            "Let's Shop",
            style: AppStyles.title28,
            textAlign: TextAlign.center,
          ),
          //Showing the cart with the badge indicating the quantity of products added to cart
          InkWell(
            onTap: () => Navigator.of(context).pushNamed(RoutesPath.cartScreen),
            child: Badge.count(
              count: count,
              isLabelVisible: BlocProvider.of<CartBloc>(Constants.globalContext)
                  .cart
                  .isNotEmpty,
              offset: const Offset(5, -5),
              child: Icon(
                Icons.shopping_cart,
                weight: 32.w(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
