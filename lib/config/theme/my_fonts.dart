import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../app/data/local/my_shared_pref.dart';
import '../translations/localization_service.dart';

// todo configure text family and size
class MyFonts
{
  // return the right font depending on app language
  static TextStyle get getAppFontType => LocalizationService.supportedLanguagesFontsFamilies[MySharedPref.getCurrentLocal().languageCode]!;

  // headlines text font
  static TextStyle get headlineTextStyle => getAppFontType;

  // body text font
  static TextStyle get bodyTextStyle => getAppFontType;

  // button text font
  static TextStyle get buttonTextStyle => getAppFontType;

  // app bar text font
  static TextStyle get appBarTextStyle  => getAppFontType;

  // chips text font
  static TextStyle get chipTextStyle  => getAppFontType;

  // appbar font size
  static double get appBarTittleSize => 18.sp;

  // body font size
  static double get body1TextSize => 16.sp;
  static double get body2TextSize => 14.sp;

  // headlines font size
  static double get headline1TextSize => 28.sp;
  static double get headline2TextSize => 24.sp;
  static double get headline3TextSize => 20.sp;
  static double get headline4TextSize => 18.sp;
  static double get headline5TextSize => 16.sp;
  static double get headline6TextSize => 14.sp;

  //button font size
  static double get buttonTextSize => 16.sp;

  //caption font size
  static double get captionTextSize => 12.sp;

  //chip font size
  static double get chipTextSize => 10.sp;
}