import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  final double bottomHeight;
  final Widget? bottomWidget;
  final Function()? onBack;

  const AppBarBack({
    Key? key,
    this.bottomWidget,
    this.bottomHeight = 0,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onBack == null ? Navigator.pop(context) : onBack?.call(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  "assets/imgs/icon_back.png",
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      bottom: bottomWidget == null
          ? null
          : _BottomWidget(
              height: bottomHeight,
              child: bottomWidget,
            ),
      backgroundColor: getColorScheme(context).bg,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 52);
}

class _BottomWidget extends StatelessWidget implements PreferredSizeWidget {
  final Widget? child;
  final double height;

  const _BottomWidget({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child == null) const SizedBox.shrink();
    return child!;
  }

  @override
  Size get preferredSize => Size(double.infinity, height);
}
