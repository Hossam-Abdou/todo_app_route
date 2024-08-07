import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app_route/update_task_screen.dart';
import 'package:todo_app_route/utils/app_colors.dart';

import 'utils/app_strings.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 115,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Slidable(
        startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.6,
            children: [
              SlidableAction(
                onPressed: (context) {},
                label: AppStrings.delete.tr(),
                backgroundColor: Colors.red,
                icon: Icons.delete,
                spacing: 8,
                padding: EdgeInsets.zero,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
              ),
              SlidableAction(
                onPressed: (context) {
                  Navigator.pushNamed(context, UpdateTaskScreen.routeName);
                },
                label: AppStrings.edit.tr(),
                backgroundColor: Colors.blue,
                icon: Icons.edit,
                spacing: 8,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              VerticalDivider(
                thickness: 4,
                color: AppColors.primary,
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
                      "Task Title",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primary,
                      ),
                    ),
                    Text(
                      "Task Description",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12))),
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
