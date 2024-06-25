import 'package:flutter/material.dart';
import 'package:recipe_app/constants/colors.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(
          ProjectColors.primaryColorDark,
        ),
      ),
    );
  }
}
