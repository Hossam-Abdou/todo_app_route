import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/features/home/model/task_model.dart';
import 'package:todo_app_route/firebase_functions.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';
import 'package:todo_app_route/core/utils/app_strings.dart';

import '../view_model/my_provider.dart';

class UpdateTaskScreen extends StatefulWidget {
  static const String routeName = "updateTaskScreen";

  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    TaskModel model = ModalRoute.of(context)?.settings.arguments as TaskModel;
    provider.titleController.text = model.title;
    provider.descriptionController.text = model.description;
    // provider.selectedDate = DateTime.fromMillisecondsSinceEpoch(model.date);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
        ),
      ),
      body: Stack(
        children: [
          Container(
            color: AppColors.primary,
            height: 50,
            width: double.infinity,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.76,
            margin: const EdgeInsets.symmetric(horizontal: 28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppStrings.addNewTask.tr(),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 24),
                  TextFormField(
                    controller: provider.titleController,
                    decoration: InputDecoration(
                      label: Text(
                        AppStrings.title.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: provider.descriptionController,
                    decoration: InputDecoration(
                      label: Text(
                        AppStrings.description.tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(18),
                        borderSide: BorderSide(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    AppStrings.selectTime.tr(),
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  InkWell(
                    onTap: () async {
                      print(provider.selectedDate.toString().substring(0, 10));
                      selectDataFun();
                      print(provider.selectedDate.toString().substring(0, 10));
                      print(DateTime.fromMillisecondsSinceEpoch(model.date));
                    },
                    child: Text(
                      provider.selectedDate.toString().substring(0, 10),
                      // DateTime.fromMillisecondsSinceEpoch(model.date).toString().substring(0,10),
                      // selectedDate.toString().substring(0, 10),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        model.title = provider.titleController.text;
                        model.description = provider.descriptionController.text;
                        model.date = provider.selectedDate.millisecondsSinceEpoch;

                        FirebaseFunctions.updateTask(model);
                        print(
                            'after updae date ${provider.selectedDate.toString().substring(0,10)}');
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary),
                      child: Text(
                        AppStrings.saveChanges.tr(),
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectDataFun() async {
    var provider = Provider.of<MyProvider>(context,listen: false);
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: provider.selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newSelectedDate != null) {
      provider.selectedDate = newSelectedDate;
      print('Selected Date: ${provider.selectedDate}');

      setState(() {});
    }
  }
}
