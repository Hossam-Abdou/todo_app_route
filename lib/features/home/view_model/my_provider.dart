import 'package:flutter/material.dart';
import 'package:todo_app_route/core/services/shared_prefrence/cached_keys.dart';
import 'package:todo_app_route/core/services/shared_prefrence/sp_helper.dart';
import 'package:todo_app_route/features/home/model/task_model.dart';
import 'package:todo_app_route/firebase_functions.dart';


class MyProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TaskModel? taskModel;
  ThemeMode mode = ThemeMode.light;
  DateTime selectedDate = DateTime.now();
  DateTime dateTime = DateTime.now();
  changeDateTime(DateTime date) {
    dateTime = date;
    notifyListeners();
  }

  Future<void> changeThemeMode(ThemeMode themeMode) async {
    mode = themeMode;
    await SharedPrefrenceHelper.saveData(
        key: CachedKeys.currentThemeMode, value: '${themeMode}');
    debugPrint('the theme is : ${mode}');
    debugPrint(
        'the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
    notifyListeners();
  }

  addTask(){
    TaskModel? model = TaskModel(
      title: titleController.text,
      description: descriptionController.text,
      date: DateUtils.dateOnly(selectedDate!).millisecondsSinceEpoch,
    );
    FirebaseFunctions.addTask(model);
    notifyListeners();
  }

  void selectDataFun(BuildContext context) async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newSelectedDate != null) {
      selectedDate = newSelectedDate;
      print('Selected Date: $selectedDate');


      notifyListeners();
    }

  }

}
