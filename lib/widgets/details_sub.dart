import 'package:flutter/cupertino.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/constants/images.dart';

Row detailsSub() {
  return Row(
    children: [
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
      const SizedBox(width: 10),
      const Text(
        "Kobicypher",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: CupertinoColors.black,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      Text(
        "Accra",
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: ProjectColors.blackGrey,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      )
    ],
  );
}
