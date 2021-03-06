import 'package:flutter/material.dart';

import 'my_colors.dart';
import 'my_attributes.dart';

class AppTheme {
  ThemeData get themedata {
    return ThemeData(
        primaryColor: MyColors.teal,
        accentColor: MyColors.orange,
        backgroundColor: MyColors.white,
        fontFamily: 'SF-Pro-Text',
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: MyAttributes.borderRadius),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            padding: MyAttributes.buttonPadding,
            minimumSize: Size(
              200.0,
              50.0,
            ),
            primary: MyColors.black,
            side: BorderSide(
              color: MyColors.teal,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: MyAttributes.borderRadius,
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: MyColors.teal,
            padding: MyAttributes.buttonPadding,
            minimumSize: Size(
              200.0,
              50.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: MyAttributes.borderRadius,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: MyAttributes.buttonPadding,
            minimumSize: Size(
              200.0,
              70.0,
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        iconTheme: IconThemeData(color: MyColors.black),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyColors.teal,
          elevation: 0,
          selectedItemColor: MyColors.white,
          unselectedItemColor: MyColors.lightTeal,
          type: BottomNavigationBarType.fixed,
        ),
        dividerTheme: DividerThemeData(
          thickness: 1.0,
          space: 36.0,
        ),
        appBarTheme: AppBarTheme(
          color: MyColors.white,
          elevation: 0,
          iconTheme: IconThemeData(
            color: MyColors.black,
          ),
          actionsIconTheme: IconThemeData(
            color: MyColors.black,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontFamily: 'SF-Pro-Display',
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: MyColors.black,
            ),
          ),
        ),
        textTheme: TextTheme(
          //* Heading
          headline1: TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          //* Text Heading
          headline2: TextStyle(
            fontFamily: 'SF-Pro-Display',
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          //* Body Text
          bodyText1: TextStyle(
            fontFamily: 'SF-Pro-Text',
            color: MyColors.black,
            fontSize: 15.0,
          ),
          //* Emphasised Ingress
          bodyText2: TextStyle(
            fontFamily: 'SF-Pro-Text',
            color: MyColors.black,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: MyColors.white);
  }
}
