import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/constants/images.dart';
import 'package:recipe_app/controller/user_info_controller.dart';

Padding homeTopSection(BuildContext context) {
  final UserInfoController userInfoController = Get.put(UserInfoController());
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24),
    child: Obx(() {
      if (userInfoController.user.value.name.isNotEmpty) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Hi, ${userInfoController.user.value.name}",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: ProjectColors.primaryColor),
            ),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: ProjectColors.primaryColor,
                  width: 2,
                ),
                image: const DecorationImage(
                  image: AssetImage(ProjectImages.kobicypher),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        );
      } else {
        return const Text(
          "Loading...", // Placeholder text while waiting for user info
          style: TextStyle(color: Colors.grey),
        );
      }
    }),
  );
}
