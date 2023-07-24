import 'package:cassette/presentation/components/appbar/AppBarBack.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      appBar: const AppBarBack(),
      body: Center(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pop();
          },
          child: Center(
            child: Text("LoginScreen"),
          ),
        ),
      ),
    );
  }
}
