import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architecture/View/home_screen.dart';
import 'package:mvvm_architecture/View/login_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginScreen:
        return MaterialPageRoute(builder: (context) => const LoginScreen());

      case RouteName.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text('No Route Defined'))));
    }
  }
}
