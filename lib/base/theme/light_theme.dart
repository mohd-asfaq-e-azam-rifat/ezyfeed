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
    foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
    backgroundColor: WidgetStateProperty.all<Color>(colorPrimary),
    overlayColor: WidgetStateProperty.all<Color>(
      Colors.white.withValues(alpha: 0.1),
    ),
    shape: WidgetStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  ),
);

final _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorGray4;
        } else {
          return colorText2;
        }
      },
    ),
    backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
    overlayColor: WidgetStateProperty.all<Color>(
      colorPrimary.withValues(alpha: 0.1),
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
    foregroundColor: WidgetStateProperty.resolveWith<Color>(
      (Set<WidgetState> states) {
        if (states.contains(WidgetState.disabled)) {
          return colorDisabled2;
        } else {
          return colorText2;
        }
      },
    ),
  ),
);

const _bottomSheetThemeData = BottomSheetThemeData(
  backgroundColor: colorAccent,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(20.0),
      topLeft: Radius.circular(20.0),
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