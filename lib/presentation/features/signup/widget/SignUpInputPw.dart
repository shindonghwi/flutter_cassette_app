import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/components/textfield/OutlineTextField.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpInputPw extends HookWidget {
  final TabController controller;

  const SignUpInputPw({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSuccess = useState(false);

    final pw1 = useState('');
    final pw2 = useState('');

    void checkPassword() {
      isSuccess.value = RegUtil.checkPw(pw1.value) && RegUtil.checkPw(pw2.value) && pw1.value == pw2.value;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Text(
            getAppLocalizations(context).signup_input_pw_title,
            style: getTextTheme(context).h1_R.copyWith(
                  color: getColorScheme(context).gray80,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: OutlineTextField(
            hint: getAppLocalizations(context).text_field_hint_pw1,
            successMessage: getAppLocalizations(context).text_field_success_pw1,
            errorMessage: getAppLocalizations(context).text_field_error_pw1,
            checkRegList: const [
              RegCheckType.PW,
            ],
            showPwVisibleButton: true,
            textInputAction: TextInputAction.next,
            textInputType: TextInputType.visiblePassword,
            onChanged: (text) {
              pw1.value = text;
              checkPassword();
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: OutlineTextField(
            hint: getAppLocalizations(context).text_field_hint_pw2,
            successMessage: getAppLocalizations(context).text_field_success_pw2,
            errorMessage: getAppLocalizations(context).text_field_error_pw2,
            checkRegList: const [
              RegCheckType.PW,
            ],
            forceErrorCheck: pw1.value != pw2.value,
            showPwVisibleButton: true,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            onChanged: (text) {
              pw2.value = text;
              checkPassword();
            },
          ),
        ),
        const Expanded(child: SizedBox()),
        FillButton.rect(
          content: Text(
            getAppLocalizations(context).common_next,
            style: getTextTheme(context).h3_R.copyWith(
                  color: isSuccess.value ? getColorScheme(context).white : getColorScheme(context).gray50,
                ),
          ),
          isActivated: isSuccess.value,
          onPressed: () => controller.animateTo(2),
        )
      ],
    );
  }
}
