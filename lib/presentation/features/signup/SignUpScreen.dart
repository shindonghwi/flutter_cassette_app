import 'package:cassette/presentation/components/appbar/AppBarBack.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputEmail.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputNickname.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputPw.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Tab> tabs = [
      Tab(text: 'Tab 1'),
      Tab(text: 'Tab 2'),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        backgroundColor: getColorScheme(context).bg,
        appBar: const AppBarBack(),
        body: TabBarView(
          children: [
            SignUpInputEmail(),
            SignUpInputPw(),
            SignUpInputNickname(),
          ],
        ),
      ),
    );
  }
}

class AnimatedDivider extends HookWidget {
  final double percent;
  final Color color;

  const AnimatedDivider({super.key, required this.percent, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double targetWidth = percent * screenWidth;
    double remainingWidth = screenWidth - targetWidth;

    final controller = useAnimationController(duration: Duration(milliseconds: 500));
    final animation = useAnimation(Tween<double>(begin: 0, end: targetWidth).animate(controller));

    useEffect(() {
      controller.forward(from: 0);
      return () => controller.dispose();
    }, []);

    return Container(
      width: screenWidth,
      height: 2.0,
      color: Colors.grey, // Gray color for the empty space
      child: Stack(
        children: [
          Positioned(
            left: 0,
            child: Container(
              width: animation,
              height: 2.0,
              color: color,
            ),
          ),
          Positioned(
            right: 0,
            child: Container(
              width: remainingWidth,
              height: 2.0,
              color: Colors.grey, // Gray color for the remaining empty space
            ),
          ),
        ],
      ),
    );
  }
}