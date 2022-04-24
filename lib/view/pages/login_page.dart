import 'package:coffii/core/constants/color_const.dart';
import 'package:coffii/core/widgets/appbar_widget.dart';
import 'package:coffii/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        context: context,
        title: 'Login to coffee shop',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Lottie.asset('assets/lottie/cat_coffee.json'),
              ),
              Form(
                key: context.watch<LoginProvider>().formKey,
                child: Column(
                  children: [
                    TextFormField(
                        controller:
                            context.watch<LoginProvider>().emailController,
                        validator: (t) =>
                            t!.length < 5 ? "5 tadan kam bo'lmasin" : null),
                    TextFormField(
                        controller:
                            context.watch<LoginProvider>().passController,
                        validator: (t) =>
                            t!.length < 5 ? "5 tadan kam bo'lmasin" : null),
                  ],
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorConst.signinButton,
                ),
                child: const Text('Sign In'),
                onPressed: () {
                  context.read<LoginProvider>().signIn(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorConst.signupButton,
                ),
                child: const Text('Sign Up'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
