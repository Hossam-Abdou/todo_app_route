import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app_route/firebase_functions.dart';
import 'package:todo_app_route/model/task_model.dart';
import 'package:todo_app_route/view/update_task_screen.dart';
import 'package:todo_app_route/utils/app_colors.dart';

import '../app_strings.dart';

class TaskItem extends StatelessWidget {
  final TaskModel model;

  const TaskItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 105,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          extentRatio: 0.3,
          children: [
            SlidableAction(
              onPressed: (context) {
                Navigator.pushNamed(context, UpdateTaskScreen.routeName,
                    arguments: model);
              },
              label: AppStrings.edit.tr(),
              backgroundColor: Colors.blue,
              icon: Icons.edit,
              spacing: 8,
              borderRadius: BorderRadius.only(
                topRight: context.locale == const Locale('ar') ? const Radius.circular(0) : const Radius.circular(25),
                bottomRight: context.locale == const Locale('ar') ? const Radius.circular(0) : const Radius.circular(25),
                topLeft: context.locale == const Locale('ar') ? const Radius.circular(25) : const Radius.circular(0),
                bottomLeft: context.locale == const Locale('ar') ? const Radius.circular(25) : const Radius.circular(0),
              ),

            ),
          ],
        ),
        startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.3,
            children: [
              SlidableAction(
                onPressed: (context) {
                  FirebaseFunctions.deleteTask(model.id);
                },
                label: AppStrings.delete.tr(),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                spacing: 8,
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.only(
                  topLeft: context.locale == const Locale('ar') ? const Radius.circular(0) : const Radius.circular(25),
                  bottomLeft: context.locale == const Locale('ar') ? const Radius.circular(0) : const Radius.circular(25),
                  topRight: context.locale == const Locale('ar') ? const Radius.circular(25) : const Radius.circular(0),
                  bottomRight: context.locale == const Locale('ar') ? const Radius.circular(25) : const Radius.circular(0),
                ),

              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              VerticalDivider(
                thickness: 4,
                color: model.isDone ? const Color(0xff61E757) : AppColors.primary,
                indent: 5,
                endIndent: 5,
              ),
              // Container(
              //   height: 80,
              //   width: 4,
              //   decoration: BoxDecoration(
              //       color: AppColors.primary,
              //       borderRadius: BorderRadius.circular(25)),
              // ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: GoogleFonts.poppins(
                        color: model.isDone
                            ? const Color(0xff61E757)
                            : AppColors.primary,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      model.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              // Text(model.date.toString().substring(0, 10), style: TextStyle(color: AppColors.grey),),
              model.isDone
                  ? Text(
                      'Done',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff61E757),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () {
                        model.isDone = true;
                        FirebaseFunctions.updateTask(model);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Icon(
                        Icons.done,
                        color: Colors.white,
                        size: 30,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
