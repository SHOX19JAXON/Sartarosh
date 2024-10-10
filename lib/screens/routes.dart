import 'package:flutter/material.dart';
import 'package:sartarosh/screens/auth/login/login_screen.dart';
import 'package:sartarosh/screens/auth/register/register_screen.dart';

import 'package:sartarosh/screens/home_screen/home_screen.dart';
import 'package:sartarosh/screens/tap_box_screen/tab_box_screen.dart';

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.homeScreen:
        return navigate(const HomeScreen());
      case RouteNames.TabBox1:
        return navigate(const TabBox1());
      case RouteNames.login:
        return navigate(const LoginScreen());
      case RouteNames.signup:
        return navigate(const RegisterScreen());

      default:
        return navigate(
          const Scaffold(
            body: Center(
              child: Text(
                "This kind of route does not exist!",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        );
    }
  }

  static navigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}

class RouteNames {
  static const String HomeScreen = "/homeScreen";
  static const String BarbersScreen = "/BarbersScreen";
  static const String GenerateScreen = "/GenerateScreen";
  static const String TabBox1 = "/TabBox1";
  static const String homeScreen = "/homeScreen";
  static const String login = '/login';
  static const String signup = '/signup';
}

// class RouteNames {
//   static const String QrScannerScreen = "/QrScannerScreen";
//   static const String HistoryScreen = "/HistoryScreen";
//   static const String GenerateScreen = "/GenerateScreen";
//   static const String TabBox1 = "/TabBox1";
//   static const String homeScreen = "/homeScreen";
//
// }
