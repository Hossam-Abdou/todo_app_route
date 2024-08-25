import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';
import 'package:todo_app_route/core/utils/app_strings.dart';
import 'package:todo_app_route/features/auth/view/sign_up_screen.dart';
import 'package:todo_app_route/features/auth/view_model/auth_provider.dart';
import 'package:todo_app_route/features/home/view/home.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginScreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(
            'assets/images/background.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Login',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.07,
                  ),
                  Text(
                    'Welcome Back',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: authProvider.emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.labelFieldColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    onChanged: (value) {},
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16.0),
                  TextFormField(
                    controller: authProvider.passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        color: AppColors.labelFieldColor,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            authProvider.changeObsecureText();
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                          )),
                    ),
                    obscureText: authProvider.isShown,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    AppStrings.forgetPassword.tr(),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Color(0xff303030),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: ()  {
                       authProvider.login(
                        onError: (e) {
                          debugPrint('error');
                        },
                        onSuccess: (s) {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        },
                      );
                      // print(authProvider.passwordController.text);
                      // print(authProvider.emailController.text);
                      // Navigator.pushReplacementNamed(
                      //     context, HomeScreen.routeName);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(Icons.arrow_forward),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, SignUpScreen.routeName);
                    },
                    child: Text(
                      'Or Create My Account',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Color(0xff303030),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
