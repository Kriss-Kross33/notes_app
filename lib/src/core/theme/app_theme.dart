import 'package:flutter/material.dart';

/// {@template app_theme}
/// A class that manages the app's theme.
/// {@endtemplate}
class AppTheme {
  /// {@macro app_theme}
  const AppTheme._();

  /// The font family used in the app
  static const String fontFamily = 'Hero';

  /// The default theme applied in the app
  static ThemeData get defaultTheme => darkTheme;

  static const Color textColor = Color(0xFF000000);

  static const Color greyTextColor = Color(0xFF585A5B);

  static const Color dividerColor = Color(0xFFDDE1E9);

  static const Color greyAltColorAlt = Color(0xFFACADAD);

  static const Color nero = Color(0xFF252525);

  static const Color darkGrey = Color(0xFF3B3B3B);

  static const Color red = Color(0xFFFF0000);

  static const Color green = Color(0xff2fbe71);

  // static const Color lightGreen = Color(0xff2fbe71);

  static const Color pink = Color(0xFFFD99FF);
  static const Color rose = Color(0xFFFF9E9E);
  static const Color lightGreen = Color(0xFF91F48F);

  static const Color yellow = Color(0xFFFFF498);
  static const Color cyan = Color(0xFF9EFFFF);
  static const Color purple = Color(0xFFB69CFF);

  static const List<Color> cardColors = [
    pink,
    rose,
    lightGreen,
    yellow,
    cyan,
    purple,
  ];

  /// Light theme data
  static ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    useMaterial3: true,
    appBarTheme: const AppBarTheme(elevation: 0),
    dialogBackgroundColor: AppTheme.nero,
    colorScheme: const ColorScheme.light(
        // primary: AppColorConsts.fandango[6],
        // primaryContainer: AppColorConsts.fandango[4],
        // onPrimary: AppColorConsts.black[6],
        // secondary: AppColorConsts.violet[6],
        // onSecondary: AppColorConsts.white,
        ),
    scaffoldBackgroundColor: Colors.white,
    buttonTheme: _buttonThemeData,
    textTheme: _lightTextTheme,
  );

  /// Button theme data
  static const ButtonThemeData _buttonThemeData = ButtonThemeData(
    colorScheme: ColorScheme.light(
        // primary: AppColorConsts.fandango[6],
        ),
    // disabledColor: AppColorConsts.fandango[1],
  );

  /// Light text theme
  static const TextTheme _lightTextTheme = TextTheme(
    displayLarge: _lightHeadline1,
    displayMedium: _lightHeadline2,
    displaySmall: _lightHeadline3,
    headlineMedium: _lightHeadline4,
    titleMedium: _lightSubtitle1,
    titleSmall: _lightSubtitle2,
    bodyMedium: _lightBodyText2,
    bodyLarge: _lightBodyText1,
    labelLarge: _lightButtonText,
    bodySmall: _lightCaptionText,
  );

  /// Light Theme Headline 1
  static const _lightHeadline1 = TextStyle(
    fontSize: 34,
    color: textColor,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 2
  static const _lightHeadline2 = TextStyle(
    fontSize: 24,
    color: textColor,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 3
  static const _lightHeadline3 = TextStyle(
    fontSize: 20,
    color: textColor,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Headline 4
  static const _lightHeadline4 = TextStyle(
    fontSize: 18,
    color: textColor,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Subtitle 1
  static const _lightSubtitle1 = TextStyle(
    fontSize: 16,
    color: textColor,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Subtitle 2
  static const _lightSubtitle2 = TextStyle(
    fontSize: 15,
    color: textColor,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Body Text 1
  static const _lightBodyText1 = TextStyle(
    fontSize: 13,
    color: textColor,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Body Text 2
  static const _lightBodyText2 = TextStyle(
    fontSize: 12,
    color: textColor,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Button Text
  static const _lightButtonText = TextStyle(
    fontSize: 14,
    color: Colors.white,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Light Theme Caption Button Text
  static const _lightCaptionText = TextStyle(
    fontSize: 10,
    color: textColor,
    fontStyle: FontStyle.normal,
  );

  /// Dark theme data
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: fontFamily,
    dialogBackgroundColor: AppTheme.nero,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Colors.grey,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      color: nero,
    ),
    colorScheme: const ColorScheme.light(
      // primary: AppColorConsts.fandango[6],
      // primaryContainer: AppColorConsts.fandango[5],
      // secondary: AppColorConsts.violet[6],
      onSecondary: Colors.white,
    ),
    scaffoldBackgroundColor: nero,
    buttonTheme: _buttonThemeData,
    textTheme: _darkTextTheme,
  );

  /// Light text theme
  static const TextTheme _darkTextTheme = TextTheme(
    displayLarge: _darkDisplayLarge,
    displayMedium: _darkDisplayMedium,
    displaySmall: _darkDisplaySmall,
    headlineMedium: _darkHeadlineMedium,
    titleLarge: _darkTitleLarge,
    titleMedium: _darkTitleMedium,
    titleSmall: _darkTitleSmall,
    bodyLarge: _darkBodyLarge,
    bodyMedium: _darkBodyMedium,
    bodySmall: _darkBodySmall,
  );

  /// Dark Theme Headline 1
  static const _darkDisplayLarge = TextStyle(
    fontSize: 48,
    color: Colors.white,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 2
  static const _darkDisplayMedium = TextStyle(
    fontSize: 43,
    color: Colors.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 3
  static const _darkDisplaySmall = TextStyle(
    fontSize: 35,
    color: Colors.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Headline 4
  static const _darkHeadlineMedium = TextStyle(
    fontSize: 23,
    color: Colors.white,
    letterSpacing: -0.5,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Subtitle 1
  static const _darkTitleLarge = TextStyle(
    fontSize: 20,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Subtitle 1
  static const _darkTitleMedium = TextStyle(
    fontSize: 18,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Subtitle 2
  static const _darkTitleSmall = TextStyle(
    fontSize: 15,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Body Text 1
  static const _darkBodyLarge = TextStyle(
    fontSize: 13,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Body Text 2
  static const _darkBodyMedium = TextStyle(
    fontSize: 12,
    color: Colors.white,
    letterSpacing: 0,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  /// Dark Theme Caption Button Text
  static const _darkBodySmall = TextStyle(
    fontSize: 10,
    color: textColor,
    fontStyle: FontStyle.normal,
  );
}
