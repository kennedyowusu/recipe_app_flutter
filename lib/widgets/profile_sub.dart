import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/user_info_controller.dart';

class ProfileSub extends StatelessWidget {
  const ProfileSub({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final UserInfoController userInfoController = Get.put(UserInfoController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (userInfoController.user.value.name.isNotEmpty)
          Text(
            userInfoController.user.value.name,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )
        else
          const Text(
            "Loading...",
            style: TextStyle(color: Colors.grey),
          ),
      ],
    );
  }
}
