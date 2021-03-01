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
        buttonTheme: ButtonThemeData(
          buttonColor: MyColors.teal,
          padding: MyAttributes.buttonPadding,
          height: 50.0,
          minWidth: 200.0,
          //* I strongly recommend that we continue using the primary attribute
          //* since this will automatically detect the best color for the text.
          //* (johanehinger)
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: MyAttributes.borderRadius,
            side: BorderSide(
              color: MyColors.teal,
            ),
          ),
        ),
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
              side: BorderSide(
                color: MyColors.teal,
              ),
            ),
          ),
        ),
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
