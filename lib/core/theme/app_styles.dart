import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/utils/constants.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';

class AppStyles {
  AppStyles._();

  static final title28 = TextStyle(
    color: AppColors.titleColor,
    fontFamily: "Stolzl",
    fontSize: 28.dp(Constants.globalContext),
    fontWeight: FontWeight.w500,
  );
  static final title21 = TextStyle(
    color: AppColors.titleColor,
    fontFamily: "Stolzl",
    fontSize: 21.dp(Constants.globalContext),
    fontWeight: FontWeight.w500,
  );
  static final title16 = TextStyle(
    color: AppColors.titleColor,
    fontWeight: FontWeight.w400,
    fontSize: 16.dp(Constants.globalContext),
  );

  static final title14 = TextStyle(
    color: AppColors.textPrimaryColor,
    fontFamily: "Stolzl",
    fontSize: 14.dp(Constants.globalContext),
    fontWeight: FontWeight.w400,
  );

  static final contentStyle = TextStyle(
    fontSize: 12.dp(Constants.globalContext),
    fontFamily: "Stolzl",
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondaryColor,
  );

  static final settingsSectionTextStyle = TextStyle(
    color: AppColors.textTertiaryColor,
    fontSize: 11.dp(Constants.globalContext),
    fontWeight: FontWeight.w400,
  );
  static final settingsItemTextStyle = TextStyle(
    color: AppColors.textPrimaryColor,
    fontFamily: "Stolzl",
    fontSize: 14.dp(Constants.globalContext),
    fontWeight: FontWeight.w400,
  );
}
