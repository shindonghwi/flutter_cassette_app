import 'dart:io';

import 'package:cassette/navigation/Route.dart';
import 'package:flutter/cupertino.dart';

PageRoute nextSlideScreen(String route, {dynamic parameter, bool isFullScreen = false}) {
  if (Platform.isIOS) {
    return CupertinoPageRoute(
      builder: (context) => RoutingScreen.getScreen(route, parameter: parameter),
      fullscreenDialog: isFullScreen,
    );
  } else {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => RoutingScreen.getScreen(route, parameter: parameter),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      fullscreenDialog: isFullScreen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween(begin: const Offset(1.0, 0.0), end: const Offset(0.0, 0.0)).animate(animation),
          child: child,
        );
      },
    );
  }
}

PageRoute nextFadeInOutScreen(String route, {dynamic parameter, bool isFullScreen = false}) {
  return PageRouteBuilder(
    transitionDuration: const Duration(milliseconds: 250),
    pageBuilder: (context, animation, secondaryAnimation) => RoutingScreen.getScreen(route, parameter: parameter),
    reverseTransitionDuration: const Duration(milliseconds: 250),
    fullscreenDialog: true,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
