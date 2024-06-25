import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/category_controller.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/profile_appbar.dart';

class AddRecipeView extends StatelessWidget {
  AddRecipeView({super.key});

  final RecipeController recipeController = Get.put(RecipeController());
  final CategoryController categoriesController = Get.put(CategoryController());
  final CategoryController categoryController = Get.put(CategoryController());

  void createRecipe() async {
    if (recipeController.createRecipeFormKey.currentState!.validate()) {
      RecipeModel newRecipe = RecipeModel(
        name: recipeController.nameController.text,
        description: recipeController.descriptionController.text,
        image: recipeController.imageController.text,
        rating: double.tryParse(recipeController.ratingController.text),
        cuisine: recipeController.cuisineController.text,
        cookTimeMinutes: int.tryParse(recipeController.cookTimeController.text),
        // category_id: int.parse(recipeController.selectedCategoryId.value),
        ingredients: recipeController.ingredientsController.text.split(','),
        isTrending: recipeController.isTrending.value, // New
        isLatest: recipeController.isLatest.value,
      );

      try {
        await recipeController.createRecipe(newRecipe);
        Get.offAllNamed(AppRouteName.entry);
        recipeController.fetchRecipes();
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(
        title: "Add New Recipe",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: recipeController.createRecipeFormKey,
          child: ListView(
            children: [
              TextFormField(
                controller: recipeController.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipe name';
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Recipe Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.descriptionController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Recipe Description',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the recipe description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.imageController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Recipe Image URL',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.ratingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Recipe Rating',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.cuisineController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Cuisine',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.cookTimeController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Cook Time (minutes)',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              Obx(() {
                if (categoriesController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 25),
                      hintText: 'Select Category',
                      hintStyle: const TextStyle(color: Colors.grey),
                    ),
                    items: categoriesController.categories.map((category) {
                      return DropdownMenuItem<String>(
                        value: category.id.toString(),
                        child: Text(category.name.toString()),
                      );
                    }).toList(),
                    onChanged: (value) {
                      recipeController.selectedCategoryId.value = value!;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a category';
                      }
                      return null;
                    },
                  );
                }
              }),
              const SizedBox(height: 20),
              TextFormField(
                controller: recipeController.ingredientsController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  focusColor: Colors.greenAccent,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 25),
                  hintText: 'Enter Ingredients (comma separated)',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => recipeController.isLoading.value
                    ? const CircularProgressIndicator(
                        color: ProjectColors.primaryColorDark,
                      )
                    : GestureDetector(
                        onTap: createRecipe,
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: ProjectColors.primaryColor,
                            borderRadius: BorderRadius.circular(32),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            "Create Recipe",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
