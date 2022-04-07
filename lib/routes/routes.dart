import 'package:flutter/material.dart';
import 'package:login_flutter_example/presentation/pages/home_page.dart';
import 'package:login_flutter_example/presentation/pages/login_page.dart';
import 'package:login_flutter_example/presentation/pages/profile_page.dart';

class AppRoutes {
  AppRoutes._();

  static const HOME_ROUTE = '/';
  static const LOGIN_ROUTE = '/login';
  static const PROFILE_ROUTE = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HOME_ROUTE:
        return MaterialPageRoute(builder: (_) => const HomePage());

      case LOGIN_ROUTE:
        return MaterialPageRoute(builder: (_) => const LoginPage());

      case PROFILE_ROUTE:
        return MaterialPageRoute(builder: (_) => const ProfilePage());

      default:
        // Return a default 404 page
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('Route not found'),
                  ),
                ));
    }
  }
}
