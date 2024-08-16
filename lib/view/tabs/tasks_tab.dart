import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_route/firebase_functions.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/utils/component/task_item.dart';


class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CalendarTimeline(height: 70,
            showYears: true,
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 365)),
            lastDate: DateTime.now().add(const Duration(days: 365)),
            onDateSelected: (date) => debugPrint('date  $date'),
            monthColor: AppColors.grey,
            dayColor: AppColors.primary,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            dotColor: Colors.white,
            locale:context.locale == const Locale('ar')? 'ar' : 'en',
          ),
          const SizedBox(height: 24),
          StreamBuilder(
              stream: FirebaseFunctions.getTasks(),
              builder: (context, snapshot) {
                var tasks = snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (tasks.isEmpty) {
                  return const Center(
                    child: Text("No Tasks"),
                  );

                }
                return   ListView.separated(
                  itemCount: tasks.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TaskItem(model: tasks[index],);
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
      
                );
              }
          ),
      
        ],
      ),
    );
  }
}
