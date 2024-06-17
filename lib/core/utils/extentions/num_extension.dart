import 'package:flutter/material.dart';

extension NumExtension on num {
  double h(BuildContext context) {
    var val = ((this * 100) / 812) / 100;

    return (MediaQuery.sizeOf(context).height * val).roundToDouble();
  }

  double w(BuildContext context) {
    var val = ((this * 100) / 375) / 100;
    return (MediaQuery.sizeOf(context).width * val).roundToDouble();
  }

  double dp(BuildContext context) {
    return (this * (MediaQuery.sizeOf(context).width / 375)).roundToDouble();
  }

  double convertFrenchCentToEuro() {
    return this / 100.0;
  }
}
