import 'package:flutter/material.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/constants/images.dart';
import 'package:recipe_app/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Image(
            image: AssetImage(
              ProjectImages.splash,
            ),
            fit: BoxFit.cover,
          ),
          Container(
            width: width,
            height: height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.transparent,
                ],
                stops: [
                  0.2,
                  1,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              MediaQuery.of(context).padding.top + 16,
              16,
              MediaQuery.of(context).padding.bottom + 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.06),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: ProjectColors.whiteColor,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Image.asset(
                    ProjectImages.logo,
                    width: 100,
                    height: 100,
                    color: ProjectColors.whiteColor,
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  "Unlimited Recipes",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
                const Spacer(),
                Text(
                  "Cook Delicious Always",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 8),
                Text(
                  "Discover more than enough food recipes with ease!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  child: const AppButton(
                    buttonText: "Get Started",
                    routeName: AppRouteName.login,
                  ),
                ),
                SizedBox(height: height * 0.08),
              ],
            ),
          )
        ],
      ),
    );
  }
}
