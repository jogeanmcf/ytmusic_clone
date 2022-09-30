import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  bool isDarkMode = true;

  ThemeData get getTheme => isDarkMode ? MyThemeData.dark : MyThemeData.light;
}

mixin MyThemeData implements ThemeData {
  static ThemeData dark = ThemeData(
      primaryColor: Colors.white,
      focusColor: Colors.white,
      indicatorColor: Colors.white,
      textTheme: const TextTheme(
          // displayMedium: TextStyle(color: Colors.white),
          headline1: TextStyle(color: Colors.white),
          headline2: TextStyle(color: Colors.white),
          headline3: TextStyle(color: Colors.white),
          headline4: TextStyle(color: Colors.white),
          headline5: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
          caption: TextStyle(color: Colors.white)
          // bodyMedium: TextStyle(color: Colors.white),
          ),
      appBarTheme:
          const AppBarTheme(elevation: 0, backgroundColor: Colors.transparent),
      scaffoldBackgroundColor: Colors.black,
      primaryTextTheme:
          const TextTheme(overline: TextStyle(color: Color(0xFFfefefe))),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(color: Colors.white),
          unselectedLabelStyle: TextStyle(color: Colors.white),
          selectedIconTheme: IconThemeData(color: Colors.white),
          unselectedIconTheme: IconThemeData(color: Colors.white),
          selectedItemColor: Colors.white, // doesn't seem to change anyting
          unselectedItemColor: Color(0xFFdddddd),
          backgroundColor: Color(0xFF1d1d1d)),
      chipTheme: const ChipThemeData(
        selectedColor: Colors.white,
        // secondarySelectedColor: Colors.red,
      ),
      inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.only(top: 6, left: 12),
          isCollapsed: false,
          filled: true,
          fillColor: Color(0xFF1a1a1a),
          // contentPadding: EdgeInsets.all(8),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(30))),

          // floatingLabelAlignment: FloatingLabelAlignment.center,
          hintStyle: TextStyle(color: Color.fromARGB(255, 87, 87, 87)),
          labelStyle: TextStyle(color: Color.fromARGB(255, 87, 87, 87))),
      listTileTheme: const ListTileThemeData(
        textColor: Colors.white,
        iconColor: Colors.white,
      ),
      dividerColor: const Color.fromARGB(255, 87, 87, 87),
      tabBarTheme: TabBarTheme(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.6)));

  static ThemeData light = ThemeData();
}
