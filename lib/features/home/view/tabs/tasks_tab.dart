import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';
import 'package:todo_app_route/core/utils/component/task_item.dart';
import 'package:todo_app_route/features/home/view_model/my_provider.dart';
import 'package:todo_app_route/firebase_functions.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          CalendarTimeline(

            height: MediaQuery.sizeOf(context).height * 0.13,
            showYears: true,
            initialDate: provider.dateTime,
            firstDate: DateTime.now().subtract(
              const Duration(days: 365),
            ),
            lastDate: DateTime.now().add(
              const Duration(days: 365),
            ),
            onDateSelected: (date) {
              provider.changeDateTime(date);
            },
            monthColor: AppColors.grey,
            dayColor: AppColors.primary,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: AppColors.primary,
            dotColor: Colors.white,
            locale: context.locale == const Locale('ar') ? 'ar' : 'en',
          ),
          const SizedBox(height: 24),
          StreamBuilder(
              stream: FirebaseFunctions.getTasks(provider.dateTime),
              builder: (context, snapshot) {
                var tasks =
                    snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (tasks.isEmpty) {
                  return const Center(
                    child: Text("No Tasks"),
                  );
                }
                return ListView.separated(
                  itemCount: tasks.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return TaskItem(
                      model: tasks[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                );
              }),
        ],
      ),
    );
  }
}
