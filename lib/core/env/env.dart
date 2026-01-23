import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'END_POINT', obfuscate: true)
  static final String endPoint = _Env.endPoint;
}