import 'base_config.dart';
import 'dev_config.dart';
import 'prod_config.dart';

class Environment
{
  static const String envInProgress = dev;

  static const String dev = 'DEV';
  static const String prod = 'PROD';

  static final Environment _singleton = Environment._internal();
  BaseConfig? config;

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    if(environment.isEmpty){
      environment = envInProgress;
    }

    switch (environment) {
      case Environment.prod:
        return ProdConfig();
      default:
        return DevConfig();
    }
  }
}