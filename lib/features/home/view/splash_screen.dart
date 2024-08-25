import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';
import 'package:todo_app_route/features/auth/view/login_screen.dart';
import 'package:todo_app_route/features/home/view_model/my_provider.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "splashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamed(context, LoginScreen.routeName);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    return Scaffold(
      body: Container(
        color: provider.mode == ThemeMode.dark ? AppColors.darkPrimary : Colors.white,
        child: Center(
          child: Image.asset("assets/images/logo.png"),
        ),
      ),
    );
  }
}
