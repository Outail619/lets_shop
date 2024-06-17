import 'package:lets_shop/core/config/env/app_env_fields.dart';
import 'package:lets_shop/core/config/env/env.dev.dart';

import 'flavor_enum.dart';

class FlavorConfig {
  FlavorConfig({
    required this.flavor,
    required this.hostBaseUrl,
  });

  final Flavor flavor;
  final String hostBaseUrl;

  factory FlavorConfig.fromEnv(
    Flavor flavor,
    AppEnvFields env,
  ) =>
      FlavorConfig(
        flavor: flavor,
        hostBaseUrl: env.hostBaseUrl,
      );

  factory FlavorConfig.dev() => FlavorConfig.fromEnv(
        Flavor.dev,
        DevEnv(),
      );

  static FlavorConfig? _instance;

  static void setFlavorAndEnv(
    Flavor flavor,
    AppEnvFields env,
  ) =>
      _instance = FlavorConfig.fromEnv(flavor, env);

  static void setFlavor(FlavorConfig flavor) => _instance = flavor;

  static FlavorConfig get instance => _instance!;

  static bool isDev() => _instance?.flavor == Flavor.dev;
}
