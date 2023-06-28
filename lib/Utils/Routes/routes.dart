import 'package:flutter/material.dart';
import 'package:mvvm_architecture/Utils/Routes/routes_name.dart';
import 'package:mvvm_architecture/View/home_view.dart';
import 'package:mvvm_architecture/View/login_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.loginView:
        return MaterialPageRoute(builder: (context) => const LoginView());

      case RouteName.homeView:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (context) =>
                const Scaffold(body: Center(child: Text('No Route Defined'))));
    }
  }
}
