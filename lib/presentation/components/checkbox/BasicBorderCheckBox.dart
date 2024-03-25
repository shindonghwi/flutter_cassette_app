import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasicBorderCheckBox extends HookWidget {
  final bool isChecked;
  final Function(bool) onChange;

  const BasicBorderCheckBox({
    Key? key,
    required this.isChecked,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () => onChange(!isChecked),
        child: Image.asset(
          isChecked ? "assets/imgs/icon_checkround_on.png" : "assets/imgs/icon_checkround_off.png",
          width: 24,
          height: 24,
        ),
      ),
    );
  }
}
