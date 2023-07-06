import 'package:cassette/navigation/PageMoveUtil.dart';
import 'package:cassette/navigation/Route.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: getColorScheme(context).black,
      body: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            nextSlideScreen(RoutingScreen.Login.route),
          );
        },
        child: Center(
          child: Center(
            child: Text("SplashScreen", style: getTextTheme(context).labelSmall,),
          ),
        ),
      ),
    );
  }
}
