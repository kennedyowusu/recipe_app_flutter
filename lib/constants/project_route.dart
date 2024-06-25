import 'package:flutter/material.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/view/all_recipes.dart';
import 'package:recipe_app/view/auth/forget_password_view.dart';
import 'package:recipe_app/view/auth/login_view.dart';
import 'package:recipe_app/view/auth/register_view.dart';
import 'package:recipe_app/view/category_form.dart';
import 'package:recipe_app/view/details.dart';
import 'package:recipe_app/view/entry.dart';
import 'package:recipe_app/view/home.dart';
import 'package:recipe_app/view/profile_view.dart';
import 'package:recipe_app/view/recipe_create_view.dart';
import 'package:recipe_app/view/saved_view.dart';
import 'package:recipe_app/view/splash.dart';

class AppRoute {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.getStarted:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case AppRouteName.home:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => HomeView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.login:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => LoginView(),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.register:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => RegisterView(),
          settings: settings,
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.forgotPassword:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => ForgetPasswordView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.entry:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ProjectEntry(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.details:
        final RecipeModel recipe = settings.arguments as RecipeModel;
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => DetailsView(recipe: recipe),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.savedRecipes:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => SavedRecipeView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.profile:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => const ProfileView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.allRecipes:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => AllRecipesView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.addRecipe:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => AddRecipeView(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      case AppRouteName.categoryForm:
        return PageRouteBuilder(
          settings: settings,
          pageBuilder: (_, __, ___) => CategoryForm(),
          transitionDuration: const Duration(milliseconds: 400),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );

      // Add more cases as needed
    }

    return null;
  }
}
