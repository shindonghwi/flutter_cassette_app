import 'package:cassette/navigation/PageMoveUtil.dart';
import 'package:cassette/navigation/Route.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.push(
            context,
            nextFadeInOutScreen(RoutingScreen.Intro.route),
          );
        });
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      body: Stack(
        children: [
          Image.asset("assets/imgs/image_splash.png", fit: BoxFit.cover),
          Center(
            child: Image.asset(
              "assets/imgs/image_logo_text.png",
              width: 144,
              height: 36,
            ),
          )
        ],
      ),
    );
  }
}