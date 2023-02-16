import 'base_config.dart';

class DevConfig implements BaseConfig {
  @override
  String get apiHost => "https://us-central1-cm-challenges-api.cloudfunctions.net/";

  @override
  bool get reportErrors => false;

  @override
  bool get trackEvents => false;

  @override
  bool get useHttps => false;
}