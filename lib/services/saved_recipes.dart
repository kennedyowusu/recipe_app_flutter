import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/recipe_model.dart';
import 'package:recipe_app/services/endpoint.dart';

class SavedRecipeService {
  Future<void> saveRecipe(String token, int recipeId) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.savedRecipes),
        headers: ProjectEndpoints.getHeaders(token),
        body: jsonEncode({'recipe_id': recipeId}),
      );

      if (response.statusCode != 201) {
        throw Exception('Failed to save recipe');
      } else {
        return;
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to save recipe: ${e.toString()}');
    }
  }

  Future<List<RecipeModel>> fetchSavedRecipes(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ProjectEndpoints.savedRecipes),
        headers: ProjectEndpoints.getHeaders(token),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load saved recipes');
      } else {
        List<dynamic> body = jsonDecode(response.body);
        return body
            .map((dynamic item) => RecipeModel.fromJson(item['recipe']))
            .toList();
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load saved recipes: ${e.toString()}');
    }
  }

  Future<void> removeRecipe(String token, int recipeId) async {
    try {
      final response = await http.delete(
        Uri.parse('${ProjectEndpoints.savedRecipes}/$recipeId'),
        headers: ProjectEndpoints.getHeaders(token),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to remove recipe');
      } else {
        return;
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to remove recipe: ${e.toString()}');
    }
  }
}
