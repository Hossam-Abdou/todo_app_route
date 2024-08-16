import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/firebase_options.dart';
import 'package:todo_app_route/view/home.dart';
import 'package:todo_app_route/view/splash_screen.dart';
import 'package:todo_app_route/view/update_task_screen.dart';

import 'services/shared_prefrence/cached_keys.dart';
import 'services/shared_prefrence/sp_helper.dart';
import 'utils/my_theme_data.dart';
import 'view_model/providers/my_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await SharedPrefrenceHelper.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? savedThemeMode = await SharedPrefrenceHelper.getData(key: CachedKeys.currentThemeMode);
  ThemeMode initialThemeMode = ThemeMode.light;

  if (savedThemeMode != null) {
    if (savedThemeMode == ThemeMode.dark.toString()) {
      initialThemeMode = ThemeMode.dark;
    }
    else{
      savedThemeMode == ThemeMode.light.toString();
    }
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locales',
      startLocale: const Locale('ar'),
      child: ChangeNotifierProvider(
        create: (context) => MyProvider()..mode ,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: SplashScreen.routeName,
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        UpdateTaskScreen.routeName: (context) => const UpdateTaskScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
