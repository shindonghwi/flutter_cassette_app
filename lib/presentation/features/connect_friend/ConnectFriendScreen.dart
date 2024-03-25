import 'package:cassette/presentation/components/appbar/AppBarClose.dart';
import 'package:cassette/presentation/components/scroll_sheet/ScrollSheetContainer.dart';
import 'package:cassette/presentation/components/textfield/OutlineTextField.dart';
import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ConnectFriendScreen extends HookWidget {
  const ConnectFriendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ScrollSheetContainer(
      appbar: AppBarClose(),
      fixedWidget: _ConnectFriendFixContent(),
    );
  }
}

/// 고정 영역
class _ConnectFriendFixContent extends HookWidget {
  const _ConnectFriendFixContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            getAppLocalizations(context).connect_friend_title,
            style: getTextTheme(context).h2_B.copyWith(
                  color: getColorScheme(context).gray80,
                ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
            child: Text(
              getAppLocalizations(context).connect_friend_my_invite_code_title,
              style: getTextTheme(context).b1_R.copyWith(
                    color: getColorScheme(context).gray80,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  child: OutlineTextField(
                    controller: useTextEditingController(),
                    hint: getAppLocalizations(context).connect_friend_my_invite_code_hint,
                    showCheckButton: false,
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    onChanged: (text) {},
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: getColorScheme(context).mainBlue,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: const EdgeInsets.only(left: 8),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
                        child: Text(
                          getAppLocalizations(context).common_copy,
                          style: getTextTheme(context).b1_R.copyWith(
                                color: getColorScheme(context).white,
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
            child: Text(
              getAppLocalizations(context).connect_friend_received_invite_code_title,
              style: getTextTheme(context).b1_R.copyWith(
                    color: getColorScheme(context).gray80,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
            child: OutlineTextField(
              controller: useTextEditingController(),
              hint: getAppLocalizations(context).connect_friend_received_invite_code_hint,
              showCheckButton: false,
              textInputType: TextInputType.text,
              textInputAction: TextInputAction.done,
              onChanged: (text) {},
            ),
          )
        ],
      ),
    );
  }
}
