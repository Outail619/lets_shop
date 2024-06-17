import 'package:flutter/material.dart';
import 'package:lets_shop/core/config/intl/app_localization.dart';
import 'package:lets_shop/core/utils/extentions/string_extension.dart';

extension AppLocalizationExtension on BuildContext {
  AppLocalization get intl => AppLocalization.of(this);

  Locale get locale => intl.locale;

  String tr(
    String keys, {
    List<String>? args,
  }) {
    if (args?.isNotEmpty ?? false) {
      return intl.tr(keys).format(args!);
    }
    return intl.tr(keys);
  }
}
