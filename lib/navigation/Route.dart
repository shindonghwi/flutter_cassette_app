import 'package:cassette/presentation/features/intro/IntroScreen.dart';
import 'package:cassette/presentation/features/login/LoginScreen.dart';
import 'package:cassette/presentation/features/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

enum RoutingScreen {
  Splash(route: "/splash"), // 스플래시
  Login(route: "/login"), // 인트로
  Intro(route: "/intro"); // 로그인

  final String route;

  const RoutingScreen({
    required this.route,
  });

  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      RoutingScreen.Splash.route: (context) => const SplashScreen(),
      RoutingScreen.Login.route: (context) => const LoginScreen(),
      RoutingScreen.Intro.route: (context) => const IntroScreen(),
    };
  }

  static getScreen(String route, {dynamic parameter}) {
    debugPrint("getScreen : parameter: $parameter");
    switch (route) {
      case "/splash":
        return const SplashScreen();
      case "/login":
        return const LoginScreen();
      case "/intro":
        return const IntroScreen();
      default:
        return const LoginScreen();
    }
  }
}
