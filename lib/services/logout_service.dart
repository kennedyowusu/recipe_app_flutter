import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/services/endpoint.dart';

class LogoutUserService {
  Future<void> logoutUser(String token) async {
    try {
      final response = await http.post(
        Uri.parse(ProjectEndpoints.logout),
        headers: ProjectEndpoints.getHeaders(token),
      );

      debugPrint(wrapWidth: 1024, ProjectEndpoints.logout);
      debugPrint(wrapWidth: 1024, response.body);

      // Check if response status code is 200 for successful logout
      if (response.statusCode == 200) {
        return; // Success
      } else {
        throw Exception('Failed to logout user');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    } catch (e) {
      debugPrint(e.toString());
      throw Exception('Failed to logout user');
    }
  }
}
