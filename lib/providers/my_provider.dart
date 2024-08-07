import 'package:flutter/material.dart';



class MyProvider extends ChangeNotifier{


  ThemeMode mode = ThemeMode.light;

  Future<void>changeThemeMode(ThemeMode themeMode)async{
    mode= themeMode;

    // await SharedPrefrenceHelper.saveData(key: CachedKeys.currentThemeMode, value: '${themeMode}');
    // print('the theme is : ${mode}');
    // print('the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
    notifyListeners();
  }





}
