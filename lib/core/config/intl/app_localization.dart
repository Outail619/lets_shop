import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization({
    required this.locale,
  });

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  Map<String, dynamic>? _localizedValues;

  Future loadLanguage() async {
    String contentValues =
        await rootBundle.loadString("assets/intl/${locale.languageCode}.json");

    Map<String, dynamic> mappedValues = json.decode(contentValues);
    _localizedValues = mappedValues;
    return this;
  }

  String tr(String keys) {
    if (keys.contains(".")) {
      final keysList = keys.split(".");
      return getTranslatedValue(keysList[0], keysList[1]) ?? "";
    }
    return "";
  }

  String? getTranslatedValue(String screenName, String key) {
    return _localizedValues![screenName][key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();

  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('fr', 'FR'),
  ];
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["en", "fr"].contains(locale.languageCode.toLowerCase());
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    return await (AppLocalization(locale: locale)).loadLanguage();
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
