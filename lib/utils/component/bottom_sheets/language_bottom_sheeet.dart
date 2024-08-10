import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/providers/my_provider.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/utils/app_strings.dart';

class LanguageBottomSheeet extends StatelessWidget {
  const LanguageBottomSheeet({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              context.setLocale(const Locale('ar'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.arabic.tr(),
                  style: Theme.of(context).textTheme.bodyMedium
                          ?.copyWith(
                      color:context.locale == const Locale('ar')? AppColors.primary: Colors.black)
                ),
                context.locale == const Locale('ar')
                    ? Icon(
                  Icons.check,
                  color: AppColors.primary,
                )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              context.setLocale(const Locale('en'));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.english.tr(),
                  style:  Theme.of(context).textTheme.bodyMedium
                      ?.copyWith(
                      color:context.locale == const Locale('en')? AppColors.primary: Colors.black)
                ),
                context.locale == const Locale('en')
                    ? Icon(
                        Icons.check,
                        color: AppColors.primary,
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
