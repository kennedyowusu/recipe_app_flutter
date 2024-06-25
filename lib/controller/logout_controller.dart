import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/services/logout_service.dart';

class LogoutController extends GetxController {
  final LogoutUserService _logoutUserService = LogoutUserService();
  final GetStorage box = GetStorage();
  final RxBool isLoading = false.obs;

  Future<void> logoutUser(String token) async {
    isLoading(true);
    final token = box.read('token');
    try {
      if (token != null) {
        await _logoutUserService.logoutUser(token);
        box.remove('token');
        Get.offAllNamed(AppRouteName.login);
      } else {
        Get.offAllNamed(AppRouteName.entry);
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        "Failed to logout user",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading(false);
    }
  }
}
