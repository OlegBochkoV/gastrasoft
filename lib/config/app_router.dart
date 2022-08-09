import 'package:flutter/material.dart';
import 'package:gastra_soft/home/home_page.dart';

class AppRouter {
  static const homePage = '/homePage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return null;
    }
  }
}
