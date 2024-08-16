import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/utils/app_strings.dart';
import 'package:todo_app_route/utils/component/bottom_sheets/language_bottom_sheeet.dart';
import 'package:todo_app_route/utils/component/bottom_sheets/theme_bottom_sheet.dart';
import 'package:todo_app_route/view_model/providers/my_provider.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  static const String routeName = "SettingTab";

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.theme.tr()),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const ThemeBottomSheet(),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeProvider.mode == ThemeMode.light?Colors.white:AppColors.darkPrimary,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: themeProvider.mode == ThemeMode.dark
                        ? Colors.white
                        : Theme.of(context).primaryColor),
              ),
              child: Text(themeProvider.mode == ThemeMode.light
                  ? AppStrings.light.tr()
                  : AppStrings.dark.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            AppStrings.language.tr(),
          ),
          const SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => const LanguageBottomSheeet(),
              );
            },
            child: Container(

              padding: const EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: themeProvider.mode == ThemeMode.light?Colors.white:AppColors.darkPrimary,

                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: themeProvider.mode == ThemeMode.dark
                        ? Colors.white
                        : Theme.of(context).primaryColor),
              ),
              child: Text(
                context.locale == const Locale('en') ? AppStrings.english.tr() : AppStrings.arabic.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
