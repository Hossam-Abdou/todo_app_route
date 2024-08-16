import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/utils/app_colors.dart';
import 'package:todo_app_route/view/home.dart';
import 'package:todo_app_route/view_model/providers/my_provider.dart';

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
        Navigator.pushNamed(context, HomeScreen.routeName);
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
