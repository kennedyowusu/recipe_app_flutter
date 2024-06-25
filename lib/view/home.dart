import 'package:flutter/material.dart';
import 'package:recipe_app/constants/app_route_name.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/controller/search_controller.dart';
import 'package:recipe_app/controller/user_info_controller.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/widgets/advert.dart';

import 'package:get/get.dart';
import 'package:recipe_app/widgets/home_top_section.dart';
import 'package:recipe_app/widgets/project_category.dart';
import 'package:recipe_app/widgets/recipe_item.dart';
import 'package:recipe_app/widgets/search_form_field.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final SearchAppController searchController = Get.put(SearchAppController());
  final RecipeController recipeController = Get.put(RecipeController());

  @override
  Widget build(BuildContext context) {
    RxList<RecipeModel> latestRecipes = recipeController.latestRecipes;
    final UserInfoController userInfoController = Get.put(UserInfoController());

    return Scaffold(
      floatingActionButton: Obx(() {
        if (userInfoController.user.value.role == 'admin') {
          return FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            heroTag: 'add Category',
            tooltip: 'Add Category',
            elevation: 4,
            onPressed: () {
              Get.toNamed(AppRouteName.categoryForm);
            },
            backgroundColor: ProjectColors.primaryColor,
            child: const Icon(Icons.add, color: Colors.white),
          );
        } else {
          return Container();
        }
      }),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 24,
          bottom: MediaQuery.of(context).padding.bottom + 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeTopSection(context),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "What do you want to cook today?",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            SearchFormField(
              searchController: searchController,
              recipeController: recipeController,
            ),
            CategoryListView(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Recipes",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppRouteName.allRecipes);
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: ProjectColors.primaryColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 230,
              child: Obx(() {
                if (recipeController.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: ProjectColors.primaryColorDark,
                    ),
                  );
                }
                if (recipeController.filteredRecipes.isEmpty) {
                  return const Center(child: Text("No recipes found"));
                }
                return ListView.separated(
                  itemCount: recipeController.filteredRecipes.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    final recipe = recipeController.filteredRecipes[index];
                    return RecipeItem(recipe: recipe);
                  },
                );
              }),
            ),
            const SizedBox(height: 24),
            advert(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Recipes",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/all-recipes', arguments: 'latest');
                    },
                    child: const Text(
                      "See All",
                      style: TextStyle(color: ProjectColors.primaryColor),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Obx(
              () => SizedBox(
                height: 230,
                child: ListView.separated(
                  itemCount: latestRecipes.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  separatorBuilder: (_, __) {
                    return const SizedBox(width: 16);
                  },
                  itemBuilder: (context, index) {
                    final RecipeModel recipe = latestRecipes[index];
                    return RecipeItem(recipe: recipe);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
