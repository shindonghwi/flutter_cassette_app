import 'package:cassette/presentation/ui/colors.dart';
import 'package:cassette/presentation/utils/Common.dart';
import 'package:flutter/material.dart';

class AppBarBack extends StatelessWidget implements PreferredSizeWidget {
  const AppBarBack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => Navigator.of(context).pop(true),
          child: Image.asset(
            "assets/imgs/back_24.png",
            width: 24,
            height: 24,
          ),
        ),
      ),
      backgroundColor: getColorScheme(context).bg,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 52);
}
