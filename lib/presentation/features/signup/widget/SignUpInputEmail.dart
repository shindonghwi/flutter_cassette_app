import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/components/textfield/OutlineTextField.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpInputEmail extends HookWidget {
  final TabController controller;
  final TextEditingController textEditingController;

  const SignUpInputEmail({
    Key? key,
    required this.controller,
    required this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSuccess = useState(false);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
          child: Text(
            getAppLocalizations(context).signup_input_email_title,
            style: getTextTheme(context).h1_R.copyWith(
                  color: getColorScheme(context).gray80,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: OutlineTextField(
            controller: textEditingController,
            hint: getAppLocalizations(context).text_field_hint_email,
            successMessage: getAppLocalizations(context).text_field_success_email,
            errorMessage: getAppLocalizations(context).text_field_error_email,
            checkRegList: const [
              RegCheckType.Email,
            ],
            onChanged: (text) => isSuccess.value = RegUtil.checkEmail(text),
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
          onPressed: () => controller.animateTo(1),
        )
      ],
    );
  }
}
