import 'package:cassette/presentation/features/login/LoginScreen.dart';
import 'package:cassette/presentation/features/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

enum RoutingScreen {
  Splash(route: "/splash"), // 스플래시
  Login(route: "/login"); // 로그인

  final String route;

  const RoutingScreen({
    required this.route,
  });

  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      RoutingScreen.Splash.route: (context) => const SplashScreen(),
      RoutingScreen.Login.route: (context) => const LoginScreen(),
    };
  }

  static getScreen(String route, {dynamic parameter}) {
    debugPrint("getScreen : parameter: $parameter");
    switch (route) {
      case "/splash":
        return const SplashScreen();
      case "/login":
        return const LoginScreen();
      default:
        return const LoginScreen();
    }
  }
}
