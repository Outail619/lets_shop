import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/theme/app_spacings.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';

class ProductTagsList extends StatelessWidget {
  final List<String> tags;
  const ProductTagsList({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.h(context),
      child: ListView.builder(
        itemCount: tags.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding:
              EdgeInsets.only(left: index == 0 ? AppSpacings.xxl : 4, right: 4),
          child: Chip(
              backgroundColor: Colors.white,
              side: const BorderSide(color: AppColors.primaryColor, width: 0.4),
              shape: const StadiumBorder(),
              label: Text(
                tags[index],
                style: AppStyles.settingsItemTextStyle,
              )),
        ),
      ),
    );
  }
}
