import 'base_config.dart';

class ProdConfig implements BaseConfig {
  @override
  String get apiHost => "https://us-central1-cm-challenges-api.cloudfunctions.net/";

  @override
  bool get reportErrors => true;

  @override
  bool get trackEvents => true;

  @override
  bool get useHttps => true;
}