import 'package:flutter/material.dart';
import 'package:todo_app_route/services/shared_prefrence/cached_keys.dart';
import 'package:todo_app_route/services/shared_prefrence/sp_helper.dart';



class MyProvider extends ChangeNotifier{

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  ThemeMode mode = ThemeMode.light;

  Future<void>changeThemeMode(ThemeMode themeMode)async{
    mode= themeMode;

    await SharedPrefrenceHelper.saveData(key: CachedKeys.currentThemeMode, value: '$themeMode');
    debugPrint('the theme is : $mode');
    debugPrint('the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
    notifyListeners();
  }



  // initControllers(){
  //   titleController = TextEditingController();
  //   descriptionController = TextEditingController();
  //
  // }



}
