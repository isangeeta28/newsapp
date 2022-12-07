import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  SharedPreferences? _prefs;
  bool? _darkTheme;
  bool? get dark => _darkTheme;

  ThemeNotifier() {
    _darkTheme = true;
    _loadfromPrefs();
  }
  toggleTheme(){
    _darkTheme = !_darkTheme!;
    _saveToPrefs();
    notifyListeners();
  }


  _loadfromPrefs()async{
    _darkTheme = _prefs?.getBool(key);
    notifyListeners();
  }
  _saveToPrefs()async{
    _prefs!.setBool(key, _darkTheme!);
  }
}