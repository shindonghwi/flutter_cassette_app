import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/ui/typography.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FillButton extends HookWidget {
  final Widget? content;
  final bool isActivated;
  final Function()? onPressed;
  final double borderRadius;

  const FillButton({
    Key? key,
    required this.content,
    required this.isActivated,
    this.onPressed,
    this.borderRadius = 0,
  }) : super(key: key);

  const FillButton.round({
    Key? key,
    required this.content,
    required this.isActivated,
    this.onPressed,
  })  : borderRadius = 8,
        super(key: key);

  const FillButton.rect({
    Key? key,
    required this.content,
    required this.isActivated,
    this.onPressed,
  })  : borderRadius = 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getMediaQuery(context).size.width,
      height: 52,
      child: ElevatedButton(
        onPressed: isActivated ? () => onPressed?.call() :  null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: getColorScheme(context).gray30,
          backgroundColor: isActivated ? getColorScheme(context).mainBlue : getColorScheme(context).gray30,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        ),
        child: content,
      ),
    );
  }
}
