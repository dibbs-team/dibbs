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
          height: 50,
          minWidth: 200,
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
          color: MyColors.teal,
          thickness: 2,
          indent: 10,
          endIndent: 10,
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
          caption: TextStyle(
            color: MyColors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.bold,
            color: MyColors.black,
          ),
        ),
        scaffoldBackgroundColor: MyColors.white);
  }
}
