import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:recipe_app/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/services/endpoint.dart';

class LoginUserService {
  Future<UserModelResponse> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.login),
        headers: ProjectEndpoints.getHeaders(''),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      debugPrint(wrapWidth: 1024, ProjectEndpoints.login);
      debugPrint(wrapWidth: 1024, response.body);

      // if response status code is not 200, throw an exception
      if (response.statusCode != 200) {
        throw Exception('Failed to login user');
      }

      // if response is successful, decode the response body
      final Map<String, dynamic> data = jsonDecode(response.body);

      // Store the user token in the get storage
      GetStorage().write('token', data['token']);
      debugPrint('Token: ${data['token']}');

      return UserModelResponse.fromJson(data);
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to login user');
    }
  }
}
