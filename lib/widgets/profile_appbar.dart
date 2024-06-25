import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/logout_controller.dart';

AppBar buildAppBar({String title = "Profile"}) {
  final LogoutController _logoutController = Get.put(LogoutController());
  return AppBar(
    leading: IconButton(
      icon: const Icon(
        CupertinoIcons.back,
        color: ProjectColors.primaryColor,
      ),
      onPressed: () {
        Get.offAllNamed(AppRouteName.entry);
      },
    ),
    backgroundColor: Colors.white,
    title: Text(
      title,
      style: const TextStyle(
        color: ProjectColors.primaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {
          _logoutController.logoutUser("token");
        },
        icon: const Icon(Icons.logout, color: ProjectColors.primaryColor),
      ),
    ],
  );
}
