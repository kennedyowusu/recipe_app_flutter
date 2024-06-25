import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/services/register_service.dart';

class RegisterController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final RxBool isPasswordVisible = RxBool(false);
  final RxBool isConfirmPasswordVisible = RxBool(false);

  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  final RegisterUserService _registerUserService = RegisterUserService();
  final RxBool isLoading = false.obs;

  String? validateName(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Enter a valid Name';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Enter a valid Username';
    }
    return null;
  }

  String? validateEmail(String value) {
    if (value.isEmpty || !GetUtils.isEmail(value)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty || value.length < 5) {
      return 'Enter a valid Password';
    }
    return null;
  }

  String? validateConfirmPassword(String value) {
    if (value.isEmpty || value != password.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  void togglePasswordVisibility() => isPasswordVisible.toggle();
  void toggleConfirmPasswordVisibility() => isConfirmPasswordVisible.toggle();

  Future<void> registerUser({
    required String name,
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      isLoading(true);
      await _registerUserService.registerUser(
        name: name,
        username: username,
        email: email,
        password: password,
      );
      Get.offAllNamed(AppRouteName.login);
      clearFields();
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    } finally {
      isLoading(false);
    }
  }

  void clearFields() {
    name.clear();
    username.clear();
    email.clear();
    password.clear();
    confirmPassword.clear();
  }
}
