import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_shop/core/theme/app_assets.dart';
import 'package:lets_shop/core/theme/app_colors.dart';

class AppBarBackButton extends StatelessWidget {
  const AppBarBackButton({
    super.key,
    this.onBackPressed,
    this.iconPath = AppAssets.chevronLeftArrow,
  });

  factory AppBarBackButton.withClose() => const AppBarBackButton(
        iconPath: AppAssets.closeIcon,
      );

  factory AppBarBackButton.withArrow() => const AppBarBackButton(
        iconPath: AppAssets.chevronLeftArrow,
      );

  final String iconPath;
  final VoidCallback? onBackPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onBackPressed ?? () => Navigator.pop(context),
      icon: SvgPicture.asset(
        iconPath,
        colorFilter: const ColorFilter.mode(
          AppColors.titleColor,
          BlendMode.srcIn,
        ),
        width: 24,
        height: 24,
      ),
    );
  }
}
