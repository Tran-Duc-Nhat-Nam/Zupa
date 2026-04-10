import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'END_POINT', obfuscate: true)
  static final String endPoint = _Env.endPoint;

  @EnviedField(varName: 'GITHUB_VERSIONARTE_JSON', obfuscate: true)
  static final String gitHubVersionarteJson = _Env.gitHubVersionarteJson;

  @EnviedField(varName: 'GITHUB', obfuscate: true)
  static final String github = _Env.github;

  @EnviedField(varName: 'MODEL_NAME', obfuscate: true)
  static final String modelName = _Env.modelName;

  @EnviedField(varName: 'MODEL_URL', obfuscate: true)
  static final String modelUrl = _Env.modelUrl;

  @EnviedField(varName: 'HUGGING_FACE_TOKEN', obfuscate: true)
  static final String huggingFaceToken = _Env.huggingFaceToken;
}
