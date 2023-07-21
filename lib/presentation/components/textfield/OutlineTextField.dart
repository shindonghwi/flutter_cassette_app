import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:cassette/presentation/utils/RegUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class OutlineTextField extends HookWidget {
  final String hint;
  final String successMessage;
  final String errorMessage;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<RegCheckType> checkRegList;
  final bool showCheckButton;
  final bool showPwVisibleButton;
  final bool forceErrorCheck;
  final Function(String)? onChanged;

  const OutlineTextField({
    Key? key,
    required this.hint,
    this.successMessage = '',
    this.errorMessage = '',
    this.checkRegList = const [],
    this.showCheckButton = true,
    this.showPwVisibleButton = false,
    this.forceErrorCheck = false,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    final isSuccess = useState<bool?>(null);

    final isPwVisible = useState(false);

    return TextField(
      controller: controller,
      onChanged: (text) {
        for (var element in checkRegList) {
          if (element == RegCheckType.Email) {
            isSuccess.value = RegUtil.checkEmail(text);
          }
          if (element == RegCheckType.PW) {
            isSuccess.value = RegUtil.checkPw(text);
          }
          if (element == RegCheckType.Nickname) {
            isSuccess.value = RegUtil.checkNickname(text);
          }
        }

        if (isSuccess.value == false && forceErrorCheck) {
          isSuccess.value = forceErrorCheck;
        }

        onChanged?.call(text);
      },
      obscureText: isPwVisible.value ? false : textInputType == TextInputType.visiblePassword,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        isCollapsed: true,
        hintText: hint,
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
        errorText: forceErrorCheck || isSuccess.value == false && errorMessage.isNotEmpty ? errorMessage : null,
        errorStyle: getTextTheme(context).b2_R.copyWith(
              color: getColorScheme(context).subRed,
            ),
        suffixIcon: Container(
          margin: const EdgeInsets.only(right: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (showPwVisibleButton)
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => isPwVisible.value = !isPwVisible.value,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.asset(
                        isSuccess.value == true ? "assets/imgs/icon_view.png" : "assets/imgs/icon_view.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                ),
              if (showCheckButton)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: Image.asset(
                    isSuccess.value == true ? "assets/imgs/icon_check_on.png" : "assets/imgs/icon_check_off.png",
                    width: 24,
                    height: 24,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
