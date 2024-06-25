import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/controller/recipe_controller.dart';

class SearchAppController extends GetxController {
  RxList<String> searchHistory = <String>[].obs;
  final TextEditingController searchController = TextEditingController();
  final GlobalKey<FormState> searchFormKey = GlobalKey<FormState>();

  void updateSearchQuery(String query, RecipeController recipeController) {
    searchHistory.add(query);
    recipeController.searchRecipes(query);
  }

  void addSearchHistory(String query) {
    searchHistory.add(query);
  }

  void clearSearchHistory() {
    searchHistory.clear();
  }

  void removeSearchHistory(String query) {
    searchHistory.remove(query);
  }

  void clearLastSearchHistory() {
    if (searchHistory.isNotEmpty) {
      searchHistory.removeLast();
    }
  }
}
