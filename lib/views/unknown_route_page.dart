import 'package:flutter/material.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/widgets/appbars/appbar_backbutton.dart';

class UnKnownRoutePage extends StatelessWidget {
  const UnKnownRoutePage({
    super.key,
    this.title,
  });

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const AppBarBackButton(),
        title: Text(
          title ?? "",
          style: AppStyles.title16,
        ),
      ),
    );
  }
}
