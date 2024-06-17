import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/domain/model/product_model.dart';
import 'package:lets_shop/views/product_detail/widgets/product_detail_info.dart';
import 'package:lets_shop/views/product_detail/widgets/product_header_detail.dart';
import 'package:lets_shop/views/product_detail/widgets/product_header_image.dart';
import 'package:lets_shop/views/product_detail/widgets/product_tags_list.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;
  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          context.tr(
            "product_detail.title",
          ),
          style: AppStyles.title21,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white24,
          ),
          child: Column(
            children: [
              ProductHeaderImage(
                imageUrl: product.imageUrl,
              ),
              ProductTagsList(
                tags: [
                  product.reason,
                  ...product.productDetails.flags,
                  ...product.productDetails.tags
                ],
              ),
              ProductHeaderDetail(
                product: product,
              ),
              ProductDetailInfo(
                productDetailInfo: [
                  product.productDetails.review,
                  product.productDetails.mustKnow,
                  product.productDetails.fabricant,
                  product.productDetails.longReason
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
