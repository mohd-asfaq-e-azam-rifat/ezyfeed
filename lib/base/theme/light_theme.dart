import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightTheme = ThemeData(
  fontFamily: "Roboto",
  primaryColor: colorPrimary,
  appBarTheme: _appBarTheme,
  scaffoldBackgroundColor: Colors.white,
  textSelectionTheme: _textSelectionTheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  outlinedButtonTheme: _outlinedButtonThemeData,
  textButtonTheme: _textButtonThemeData,
  brightness: Brightness.light,
  bottomSheetTheme: _bottomSheetThemeData,
  dialogTheme: _dialogThemeData,
  useMaterial3: false,
);

const _appBarTheme = AppBarTheme(
  backgroundColor: colorPrimary,
  foregroundColor: Colors.white,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ),
);

const _textSelectionTheme = TextSelectionThemeData(
  selectionHandleColor: Colors.transparent,
);

final _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
    backgroundColor: MaterialStateProperty.all<Color>(colorPrimary),
    overlayColor: MaterialStateProperty.all<Color>(
      Colors.white.withOpacity(0.1),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  ),
);

final _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorGray4;
        } else {
          return colorText2;
        }
      },
    ),
    backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
    overlayColor: MaterialStateProperty.all<Color>(
      colorPrimary.withOpacity(0.1),
    ),
    side: MaterialStateProperty.all<BorderSide>(
      const BorderSide(
        color: colorGray6,
      ),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
    ),
  ),
);

final _textButtonThemeData = TextButtonThemeData(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.resolveWith<Color>(
      (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return colorDisabled2;
        } else {
          return colorText2;
        }
      },
    ),
  ),
);

const _bottomSheetThemeData = BottomSheetThemeData(
  backgroundColor: colorPrimary,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(4.0),
      topLeft: Radius.circular(4.0),
    ),
  ),
);

const _dialogThemeData = DialogTheme(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  ),
);

const _textTheme = TextTheme(
  displayLarge: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w700,
    fontSize: 57.0,
    height: 1.1228,
  ),
  displayMedium: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w700,
    fontSize: 45.0,
    height: 1.1555,
  ),
  displaySmall: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
    height: 1.2222,
  ),
  headlineLarge: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    height: 1.25,
  ),
  headlineMedium: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 28.0,
    height: 1.29,
  ),
  headlineSmall: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    height: 1.33,
    fontSize: 24.0,
  ),
  titleLarge: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 22.0,
    height: 1.2727,
  ),
  titleMedium: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.1,
  ),
  labelLarge: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.33,
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 11.0,
    height: 1.4545,
  ),
  bodyLarge: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontFamily: fontFamilyRoboto,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.3333,
    letterSpacing: 0.4,
  ),
);
