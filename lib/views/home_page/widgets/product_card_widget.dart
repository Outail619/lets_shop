import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lets_shop/core/config/app_routes.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';
import 'package:lets_shop/domain/model/product_model.dart';

class ProductCardWidget extends StatelessWidget {
  final Product productInfo;
  final VoidCallback addToCart;

  const ProductCardWidget(
      {super.key, required this.productInfo, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context)
          .pushNamed(RoutesPath.productDetail, arguments: productInfo),
      child: Padding(
        padding: const EdgeInsets.only(
          right: AppSpacings.md,
          left: AppSpacings.md,
        ),
        child: Stack(
          //fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            //The container that will hold the product's information
            Container(
              clipBehavior: Clip.hardEdge,
              height: 240.h(context),
              width: 164.w(context),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(8),
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                  bottomRight: Radius.circular(8),
                ),
                color: Colors.white24,
                gradient: LinearGradient(
                  colors: [
                    Colors.orangeAccent,
                    Colors.orangeAccent,
                    Colors.orangeAccent,
                    Colors.yellow.shade100,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: AppSpacings.md,
                    right: AppSpacings.md,
                    bottom: AppSpacings.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 80.h(context),
                    ),
                    //product's title
                    Text(
                      productInfo.title,
                      textAlign: TextAlign.left,
                      style: AppStyles.title14
                          .copyWith(fontWeight: FontWeight.w500),
                      maxLines: 3,
                    ),
                    //A spacer to keep the padding between the title and the rest of the info dynamic
                    const Spacer(),
                    Row(
                      children: [
                        //The product's price converted from French Cent into Euro
                        Text("${productInfo.price.convertFrenchCentToEuro()}€"),
                        const SizedBox(
                          width: AppSpacings.lg,
                        ),
                        //The add to cart button
                        Expanded(
                          child: InkWell(
                            onTap: addToCart,
                            child: Container(
                              height: 32.h(context),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(48),
                                border: Border.all(
                                  color: Colors.white12,
                                ),
                                color: Colors.white,
                              ),
                              child: Text(
                                context.tr("homepage.add"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            //Product Image which will be positioned outside the component
            Positioned(
              top: -40.h(context),
              left: 24.w(context),
              child: CachedNetworkImage(
                imageUrl: productInfo.imageUrl,
                fit: BoxFit.cover,
                height: 120.h(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
