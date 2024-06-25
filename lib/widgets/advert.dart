import 'package:flutter/material.dart';
import 'package:recipe_app/constants/colors.dart';

Container advert() {
  return Container(
    margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
    padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
    decoration: BoxDecoration(
      color: ProjectColors.blackGrey.withOpacity(0.6),
      borderRadius: BorderRadius.circular(16),
    ),
    child: const Image(
      image: AssetImage("assets/images/vodafone.png"),
      height: 70,
      width: double.infinity,
    ),
  );
}
