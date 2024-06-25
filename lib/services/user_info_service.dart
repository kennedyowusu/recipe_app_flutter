import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/model/user_model.dart';
import 'package:recipe_app/services/endpoint.dart';

class UserInfoService {
  Future<UserModel> getUserInfo(String token) async {
    try {
      final response = await http.get(
        Uri.parse(ProjectEndpoints.profile),
        headers: ProjectEndpoints.getHeaders(token),
      );

      debugPrint(wrapWidth: 1024, ProjectEndpoints.profile);
      debugPrint(wrapWidth: 1024, response.body);

      // Check if response status code is 200 for successful user info retrieval
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return UserModel.fromJson(data['user']);
      } else {
        throw Exception('Failed to get user information');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to get user information');
    }
  }
}
