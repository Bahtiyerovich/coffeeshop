import 'dart:math';

import 'package:coffii/core/constants/color_const.dart';
import 'package:coffii/core/widgets/my_messenger.dart';
import 'package:coffii/service/firebase/fire_service.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signIn(BuildContext context) async {
    try {
      if (formKey.currentState!.validate()) {
        await FireService.auth.signInWithEmailAndPassword(
            email: emailController.text, password: passController.text);
        if (emailController.text == 'admin@gmail.com' &&
            passController.text == 'adminpage') {
          Navigator.pushNamedAndRemoveUntil(
              context, '/admin', (route) => false);
        } else {
          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
        }
      } else {
        MyMessenger.messenger(
          context,
          'Fill all fields!',
          ColorConst.cyan,
        );
      }
    } catch (e) {
      MyMessenger.messenger(
        context,
        'Error while sign in: $e',
        ColorConst.cyan,
      );
    }
  }

  Future signOut(BuildContext context) async {
    await FireService.auth.signOut();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
