import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_route/core/utils/app_colors.dart';
import 'package:todo_app_route/features/auth/view/login_screen.dart';
import 'package:todo_app_route/features/auth/view_model/auth_provider.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = "signUpScreen";

  @override
  Widget build(BuildContext context) {
    var authProvider = Provider.of<AuthProvider>(context);
    return Container(
      decoration: const BoxDecoration(
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
            'Create Account',
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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: authProvider.firstNameController,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: GoogleFonts.poppins(
                    fontSize: 12,
                    color: AppColors.labelFieldColor,
                  ),
                ),
                onChanged: (value) {},
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
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
              const SizedBox(height: 16.0),
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
                      icon: const Icon(
                        Icons.remove_red_eye,
                      )),
                ),
                obscureText: authProvider.isShown,
                onChanged: (value) {},
              ),

              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  authProvider.signUp(


                  );
                  // print(authProvider.passwordController.text);
                  // print(authProvider.emailController.text);
                  // Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Create Account',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Icon(Icons.arrow_forward_rounded),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
                child: Text(
                  'Have an Account?',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: const Color(0xff303030),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
