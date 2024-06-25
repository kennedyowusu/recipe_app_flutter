import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/services/endpoint.dart';

class RecipeService {
  Future<RecipeResponseModel> fetchRecipes(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ProjectEndpoints.recipes),
        headers: ProjectEndpoints.getHeaders(token),
      );

      debugPrint("Recipe response: ${response.body}");

      if (response.statusCode != 200) {
        throw Exception('Failed to load recipes');
      } else {
        return RecipeResponseModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load recipes: ${e.toString()}');
    }
  }

  Future<RecipeResponseModel> fetchRecipesByCategory(
      String token, int categoryId) async {
    try {
      final response = await http.get(
        Uri.parse('${ProjectEndpoints.categories}/$categoryId/recipes'),
        headers: ProjectEndpoints.getHeaders(token),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load recipes for category');
      } else {
        return RecipeResponseModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load recipes for category');
    }
  }

  Future<void> createRecipe(String token, RecipeModel newRecipe) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.recipes),
        headers: ProjectEndpoints.getHeaders(token),
        body: jsonEncode(newRecipe.toJson()),
      );

      debugPrint("Recipe response: ${response.body}");

      if (response.statusCode != 201) {
        throw Exception('Failed to create recipe');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to create recipe: ${e.toString()}');
    }
  }
}
