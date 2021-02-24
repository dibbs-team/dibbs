import 'package:flutter/material.dart';

import 'my_colors.dart';
import 'my_attributes.dart';

class AppTheme {
  ThemeData get themedata {
    return ThemeData(
        primaryColor: MyColors.teal,
        accentColor: MyColors.orange,
        backgroundColor: MyColors.white,
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
              color: MyColors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          headline3: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          headline4: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
          bodyText1: TextStyle(
            color: MyColors.black,
            fontSize: 18.0,
          ),
          bodyText2: TextStyle(
            color: MyColors.black,
            fontSize: 14.0,
          ),
          subtitle1: TextStyle(
            fontSize: 16.0,
            color: MyColors.black,
          ),
          subtitle2: TextStyle(
            fontSize: 12.0,
            color: MyColors.black,
          ),
          caption: TextStyle(
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        scaffoldBackgroundColor: MyColors.white);
  }
}
