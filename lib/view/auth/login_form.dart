import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipe_app/controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;

  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Form(
      key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Email Address",
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: height * 0.009),
          TextFormField(
            controller: controller.email,
            validator: (value) => controller.validateUsername(value!),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              focusColor: Colors.greenAccent,
              contentPadding: const EdgeInsets.symmetric(horizontal: 25),
              hintText: 'Enter Email Address',
              hintStyle: const TextStyle(color: Colors.grey),
            ),
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: height * 0.03),
          const Text("Password", style: TextStyle(color: Colors.black)),
          SizedBox(height: height * 0.009),
          Obx(() => TextFormField(
                obscureText: controller.isVisible.value,
                controller: controller.password,
                validator: (value) => controller.validatePassword(value!),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    iconSize: 15,
                    onPressed: controller.togglePasswordVisibility,
                    icon: controller.isVisible.value
                        ? const Icon(FontAwesomeIcons.solidEyeSlash)
                        : const Icon(FontAwesomeIcons.solidEye),
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Password',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style:
                    const TextStyle(color: Colors.black, fontFamily: 'poppins'),
              )),
        ],
      ),
    );
  }
}
