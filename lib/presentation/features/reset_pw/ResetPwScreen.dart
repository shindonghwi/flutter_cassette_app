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

class ResetPwScreen extends HookConsumerWidget {
  const ResetPwScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEmailValidate = useState(false);

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
                getAppLocalizations(context).reset_pw_title,
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
            const Expanded(child: SizedBox()),
            FillButton.rect(
              content: Text(
                getAppLocalizations(context).reset_pw_send_email,
                style: getTextTheme(context).h3_R.copyWith(
                      color: isEmailValidate.value
                          ? getColorScheme(context).white
                          : getColorScheme(context).gray50,
                    ),
              ),
              isActivated: isEmailValidate.value,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
