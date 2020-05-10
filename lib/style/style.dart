import 'package:flutter/material.dart';

/// Defines the color palette
const Color brown = Color.fromRGBO(138, 61, 45, 1);
const Color orangeRed = Color.fromRGBO(249, 116, 73, 1);
const Color red = Color.fromRGBO(243, 82, 53, 1);
const Color deepBlue = Color.fromRGBO(8, 105, 147, 1);
const Color darkBlue = Color.fromRGBO(8, 67, 93, 1);
const Color lightBlue = Color.fromRGBO(137, 197, 204, 1);
const Color white = Colors.white;
const Color lightGrey = Color.fromRGBO(246, 242, 233, 1);

ThemeData lightTheme = ThemeData(
  canvasColor: lightGrey,
  scaffoldBackgroundColor: lightGrey,
  primaryColorDark: lightGrey,
  primaryColorLight: deepBlue,
  accentColor: orangeRed,
  fontFamily: 'Nunito',
  iconTheme: IconThemeData(
    color: orangeRed,
    size: 30,
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    minWidth: 234,
    height: 52,
    buttonColor: lightGrey,
    splashColor: white,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontWeight: FontWeight.w700,
      color: deepBlue,
      fontSize: 24,
    ),

    /// Title of the app
    headline1: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 137,
      color: deepBlue,
    ),

    /// Regular page title
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      fontStyle: FontStyle.italic,
      color: deepBlue,
    ),

    /// regular text
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      color: deepBlue,
    ),

    /// italic text
    bodyText2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.italic,
      color: deepBlue,
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  canvasColor: darkBlue,
  scaffoldBackgroundColor: darkBlue,
  primaryColorDark: lightGrey,
  primaryColorLight: deepBlue,
  accentColor: deepBlue,
  fontFamily: 'Nunito',
  iconTheme: IconThemeData(
    color: lightGrey,
    size: 30,
  ),
  buttonTheme: ButtonThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    minWidth: 234,
    height: 52,
    buttonColor: darkBlue,
    splashColor: deepBlue,
  ),
  textTheme: TextTheme(
    button: TextStyle(
      fontWeight: FontWeight.w700,
      color: lightGrey,
      fontSize: 24,
    ),

    /// Title of the app
    headline1: TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 137,
      color: deepBlue,
    ),

    /// Regular page title
    headline2: TextStyle(
      fontWeight: FontWeight.w700,
      fontSize: 30,
      fontStyle: FontStyle.italic,
      color: lightGrey,
    ),

    /// regular text
    bodyText1: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      color: lightGrey,
    ),

    /// italic text
    bodyText2: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w200,
      fontStyle: FontStyle.italic,
      color: lightGrey,
    ),
  ),
);
