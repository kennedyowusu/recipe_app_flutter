import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/services/endpoint.dart';

class RegisterUserService {
  Future<UserModelResponse> registerUser({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.register),
        headers: ProjectEndpoints.getHeaders(''),
        body: jsonEncode({
          'name': name,
          'username': username,
          'email': email,
          'password': password,
        }),
      );

      debugPrint(wrapWidth: 1024, ProjectEndpoints.register);
      debugPrint(wrapWidth: 1024, response.body);

      // if response status code is not 200, throw an exception
      if (response.statusCode != 201) {
        throw Exception('Failed to register user');
      }

      // if response is successful, decode the response body
      final Map<String, dynamic> data = jsonDecode(response.body);
      return UserModelResponse.fromJson(data);
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to register user');
    }
  }
}
