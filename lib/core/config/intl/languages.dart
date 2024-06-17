import 'package:flutter/material.dart';

class Language {
  final String name;
  final String languageCode;
  Language({required this.name, required this.languageCode});

  static List<Language> languageList() {
    return <Language>[
      Language(name: "English", languageCode: "us"),
      Language(name: "Français", languageCode: "fr")
    ];
  }

  Locale changeLanguage(Language language, BuildContext context) {
    switch (language.name) {
      case "English":
        return Locale(language.languageCode, 'US');
      case "French":
        return Locale(language.languageCode, 'FR');

      default:
        return Locale(language.languageCode, 'US');
    }
  }
}
