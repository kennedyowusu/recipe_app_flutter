import 'package:flutter/material.dart';
import 'package:recipe_app/controller/forget_password_controller.dart';

class ForgetPasswordForm extends StatelessWidget {
  final ForgetPasswordController controller;

  const ForgetPasswordForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;

    return Form(
      key: GlobalKey<FormState>(),
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
            validator: (value) => controller.validateEmail(value!),
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
        ],
      ),
    );
  }
}
