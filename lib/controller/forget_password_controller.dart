import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  final TextEditingController email = TextEditingController();

  String? validateEmail(String value) {
    if (value.isEmpty || !GetUtils.isEmail(value)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  Future<void> sendPasswordResetLink() async {
    // Implement password reset logic (e.g., API call)
    // Notify user about the success/failure of the reset link
    Get.snackbar('Success', 'Password reset link has been sent to your email.',
        snackPosition: SnackPosition.BOTTOM);
  }
}
