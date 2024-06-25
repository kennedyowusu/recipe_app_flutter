import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/login_controller.dart';
import 'package:recipe_app/view/auth/auth_prompt.dart';
import 'package:recipe_app/view/auth/login_form.dart';
import 'package:recipe_app/widgets/fill_all_fields.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

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
                'Hello,',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: height * 0.06),
            LoginForm(controller: controller),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(color: ProjectColors.primaryColorDark),
                  ),
                  onPressed: () {
                    Get.offAllNamed(AppRouteName.forgotPassword);
                  },
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Obx(
              () => controller.isLoading.isTrue
                  ? const CircularProgressIndicator(
                      color: ProjectColors.primaryColorDark)
                  : SizedBox(
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
                        onPressed: () {
                          if (controller.loginFormKey.currentState != null &&
                              controller.loginFormKey.currentState!
                                  .validate()) {
                            if (controller.email.text.isNotEmpty &&
                                controller.password.text.isNotEmpty) {
                              controller.loginUser(
                                email: controller.email.text,
                                password: controller.password.text,
                              );
                            } else {
                              fillAllFields();
                            }
                          } else {
                            fillAllFields();
                          }
                        },
                        child: const Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(height: height * 0.04),
            AuthPrompt(
              promptText: "Don’t have an account? ",
              actionText: "Sign up",
              onTap: () {
                Get.offAllNamed(AppRouteName.register);
              },
            ),
          ],
        ),
      ),
    );
  }
}
