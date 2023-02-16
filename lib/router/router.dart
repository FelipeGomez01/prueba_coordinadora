import '../features/detail/presentation/screens/detail_screen.dart';
import '../config/constants.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static final String initialRoute = Constants.routes.home;

  static Map<String, WidgetBuilder> routes = {
    Constants.routes.home      : (_) => const HomeScreen(),
    Constants.routes.detail      : (_) => const DetailScreen()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomeScreen());
  }
}