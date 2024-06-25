import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/register_controller.dart';
import 'package:recipe_app/view/auth/auth_prompt.dart';
import 'package:recipe_app/view/auth/register_form.dart';
import 'package:recipe_app/widgets/fill_all_fields.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final RegisterController controller = Get.put(RegisterController());

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
                'Hello,',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: height * 0.02),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Create your account',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: height * 0.06),
            RegisterForm(controller: controller),
            SizedBox(height: height * 0.04),

            // Register Button
            Obx(
              () => SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.registerFormKey.currentState != null &&
                        controller.registerFormKey.currentState!.validate()) {
                      if (controller.name.text.isNotEmpty &&
                          controller.username.text.isNotEmpty &&
                          controller.email.text.isNotEmpty &&
                          controller.password.text.isNotEmpty) {
                        controller.registerUser(
                          name: controller.name.text,
                          username: controller.username.text,
                          email: controller.email.text,
                          password: controller.password.text,
                        );
                        Get.offAllNamed(AppRouteName.login);
                      } else {
                        fillAllFields();
                      }
                    } else {
                      fillAllFields();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    alignment: Alignment.center,
                    backgroundColor: ProjectColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: controller.isLoading.isTrue
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            ProjectColors.primaryColorDark,
                          ),
                        )
                      : const Text(
                          'Sign Up',
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
              promptText: "Already have an account? ",
              actionText: " Sign In",
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
