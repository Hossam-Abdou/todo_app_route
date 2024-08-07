import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/task_item.dart';


class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CalendarTimeline(
          showYears: true,
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) => debugPrint('date  $date'),
          leftMargin: 15,
          monthColor: AppColors.grey,
          dayColor: AppColors.primary,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColors.primary,
          dotColor: Colors.white,
          selectableDayPredicate: (date) => date.day != 27,
          locale: 'en',
        ),
        const SizedBox(height: 24),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: 12,
            ),
            itemBuilder: (context, index) {
              return const TaskItem();
            },
            itemCount: 15,
          ),
        )
      ],
    );
  }
}
