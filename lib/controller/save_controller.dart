import 'package:get/get.dart';
import 'package:recipe_app/model/recipe_model.dart';

class SaveRecipeController extends GetxController {
  RxList<dynamic> savedRecipes = [].obs;
  RxBool isLoading = false.obs;

  void saveRecipe(RecipeModel recipe) {
    savedRecipes.add(recipe);
  }

  void removeRecipe(RecipeModel recipe) {
    savedRecipes.remove(recipe);
  }

  void clearAll() {
    savedRecipes.clear();
  }

  void setLoading(bool value) {
    isLoading.value = value;
  }
}
