import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'theme/theme.dart';
import 'config/constants.dart';
import 'router/router.dart';
import 'config/environment.dart';
import 'core/di/blocs_di.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  const String environment = String.fromEnvironment('ENVIRONMENT');

  Environment().initConfig(environment);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiBlocProvider(providers: BlocsDI.instance, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: Constants.navigatorKey,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.routes,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('es', '419')
      ]
    );
  }
}