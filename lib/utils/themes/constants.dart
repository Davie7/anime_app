import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Constants {
  //App related strings
  static String appName = "Manga App";

  //Colors for theme
  static Color lightPrimary = Color(0xfff3f4f9);
  static Color darkPrimary = Color(0xff2B2B2B);
  static Color lightAccent = Color(0xffffb102);
  static Color darkAccent = Color(0xffffb102);
  static Color lightBG = Color(0xfff3f4f9);
  static Color darkBG = Color(0xff2B2B2B);
  
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
    primary: lightPrimary,
    secondary: lightAccent,
    background: lightBG,
  ),
  scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      toolbarTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
    primary: darkPrimary,
    secondary: darkAccent,
    background: darkBG,
  ),
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightBG,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
      toolbarTextStyle: TextStyle(
        color: lightBG,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    ),
  );

  static List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }
}

class ThemeNotifier with ChangeNotifier{
  bool _darkTheme = false;
  SharedPreferences? _preferences;

  bool get darkTheme => _darkTheme;

  ThemeNotifier(){
    _loadSettingsFromPrefs();
  }

  _initializePrefs()async{
    if (_preferences == null){
      _preferences =await SharedPreferences.getInstance();
    }
  }

  _loadSettingsFromPrefs()async{
    await _initializePrefs();
    _darkTheme = _preferences?.getBool('darkTheme') ?? false;
    notifyListeners();
  }

  _saveSettingsToPrefs()async{
    await _initializePrefs();
    _preferences?.setBool('darkTheme', _darkTheme);
  }

  void toggleTheme(){
    _darkTheme = !_darkTheme;
    _saveSettingsToPrefs();
    notifyListeners();
  }
}
