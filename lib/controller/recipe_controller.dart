import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/services/recipe_service.dart';
import 'package:recipe_app/services/saved_recipes.dart';

class RecipeController extends GetxController {
  final RxList<RecipeModel> recipes = <RecipeModel>[].obs;
  final RxList<RecipeModel> trendingRecipes = <RecipeModel>[].obs;
  final RxList<RecipeModel> latestRecipes = <RecipeModel>[].obs;
  final RxList<RecipeModel> filteredRecipes = <RecipeModel>[].obs;
  final RxList<RecipeModel> savedRecipes = <RecipeModel>[].obs;
  final RxBool isLoading = false.obs;

  final GetStorage box = GetStorage();
  final GlobalKey<FormState> createRecipeFormKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController ratingController = TextEditingController();
  final TextEditingController cuisineController = TextEditingController();
  final TextEditingController cookTimeController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController ingredientsController = TextEditingController();
  final RxString selectedCategoryId = ''.obs;
  final RxInt isTrending = 0.obs;
  final RxInt isLatest = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecipes();
  }

  void fetchRecipes() async {
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final recipeService = RecipeService();
      final RecipeResponseModel recipeResponseModel =
          await recipeService.fetchRecipes(token);
      recipes.assignAll(recipeResponseModel.recipes ?? []);
      filterTrendingRecipes();
      filterLatestRecipes();
      filteredRecipes.assignAll(recipeResponseModel.recipes ?? []);

      fetchSavedRecipes();
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void filterTrendingRecipes() {
    trendingRecipes
        .assignAll(recipes.where((recipe) => recipe.isTrending == 1).toList());
  }

  void filterLatestRecipes() {
    latestRecipes
        .assignAll(recipes.where((recipe) => recipe.isLatest == 1).toList());
  }

  void searchRecipes(String query) {
    if (query.isEmpty) {
      filteredRecipes.assignAll(recipes);
    } else {
      filteredRecipes.assignAll(recipes
          .where((recipe) =>
              recipe.name!.toLowerCase().contains(query.toLowerCase()))
          .toList());
    }
  }

  void fetchRecipesByCategory(int categoryId) async {
    try {
      isLoading(true);
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final recipeService = RecipeService();
      final RecipeResponseModel recipeResponseModel =
          await recipeService.fetchRecipesByCategory(token, categoryId);
      filteredRecipes.assignAll(recipeResponseModel.recipes ?? []);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading(false);
    }
  }

  void fetchSavedRecipes() async {
    try {
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final savedRecipeService = SavedRecipeService();
      final List<RecipeModel> savedRecipeResponse =
          await savedRecipeService.fetchSavedRecipes(token);
      savedRecipes.assignAll(savedRecipeResponse);
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveRecipe(int recipeId) async {
    try {
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }

      if (savedRecipes.any((recipe) => recipe.id == recipeId)) {
        Get.snackbar('Info', 'Recipe is already saved',
            snackPosition: SnackPosition.BOTTOM);
        return;
      }

      final SavedRecipeService savedRecipeService = SavedRecipeService();
      await savedRecipeService.saveRecipe(token, recipeId);
      fetchSavedRecipes(); // Refresh saved recipes
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  void removeRecipe(int recipeId) async {
    try {
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }
      final SavedRecipeService savedRecipeService = SavedRecipeService();
      await savedRecipeService.removeRecipe(token, recipeId);
      fetchSavedRecipes(); // Refresh saved recipes
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> createRecipe(RecipeModel newRecipe) async {
    try {
      final token = box.read('token');
      if (token == null) {
        throw Exception('Token not found');
      }

      final recipeService = RecipeService();
      await recipeService.createRecipe(token, newRecipe);
      fetchRecipes(); // Refresh the recipe list after adding a new recipe
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    }
  }
}
