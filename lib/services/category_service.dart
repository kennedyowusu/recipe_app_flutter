import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/category_model.dart';
import 'package:recipe_app/services/endpoint.dart';

class CategoryService {
  Future<CategoryResponseModel> fetchCategories(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ProjectEndpoints.categories),
        headers: ProjectEndpoints.getHeaders(token),
      );

      if (response.statusCode != 200) {
        throw Exception('Failed to load categories');
      } else {
        return CategoryResponseModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to load categories');
    }
  }

  Future<CategoryModel> createCategory(String token, String name) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.categories),
        headers: ProjectEndpoints.getHeaders(token),
        body: jsonEncode(<String, String>{
          'name': name,
        }),
      );

      debugPrint(response.body);

      if (response.statusCode != 201) {
        throw Exception('Failed to create category');
      } else {
        debugPrint(response.body);
        return CategoryModel.fromJson(jsonDecode(response.body));
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      throw Exception('Failed to create category');
    }
  }
}
