import 'package:flutter/material.dart';


extension StyleColor on ColorScheme{

  Color get colorUIBackground => brightness == Brightness.light ? white : white;

  Color get black => brightness == Brightness.light ? Color(0xFF000000) : Color(0xFF000000);
  Color get white => brightness == Brightness.light ? Color(0xFFFFFFFF) : Color(0xFFFFFFFF);

}