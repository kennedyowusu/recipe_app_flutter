import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:recipe_app/services/user_info_service.dart';

class UserInfoController extends GetxController {
  final UserInfoService _userInfoService = UserInfoService();
  final GetStorage box = GetStorage();
  final RxBool isLoading = false.obs;

  late Rx<UserModel> user = UserModel(
    id: 0,
    name: '',
    email: '',
    username: '',
    role: '',
    emailVerifiedAt: null,
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
  ).obs;

  @override
  void onInit() {
    super.onInit();
    String token = '';
    fetchUserInfo(token);
  }

  Future<void> fetchUserInfo(String token) async {
    isLoading(true);
    final token = box.read('token');
    try {
      if (token != null) {
        final UserModel userInfo = await _userInfoService.getUserInfo(token);
        user(userInfo);
      } else {
        Get.offAllNamed(AppRouteName.login);
      }
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
}
