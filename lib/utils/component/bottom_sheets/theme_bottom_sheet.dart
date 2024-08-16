import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/services/shared_prefrence/cached_keys.dart';
import 'package:todo_app_route/services/shared_prefrence/sp_helper.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/utils/app_strings.dart';
import 'package:todo_app_route/view_model/providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () async {
              debugPrint('the shared is : ${await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode)}');
              themeProvider.changeThemeMode(ThemeMode.light);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.light.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: themeProvider.mode == ThemeMode.light
                          ? AppColors.primary
                          : Colors.black,),
                ),
                themeProvider.mode == ThemeMode.dark
                    ? const SizedBox.shrink()
                    :  Icon(
                        Icons.check,
                        color: AppColors.primary,
                      ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () async {
              themeProvider.changeThemeMode(ThemeMode.dark);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.dark.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: themeProvider.mode == ThemeMode.dark
                          ? AppColors.primary
                          : null),
                ),
                themeProvider.mode == ThemeMode.dark
                    ? Icon(
                        Icons.check,
                        color: themeProvider.mode == ThemeMode.dark
                            ? AppColors.primary
                            : Colors.black,
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
