import 'package:flutter/material.dart';

extension StringExtension on String {
  String toBearer() {
    return "Bearer $this";
  }

  bool isFrench(context) => toLowerCase() == 'fr';

  String toCapitalize() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    } else {
      return this;
    }
  }

  String toFirstCharacterUpperCase() {
    if (isNotEmpty) {
      return "${this[0].toUpperCase()}${substring(1)}";
    } else {
      return this;
    }
  }

  Color? toColor() {
    return Color(int.parse(replaceAll("#", "0xFF")));
  }

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalize())
      .join(' ');

  String format(List<String> args) => _interpolate(this, args);
}

String _interpolate(String string, List<String> args) {
  String result = string;
  for (int i = 0; i < args.length; i++) {
    result = result.replaceAll('%${i + 1}\$', args[i]);
  }

  return result;
}
