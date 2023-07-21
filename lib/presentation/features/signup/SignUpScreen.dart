import 'package:cassette/presentation/components/appbar/AppBarBack.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputEmail.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputNickname.dart';
import 'package:cassette/presentation/features/signup/widget/SignUpInputPw.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpScreen extends HookWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTabController(initialLength: 3, initialIndex: 0);

    final List<Widget> tabs = [
      SignUpInputEmail(controller: controller),
      SignUpInputPw(controller: controller),
      SignUpInputNickname(controller: controller),
    ];

    final currentTabIndex = useState(-1);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Future.delayed(const Duration(milliseconds: 250), () {
          currentTabIndex.value = 0;
        });

        controller.addListener(() {
          currentTabIndex.value = controller.index;
        });
      });
      return () => controller.dispose;
    }, []);

    return WillPopScope(
      onWillPop: () async {
        if (currentTabIndex.value == 0) {
          return true;
        } else {
          controller.animateTo(currentTabIndex.value - 1);
          return false;
        }
      },
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: getColorScheme(context).bg,
          appBar: AppBarBack(
            bottomHeight: 1,
            bottomWidget: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: currentTabIndex.value / tabs.length,
                end: (currentTabIndex.value + 1) / tabs.length,
              ),
              builder: (context, value, _) => SizedBox(
                height: 2,
                child: LinearProgressIndicator(
                  value: value,
                  color: getColorScheme(context).mainBlue,
                  backgroundColor: getColorScheme(context).bg2,
                ),
              ),
            ),
            onBack: () {
              if (currentTabIndex.value == 0) {
                Navigator.pop(context);
              } else {
                controller.animateTo(currentTabIndex.value - 1);
              }
            },
          ),
          body: SafeArea(
            child: TabBarView(
              controller: controller,
              children: tabs.map((e) => e).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
