import 'package:cassette/presentation/components/button/FillButton.dart';
import 'package:cassette/presentation/components/checkbox/BasicBorderCheckBox.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BottomSheetPolicyAgree extends HookWidget {
  final Function() confirmCallback;

  const BottomSheetPolicyAgree({
    Key? key,
    required this.confirmCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isAgreeAll = useState<bool>(false);
    final isPolicy_1 = useState<bool>(false);
    final isPolicy_2 = useState<bool>(false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: getColorScheme(context).bg2,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  isAgreeAll.value = !isAgreeAll.value;
                  isPolicy_1.value = isAgreeAll.value;
                  isPolicy_2.value = isAgreeAll.value;
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getAppLocalizations(context).bottom_sheet_policy_agree_all,
                        style: getTextTheme(context).h3_R.copyWith(
                              color: getColorScheme(context).gray80,
                            ),
                      ),
                      IgnorePointer(
                        child: BasicBorderCheckBox(
                          isChecked: isAgreeAll.value,
                          onChange: (_) {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 27,
          ),
          _TermItem(
            title: getAppLocalizations(context).bottom_sheet_policy_use,
            isChecked: isPolicy_1.value,
            onChange: (value) {
              isPolicy_1.value = value;
              isAgreeAll.value = isPolicy_1.value && isPolicy_2.value;
            },
          ),
          _TermItem(
            title: getAppLocalizations(context).bottom_sheet_policy_individual,
            isChecked: isPolicy_2.value,
            onChange: (value) {
              isPolicy_2.value = value;
              isAgreeAll.value = isPolicy_1.value && isPolicy_2.value;
            },
          ),
          const SizedBox(
            height: 24,
          ),
          FillButton.round(
            content: Text(
              getAppLocalizations(context).common_confirm,
              style: getTextTheme(context).h3_R.copyWith(
                    color: isAgreeAll.value ? getColorScheme(context).white : getColorScheme(context).gray50,
                  ),
            ),
            isActivated: isAgreeAll.value,
            onPressed: () => confirmCallback(),
          )
        ],
      ),
    );
  }
}

class _TermItem extends HookWidget {
  final String title;
  final bool isChecked;
  final Function(bool) onChange;

  const _TermItem({
    Key? key,
    required this.title,
    required this.isChecked,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => onChange(!isChecked),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    isChecked ? "assets/imgs/icon_check_on.png" : "assets/imgs/icon_check_off.png",
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    title,
                    style: getTextTheme(context).h3_R.copyWith(
                          color: getColorScheme(context).gray80,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4, bottom: 4),
              child: Image.asset(
                "assets/imgs/icon_next.png",
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
