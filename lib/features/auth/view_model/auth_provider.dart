import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isShown = true;

  changeObsecureText() {
    isShown = !isShown;
    notifyListeners();
  }

login(
      {required Function onSuccess, required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      debugPrint('User logged in: ${credential.user?.email}');
      onSuccess();
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      notifyListeners();

    } catch (e) {
      onError(e.toString());
      debugPrint('An unexpected error occurred: $e');
      notifyListeners();

    }
  }

  Future<void> signUp() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Handle successful sign up
      print('User signed up: ${credential.user?.email}');

      // Notify listeners if necessary
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print('The email provided is invalid.');
      } else {
        print('Sign-up failed: ${e.message}');
      }
    } catch (e) {
      print('An unexpected error occurred: $e');
    }
  }
}
