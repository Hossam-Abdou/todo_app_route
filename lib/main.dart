import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/features/auth/view/login_screen.dart';
import 'package:todo_app_route/features/auth/view/sign_up_screen.dart';
import 'package:todo_app_route/features/auth/view_model/auth_provider.dart';
import 'package:todo_app_route/features/home/view/home.dart';
import 'package:todo_app_route/features/home/view/splash_screen.dart';
import 'package:todo_app_route/features/home/view/update_task_screen.dart';
import 'package:todo_app_route/features/home/view_model/my_provider.dart';
import 'package:todo_app_route/firebase_options.dart';
import 'core/services/shared_prefrence/cached_keys.dart';
import 'core/services/shared_prefrence/sp_helper.dart';
import 'core/utils/my_theme_data.dart';

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
    } else {
      savedThemeMode == ThemeMode.light.toString();
    }
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/locales',
      startLocale: const Locale('en'),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MyProvider()..mode = initialThemeMode,
          ),
          ChangeNotifierProvider(
            create: (context) => AuthProvider(),
          )
        ],
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
      themeMode: provider.mode,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      routes: {
        HomeScreen.routeName: (context) => const HomeScreen(),
        UpdateTaskScreen.routeName: (context) => const UpdateTaskScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        SignUpScreen.routeName: (context) => SignUpScreen(),
      },

      initialRoute: SplashScreen.routeName,

      debugShowCheckedModeBanner: false,
    );
  }
}
