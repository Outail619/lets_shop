import 'package:lets_shop/core/config/flavors/flavor_config.dart';
import 'package:lets_shop/main.dart';

void main() async {
  // Load dev environment file content
  FlavorConfig.setFlavor(FlavorConfig.dev());

  mainCommon();
}
