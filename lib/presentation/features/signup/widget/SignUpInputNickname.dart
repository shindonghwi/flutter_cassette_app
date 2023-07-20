import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';

class SignUpInputNickname extends StatelessWidget {
  const SignUpInputNickname({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 32, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getAppLocalizations(context).signup_input_nickname_title,
            style: getTextTheme(context).h1_R.copyWith(
                  color: getColorScheme(context).gray80,
                ),
          ),
        ],
      ),
    );
  }
}
