import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/bottom_sheets/add_task_bottom_sheet.dart';
import 'package:todo_app_route/utils/app_strings.dart';

import 'providers/my_provider.dart';
import 'tabs/settings_tab.dart';
import 'tabs/tasks_tab.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabs = [const TasksTab(), const SettingsTab()];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          "ToDo App",

        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor:provider.mode == ThemeMode.dark ? AppColors.darkPrimary : Colors.white,
            builder: (context) => const AddTaskBottomSheet(),
          );
        },
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: const BorderSide(
            color: Colors.white,
            width: 4,
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        notchMargin: 8,
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: AppColors.primary,
            unselectedItemColor: AppColors.grey,
            // showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (value) {
              selectedIndex = value;
              setState(() {});
            },
            items:  [
              BottomNavigationBarItem(icon: const Icon(Icons.home), label: AppStrings.home.tr(),),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings), label: AppStrings.settings.tr(),),
            ]),
      ),
      body: tabs[selectedIndex],
    );
  }

}
