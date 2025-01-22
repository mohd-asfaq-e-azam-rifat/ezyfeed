import 'package:ezyfeed/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final lightTheme = ThemeData(
  fontFamily: fontFamilyFigtree,
  primaryColor: colorPrimary,
  appBarTheme: _appBarTheme,
  scaffoldBackgroundColor: colorPageBackground,
  textSelectionTheme: _textSelectionTheme,
  elevatedButtonTheme: _elevatedButtonThemeData,
  outlinedButtonTheme: _outlinedButtonThemeData,
  textButtonTheme: _textButtonThemeData,
  brightness: Brightness.light,
  bottomSheetTheme: _bottomSheetThemeData,
  dialogTheme: _dialogThemeData,
  useMaterial3: false,
  navigationBarTheme: _navigationBarThemeData,
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
    systemNavigationBarDividerColor: Colors.transparent,
  ),
);

const _textSelectionTheme = TextSelectionThemeData(
  selectionHandleColor: Colors.transparent,
  cursorColor: colorPrimary,
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
        borderRadius: BorderRadius.circular(8.0),
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
    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    overlayColor: WidgetStateProperty.all<Color>(
      colorPrimary.withOpacity(0.1),
    ),
    side: WidgetStateProperty.all<BorderSide>(
      const BorderSide(
        color: colorGray6,
      ),
    ),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
);

final _navigationBarThemeData = NavigationBarThemeData(
  labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
    (Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return textStyleBottomBarItemSelected;
      } else {
        return textStyleBottomBarItemNotSelected;
      }
    },
  ),
  backgroundColor: colorBottomBarBackground,
  indicatorColor: Colors.transparent,
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
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w700,
    fontSize: 57.0,
    height: 1.1228,
  ),
  displayMedium: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w700,
    fontSize: 45.0,
    height: 1.1555,
  ),
  displaySmall: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 36.0,
    height: 1.2222,
  ),
  headlineLarge: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 32.0,
    height: 1.25,
  ),
  headlineMedium: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 28.0,
    height: 1.29,
  ),
  headlineSmall: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    height: 1.33,
    fontSize: 24.0,
  ),
  titleLarge: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 22.0,
    height: 1.2727,
  ),
  titleMedium: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.15,
  ),
  titleSmall: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.1,
  ),
  labelLarge: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.1,
  ),
  labelMedium: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    height: 1.33,
    letterSpacing: 0.5,
  ),
  labelSmall: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w600,
    fontSize: 11.0,
    height: 1.4545,
  ),
  bodyLarge: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.5,
    letterSpacing: 0.5,
  ),
  bodyMedium: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.4285,
    letterSpacing: 0.25,
  ),
  bodySmall: TextStyle(
    fontFamily: fontFamilyFigtree,
    color: colorText1,
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.3333,
    letterSpacing: 0.4,
  ),
);
