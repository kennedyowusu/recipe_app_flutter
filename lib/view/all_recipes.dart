import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/wide_recipe_card.dart';

class AllRecipesView extends StatelessWidget {
  final RecipeController recipeController = Get.put(RecipeController());

  AllRecipesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: const Text(
          'Trending Recipes',
          style: TextStyle(
            color: ProjectColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: recipeController.trendingRecipes.isEmpty
          ? const Center(
              child: Text(
                'No recipes found',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          : Obx(
              () => recipeController.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      itemCount: recipeController.trendingRecipes.length,
                      itemBuilder: (context, index) {
                        final RecipeModel recipe =
                            recipeController.trendingRecipes[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: WideRecipeCard(
                            recipe: recipe,
                            height: 200,
                            width: double.infinity,
                          ),
                        );
                      },
                    ),
            ),
    );
  }
}
