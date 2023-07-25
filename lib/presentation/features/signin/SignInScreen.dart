import 'package:cassette/navigation/PageMoveUtil.dart';
import 'package:cassette/navigation/Route.dart';
import 'package:cassette/presentation/components/appbar/AppBarBack.dart';
import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/components/textfield/OutlineTextField.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInScreen extends HookConsumerWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmailValidate = useState(false);
    final isPwValidate = useState(false);

    return Scaffold(
      backgroundColor: getColorScheme(context).bg,
      appBar: const AppBarBack(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(
                getAppLocalizations(context).common_signin,
                style: getTextTheme(context).h2_R.copyWith(
                      color: getColorScheme(context).gray80,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 28, 0, 0),
              child: Text(
                getAppLocalizations(context).common_email,
                style: getTextTheme(context).b2_B.copyWith(
                      color: getColorScheme(context).gray60,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: OutlineTextField(
                  controller: useTextEditingController(),
                  hint: getAppLocalizations(context).text_field_hint_email,
                  successMessage: getAppLocalizations(context).text_field_success_email,
                  errorMessage: getAppLocalizations(context).text_field_error_email,
                  showCheckButton: false,
                  checkRegList: const [
                    RegCheckType.Email,
                  ],
                  onChanged: (text) {
                    isEmailValidate.value = RegUtil.checkEmail(text);
                  }),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Text(
                getAppLocalizations(context).common_pw,
                style: getTextTheme(context).b2_B.copyWith(
                      color: getColorScheme(context).gray60,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
              child: OutlineTextField(
                controller: useTextEditingController(),
                hint: getAppLocalizations(context).text_field_hint_pw1,
                successMessage: getAppLocalizations(context).text_field_success_pw1,
                errorMessage: getAppLocalizations(context).text_field_error_pw1,
                showPwVisibleButton: true,
                showCheckButton: false,
                textInputType: TextInputType.visiblePassword,
                checkRegList: const [
                  RegCheckType.PW,
                ],
                onChanged: (text) {
                  isPwValidate.value = RegUtil.checkPw(text);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          getAppLocalizations(context).signin_find_pw,
                          style: getTextTheme(context).b2_R.copyWith(
                                color: getColorScheme(context).gray50,
                              ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 1,
                    height: 16,
                    color: getColorScheme(context).gray30,
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          nextSlideScreen(RoutingScreen.SignUp.route),
                        );
                      },
                      borderRadius: BorderRadius.circular(4),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          getAppLocalizations(context).common_signup,
                          style: getTextTheme(context).b2_R.copyWith(
                            color: getColorScheme(context).gray50,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            FillButton.rect(
              content: Text(
                getAppLocalizations(context).common_signin,
                style: getTextTheme(context).h3_R.copyWith(
                      color: isEmailValidate.value && isPwValidate.value
                          ? getColorScheme(context).white
                          : getColorScheme(context).gray50,
                    ),
              ),
              isActivated: isEmailValidate.value && isPwValidate.value,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
