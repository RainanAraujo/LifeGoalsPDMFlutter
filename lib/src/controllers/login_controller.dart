import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class LoginController extends ChangeNotifier {
  late UserCredential currentUser;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> signIn(BuildContext context) async {
    isLoading = !isLoading;
    notifyListeners();
    try {
      currentUser = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      Navigator.pushReplacementNamed(context, "/navigationBottomBar");
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
    isLoading = !isLoading;
    notifyListeners();
  }
}
