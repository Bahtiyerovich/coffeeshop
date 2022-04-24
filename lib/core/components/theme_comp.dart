import 'package:coffii/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class ThemeComp {
  static ThemeData get myTheme => ThemeData(
        colorScheme: const ColorScheme.light(
          primary: ColorConst.kPrimary,
        ),
        backgroundColor: ColorConst.ivory,
        // tooltipTheme: TooltipThemeData(decoration: ) 
      );
}
