import 'package:flutter/material.dart';
import 'package:recipe_app/constants/colors.dart';
import 'package:recipe_app/controller/recipe_controller.dart';
import 'package:recipe_app/controller/search_controller.dart';

class SearchFormField extends StatelessWidget {
  const SearchFormField({
    super.key,
    required this.searchController,
    required this.recipeController,
  });

  final SearchAppController searchController;
  final RecipeController recipeController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: searchController.searchFormKey,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ProjectColors.backgroundGray,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const SizedBox(width: 12),
            const Icon(Icons.search),
            const SizedBox(width: 5),
            Expanded(
              child: TextFormField(
                controller: searchController.searchController,
                onChanged: (value) {
                  searchController.updateSearchQuery(value, recipeController);
                },
                decoration: InputDecoration(
                  hintText: "Search for recipes",
                  hintStyle: TextStyle(
                    color: ProjectColors.blackGrey.withOpacity(0.5),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
