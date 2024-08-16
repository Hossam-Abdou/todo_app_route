import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/firebase_functions.dart';
import 'package:todo_app_route/model/task_model.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/utils/app_strings.dart';
import 'package:todo_app_route/view_model/providers/my_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppStrings.addNewTask.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 24),
          TextFormField(
            style: TextStyle(
              color: provider.mode == ThemeMode.dark? Colors.white: Colors.black,
            ),
            controller: provider.titleController,
            decoration: InputDecoration(
              label: Text(
                AppStrings.title.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : AppColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : AppColors.primary)),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          TextFormField(
            controller: provider.descriptionController,
            style: TextStyle(
              color: provider.mode == ThemeMode.dark? Colors.white: Colors.black,
            ),
            decoration: InputDecoration(
              label: Text(
                AppStrings.description.tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : AppColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide(
                      color: provider.mode == ThemeMode.dark
                          ? Colors.white
                          : AppColors.primary)),
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
            onTap: () {
              selectDataFun();
            },
            child: Text(
              selectedDate.toString().substring(0, 10),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: AppColors.primary,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          ElevatedButton(
            onPressed: () {
              TaskModel? model = TaskModel(
                title: provider.titleController.text,
                description: provider.descriptionController.text,
                date: selectedDate.millisecondsSinceEpoch,
              );
              FirebaseFunctions.addTask(model);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
            child: Text(
              AppStrings.addTask.tr(),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }

  void selectDataFun() async {
    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (newSelectedDate != null) {
      setState(() {
        selectedDate = newSelectedDate;
        setState(() {

        });
      });
    }
  }
}
