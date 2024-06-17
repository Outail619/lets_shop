import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';

class CounterView extends StatelessWidget {
  final int number;
  final void Function() increaseCallback;
  final void Function() decreaseCallback;
  const CounterView({
    super.key,
    required this.number,
    required this.increaseCallback,
    required this.decreaseCallback,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w(context)),
        height: 32.h(context),
        width: 72.w(context),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
            border: Border.all(color: AppColors.primaryColor, width: 0.4)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _CounterButtonWidget(
                icon: Icons.remove, onPressed: decreaseCallback),
            Text(
              number.toString(),
              style: AppStyles.contentStyle,
            ),
            _CounterButtonWidget(icon: Icons.add, onPressed: increaseCallback),
          ],
        ),
      );
}

class _CounterButtonWidget extends StatelessWidget {
  final IconData icon;
  final void Function() onPressed;

  const _CounterButtonWidget({required this.icon, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      constraints: const BoxConstraints(minWidth: 16.0, minHeight: 16.0),
      onPressed: onPressed,
      elevation: 2.0,
      fillColor: Colors.white,
      shape: const CircleBorder(),
      child: Icon(
        icon,
        color: AppColors.primaryColor,
        size: 12.0,
      ),
    );
  }
}
