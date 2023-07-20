import 'package:cassette/presentation/features/intro/IntroScreen.dart';
import 'package:cassette/presentation/features/signin/SignInScreen.dart';
import 'package:cassette/presentation/features/signup/SignUpScreen.dart';
import 'package:cassette/presentation/features/splash/SplashScreen.dart';
import 'package:flutter/material.dart';

enum RoutingScreen {
  Splash(route: "/splash"), // 스플래시
  Intro(route: "/intro"), // 인트로
  SignIn(route: "/signin"), // 로그인
  SignUp(route: "/signup"); // 회원가입

  final String route;

  const RoutingScreen({
    required this.route,
  });

  static Map<String, WidgetBuilder> getAppRoutes() {
    return {
      RoutingScreen.Splash.route: (context) => const SplashScreen(),
      RoutingScreen.Intro.route: (context) => const IntroScreen(),
      RoutingScreen.SignIn.route: (context) => const SignInScreen(),
      RoutingScreen.SignUp.route: (context) => const SignUpScreen(),
    };
  }

  static getScreen(String route, {dynamic parameter}) {
    debugPrint("getScreen : parameter: $parameter");
    switch (route) {
      case "/splash":
        return const SplashScreen();
      case "/intro":
        return const IntroScreen();
      case "/signin":
        return const SignInScreen();
      case "/signup":
        return const SignUpScreen();
      default:
        return const SignInScreen();
    }
  }
}
