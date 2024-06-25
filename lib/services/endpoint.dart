class ProjectEndpoints {
  const ProjectEndpoints._();

  // Create DEFAULT HTTP headers
  static const Map<String, String> _headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Create headers with token
  static Map<String, String> getHeaders(String token) {
    final Map<String, String> header = Map<String, String>.from(_headers);

    if (token.isNotEmpty) {
      header['Authorization'] = 'Bearer $token';
    }

    return header;
  }

  // Create endpoints
  static const String baseUrl = 'http://192.168.1.109:8000/api';
  static const String login = '$baseUrl/login';
  static const String register = '$baseUrl/register';
  static const String profile = '$baseUrl/user';
  static const String logout = '$baseUrl/logout';
  static const String forgotPassword = '$baseUrl/forgot-password';
  static const String resetPassword = '$baseUrl/reset-password';
  static const String categories = '$baseUrl/categories';
  static const String recipes = '$baseUrl/recipes';
  static const String savedRecipes = '$baseUrl/saved_recipes';
}
