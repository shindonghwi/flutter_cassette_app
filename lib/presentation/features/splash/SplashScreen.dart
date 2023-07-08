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
        Future.delayed(const Duration(seconds: 2), (){
          Navigator.push(
            context,
            nextFadeInOutScreen(RoutingScreen.Login.route),
          );
        });
      });
      return null;
    }, []);

    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      body: Stack(
        children: [
          Container(
            width: getMediaQuery(context).size.width,
            height: getMediaQuery(context).size.height * 0.32,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFF7C96FC).withOpacity(0.8),
                const Color(0xFF4C6DEC).withOpacity(0.0),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(0, getMediaQuery(context).size.height * 0.3, 0, 0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset("assets/imgs/image_splash.png"),
            ),
          )
        ],
      ),
    );
  }
}
