import 'package:envied/envied.dart';
import 'package:lets_shop/core/config/env/app_env_fields.dart';

part 'env.dev.g.dart';

//Using Envied, we'll create a class per flavor, we implement AppEnvFields and finally we add the required attributes.
//Never forget to add the Envied Annotation on the class and on the attribute so it maps everything with the .env file
@Envied(path: '.env.dev', obfuscate: true, name: "Env")
final class DevEnv implements AppEnvFields {
  @override
  @EnviedField(varName: 'HOST_BASE_URL')
  final String hostBaseUrl = _Env.hostBaseUrl;
}
