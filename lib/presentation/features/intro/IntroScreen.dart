import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class IntroScreen extends HookConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      body: const _MainContent(),
      bottomNavigationBar: const _BottomContent(),
    );
  }
}

class _MainContent extends StatelessWidget {
  const _MainContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
          margin: EdgeInsets.fromLTRB(40, getMediaQuery(context).size.height * 0.24, 40, 0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    getAppLocalizations(context).intro_title,
                    style: getTextTheme(context).h2_B.copyWith(
                          color: getColorScheme(context).gray80,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    getAppLocalizations(context).intro_subtitle,
                    style: getTextTheme(context).b2_R.copyWith(
                          color: getColorScheme(context).gray70,
                        ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset(
                  "assets/imgs/image_intro_cassete.png",
                  width: 250,
                  height: 250,
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _BottomContent extends StatelessWidget {
  const _BottomContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 60),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: getMediaQuery(context).size.width,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Navigator.pushNamed(context, RoutingScreen.SignUp.route);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: getColorScheme(context).mainBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  getAppLocalizations(context).common_signup,
                  style: getTextTheme(context).b1_R.copyWith(
                        color: getColorScheme(context).white,
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        getAppLocalizations(context).intro_exist_account,
                        style: getTextTheme(context).b2_R.copyWith(
                              color: getColorScheme(context).gray70,
                            ),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        getAppLocalizations(context).common_signin,
                        style: getTextTheme(context).b2_B.copyWith(
                              color: getColorScheme(context).gray70,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
