class UserModelResponse {
  String message;
  UserModel user;
  String token;

  UserModelResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  UserModelResponse.fromJson(Map<String, dynamic> json)
      : message = json['message'],
        user = UserModel.fromJson(json['user']),
        token = json['token'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['user'] = user.toJson();
    data['token'] = token;
    return data;
  }
}

class UserModel {
  int id;
  String name;
  String email;
  String role;
  String username;
  dynamic emailVerifiedAt;
  DateTime createdAt;
  DateTime updatedAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    required this.username,
    required this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        email = json['email'],
        role = json['role'],
        username = json['username'],
        emailVerifiedAt = json['email_verified_at'],
        createdAt = DateTime.parse(json['created_at']),
        updatedAt = DateTime.parse(json['updated_at']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;
    data['username'] = username;
    data['email_verified_at'] = emailVerifiedAt;
    data['created_at'] = createdAt.toIso8601String();
    data['updated_at'] = updatedAt.toIso8601String();
    return data;
  }
}
