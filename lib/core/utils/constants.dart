import 'package:flutter/material.dart';
import 'package:lets_shop/core/config/storage/hive_data_storage.dart';

class Constants {
  Constants._();

  static final GlobalKey<NavigatorState> globalKey =
      GlobalKey<NavigatorState>();

  static BuildContext get globalContext => globalKey.currentState!.context;

  static HiveDataStorage localStorage = HiveDataStorage();
}
