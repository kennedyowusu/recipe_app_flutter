import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/custom_loader.dart';

class SaveDeleteButton extends StatelessWidget {
  final RecipeModel recipe;

  SaveDeleteButton({super.key, required this.recipe});

  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => recipeController.isLoading.value
          ? const CustomLoader()
          : IconButton(
              style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap),
              onPressed: () async {
                recipeController.isLoading(true);
                if (recipeController.savedRecipes
                    .any((savedRecipe) => savedRecipe.id == recipe.id)) {
                  recipeController.removeRecipe(recipe.id!);
                  debugPrint('Remove Recipe ${recipe.id}');
                } else {
                  recipeController.saveRecipe(recipe.id!);
                  debugPrint('Save Recipe ${recipe.id}');
                }
                recipeController.isLoading(false);
              },
              icon: Icon(
                recipeController.savedRecipes
                        .any((savedRecipe) => savedRecipe.id == recipe.id)
                    ? Icons.delete_outline
                    : Icons.bookmark_outline,
                color: recipeController.savedRecipes
                        .any((savedRecipe) => savedRecipe.id == recipe.id)
                    ? Colors.red
                    : ProjectColors.primaryColor,
                size: 20,
              ),
            ),
    );
  }
}
