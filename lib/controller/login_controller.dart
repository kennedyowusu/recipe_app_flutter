import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/services/login_service.dart';

class LoginController extends GetxController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final RxBool isVisible = RxBool(false);

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  final RxBool isLoading = false.obs;
  final LoginUserService _loginUserService = LoginUserService();

  String? validateEmail(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Enter a Email Address';
    } else if (!GetUtils.isEmail(value)) {
      return 'Enter a valid Email Address';
    }
    return null;
  }

  String? validateUsername(String value) {
    if (value.isEmpty || value.length < 3) {
      return 'Enter a Email Address';
    } else if (!GetUtils.isEmail(value)) {
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

  void togglePasswordVisibility() => isVisible.toggle();

  Future<void> loginUser({
    required String email,
    required String password,
  }) async {
    isLoading(true);
    try {
      await _loginUserService.loginUser(
        email: email,
        password: password,
      );

      Get.offAllNamed(AppRouteName.entry);
      clearFields();
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }

  void clearFields() {
    email.clear();
    password.clear();
  }
}
