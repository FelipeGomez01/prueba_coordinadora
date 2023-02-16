import 'package:flutter/material.dart';

class AppTheme
{
  static const primary = Style(
    dark: Color(0xFFE3E3E3),
    main: Color(0xFF223D79),
    light: Color(0xFFF2F2F2)
  );

  static const success = Color(0xFFAAB70C);

  static const danger = Color(0xFFDB5051);

  static const warning = Color(0xFFEA9000);

  static const info = Color(0xFF0196D1);

  static const textColor = Colors.black;

  static ThemeData get themeData => ThemeData(
    colorScheme: ColorScheme.fromSwatch().copyWith(primary: primary.main),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: primary.main,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))
      )
    ),
    unselectedWidgetColor: Colors.white,
    textTheme: textTheme,
    inputDecorationTheme: inputDecorationTheme
  );

  static InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    labelStyle: textTheme.subtitle1,
    floatingLabelStyle: textTheme.subtitle1!.copyWith(fontSize: 18),
    hintStyle: textTheme.bodyText1,
    border: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(35)),
      borderSide: BorderSide(color: AppTheme.primary.main)
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(35)),
      borderSide: BorderSide(color: AppTheme.primary.main)
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: const BorderRadius.all(Radius.circular(35)),
      borderSide: BorderSide(
        color: AppTheme.primary.main
      )
    ),
    iconColor: Colors.white
  );

  static TextTheme get textTheme => const TextTheme(
    headline1: TextStyle(
      color: textColor,
      fontSize: 32,
      fontWeight: FontWeight.bold
    ),
    headline2: TextStyle(
      color: textColor,
      fontSize: 32
    ),
    headline3: TextStyle(
      color: textColor,
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
    headline4: TextStyle(
      color: textColor,
      fontSize: 27
    ),
    headline5: TextStyle(
      color: textColor,
      fontSize: 22,
      fontWeight: FontWeight.bold
    ),
    headline6: TextStyle(
      color: textColor,
      fontSize: 20
    ),
    subtitle1: TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.bold
    ),
    subtitle2: TextStyle(
      color: textColor,
      fontSize: 16
    ),
    bodyText1: TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w700
    ),
    bodyText2: TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w500
    ),
    button: TextStyle(
      color: textColor,
      fontSize: 14,
      fontWeight: FontWeight.w700
    ),
    caption: TextStyle(
      color: textColor,
      fontSize: 11
    ),
    overline: TextStyle(
      color: textColor,
      fontSize: 10
    )
  );
}

class Style {
  const Style({required this.dark, required this.main, required this.light});

  final Color dark;
  final Color main;
  final Color light;
}