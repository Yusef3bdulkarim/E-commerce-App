import 'package:ecommerceapp/core/theming/custom_themes/appbar_theme.dart';
import 'package:ecommerceapp/core/theming/custom_themes/bottom_sheet_theme.dart';
import 'package:ecommerceapp/core/theming/custom_themes/check_box_theme.dart';
import 'package:ecommerceapp/core/theming/custom_themes/chip_theme.dart';
import 'package:ecommerceapp/core/theming/custom_themes/text_field_theme.dart';
import 'package:ecommerceapp/core/theming/custom_themes/text_theme.dart';
import 'package:ecommerceapp/core/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:flutter/material.dart';

class TThemeApp {
  TThemeApp._();
  static ThemeData lightThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: "",
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TAppbarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckBox,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    // outlinedButtonTheme:
    inputDecorationTheme: TTextFieldTheme.lightInputDecoration,
  );

  static ThemeData darkThemeData = ThemeData(
    useMaterial3: true,
    fontFamily: "",
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TAppbarTheme.darkAppBarTheme,
    checkboxTheme: TCheckBoxTheme.darkCheckBox,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    // outlinedButtonTheme:
    inputDecorationTheme: TTextFieldTheme.darkInputDecoration,
  );
}
