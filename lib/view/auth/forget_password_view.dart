import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/forget_password_controller.dart';
import 'package:recipe_app/view/auth/auth_prompt.dart';
import 'package:recipe_app/view/auth/forget_password_form.dart';

class ForgetPasswordView extends StatelessWidget {
  ForgetPasswordView({super.key});

  final ForgetPasswordController controller =
      Get.put(ForgetPasswordController());

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 80),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Forgot Password',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Enter your email to reset password',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: height * 0.06),
            ForgetPasswordForm(controller: controller),
            SizedBox(height: height * 0.04),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  backgroundColor: ProjectColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async => await controller.sendPasswordResetLink(),
                child: const Text(
                  'Send Reset Link',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            AuthPrompt(
              promptText: "Remembered your password? ",
              actionText: "Sign In",
              onTap: () {
                Get.offAllNamed(AppRouteName.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
