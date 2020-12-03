import 'package:flutter/material.dart';

import 'my_colors.dart';

class AppTheme {

  final BorderRadius buttonBorderRadius = BorderRadius.circular(16.0);
  final EdgeInsets mainButtonPadding = EdgeInsets.all(12.0);

  ThemeData get themedata {
    return ThemeData(
        backgroundColor: MyColors.white,
        buttonTheme: ButtonThemeData(
          buttonColor: MyColors.darkGreen,
          padding: mainButtonPadding,
          height: 50,
          minWidth: 200,
          //* I strongly recommend that we continue using the primary attribute
          //* since this will automatically detect the best color for the text. 
          //* (johanehinger)
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: buttonBorderRadius,
            side: BorderSide(
              color: MyColors.darkGreen,
            ),
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: MyColors.white,
          elevation: 0,
          selectedItemColor: MyColors.darkGreen,
          unselectedItemColor: MyColors.grey,
          type: BottomNavigationBarType.fixed,
        ),
        dividerTheme: DividerThemeData(
          color: MyColors.darkGreen,
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
        scaffoldBackgroundColor: MyColors.white);
  }
}
