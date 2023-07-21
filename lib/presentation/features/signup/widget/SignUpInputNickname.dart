import 'package:cassette/presentation/components/bottom_sheet/BottomSheetPolicyAgree.dart';
import 'package:cassette/presentation/components/bottom_sheet/CommonBottomSheet.dart';
import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/components/textfield/OutlineTextField.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignUpInputNickname extends HookWidget {
  final TabController controller;

  const SignUpInputNickname({
    Key? key,
    required this.controller,
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
            hint: getAppLocalizations(context).text_field_hint_nickname,
            successMessage: getAppLocalizations(context).text_field_success_nickname,
            errorMessage: getAppLocalizations(context).text_field_error_nickname,
            checkRegList: const [
              RegCheckType.Nickname,
            ],
            onChanged: (text) => isSuccess.value = RegUtil.checkNickname(text),
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
          onPressed: () => CommonBottomSheet.showBottomSheet(
            context,
            child: BottomSheetPolicyAgree(
              confirmCallback: () => Navigator.of(context).pop(true),
            ),
          ),
        )
      ],
    );
  }
}
