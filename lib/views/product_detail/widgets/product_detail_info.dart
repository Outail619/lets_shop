import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';

class ProductDetailInfo extends StatefulWidget {
  final List<String> productDetailInfo;
  const ProductDetailInfo({super.key, required this.productDetailInfo});

  @override
  State<ProductDetailInfo> createState() => _ProductDetailInfoState();
}

class _ProductDetailInfoState extends State<ProductDetailInfo>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int index = 0;
  @override
  void initState() {
    _tabController =
        TabController(length: widget.productDetailInfo.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacings.xxl,
      ),
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabAlignment: TabAlignment.center,
            automaticIndicatorColorAdjustment: true,
            indicatorColor: const Color.fromARGB(255, 241, 178, 151),
            labelPadding: const EdgeInsets.symmetric(horizontal: 16),
            indicatorSize: TabBarIndicatorSize.tab,
            isScrollable: true,
            onTap: (value) {
              setState(() {
                index = value;
              });
            },
            tabs: widget.productDetailInfo
                .map(
                  (info) => Tab(
                    child: Text(
                      context.tr(
                          "product_detail.chip_${widget.productDetailInfo.indexOf(info)}"),
                      style: AppStyles.title14,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(
            height: AppSpacings.lg,
          ),
          Text(
            widget.productDetailInfo[index],
            style: AppStyles.contentStyle,
          )
        ],
      ),
    );
  }
}
