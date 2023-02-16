import '../router/routes.dart';
import 'package:flutter/cupertino.dart';
import 'environment.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Constants {
  static const String nameApp = 'Prueba Coordinadora';
  static final String apiUrl = Environment().config!.apiHost;
  static final GlobalKey<NavigatorState> navigatorKey =
    GlobalKey<NavigatorState>();
  static final goTo = navigatorKey.currentState!;
  static final AppLocalizations labels =
    AppLocalizations.of(navigatorKey.currentContext!);
  static final assetsUrl = AssetsUrl();

   static final Routes routes = Routes();
}

class AssetsUrl{
  String get iconAppBar => 'assets/images/icon_app_bar.png';

  String get loader => 'assets/images/loader.gif';
}