import 'package:flutter/material.dart';
import 'package:recipe_app/constants/colors.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final String routeName;

  const AppButton({
    super.key,
    required this.buttonText,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacementNamed(context, routeName);
      },
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: ProjectColors.primaryColor,
          borderRadius: BorderRadius.circular(32),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
