import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OutlineTextField extends HookWidget {
  final String successMessage;
  final String errorMessage;
  final List<RegCheckType> checkRegList;
  final bool showCheckButton;
  final Function(String)? onChanged;

  const OutlineTextField({
    Key? key,
    this.successMessage = '',
    this.errorMessage = '',
    this.checkRegList = const [],
    this.showCheckButton = true,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    final isSuccess = useState<bool?>(null);

    return TextField(
      controller: controller,
      onChanged: (text) {
        for (var element in checkRegList) {
          if (element == RegCheckType.Email) {
            isSuccess.value = RegUtil.checkEmail(text);
          }
        }
        onChanged?.call(text);
      },
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: getAppLocalizations(context).text_field_hint_email,
        hintStyle: getTextTheme(context).b1_R.copyWith(
              color: getColorScheme(context).gray40,
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: getColorScheme(context).bg2,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: getColorScheme(context).mainBlue,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 12,
        ),
        suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 24),
        counter: null,
        counterText: '',
        helperText: isSuccess.value == true && successMessage.isNotEmpty ? successMessage : null,
        helperStyle: getTextTheme(context).b2_R.copyWith(
              color: getColorScheme(context).mainBlue,
            ),
        errorText: isSuccess.value == false && errorMessage.isNotEmpty ? errorMessage : null,
        errorStyle: getTextTheme(context).b2_R.copyWith(
              color: getColorScheme(context).subRed,
            ),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showCheckButton)
                Image.asset(
                  isSuccess.value == true ? "assets/imgs/icon_check_on.png" : "assets/imgs/icon_check_off.png",
                  width: 24,
                  height: 24,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
