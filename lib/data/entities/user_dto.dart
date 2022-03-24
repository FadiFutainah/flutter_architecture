import 'dart:convert';

import 'package:app/models/user_model.dart';

class UserDto {
  String firstName;
  String email;
  String fcmToken;
  String roleId;
  String accessToken;
  bool status;
  String message;
  UserDto({
    required this.firstName,
    required this.email,
    required this.fcmToken,
    required this.roleId,
    required this.accessToken,
    required this.status,
    required this.message,
  });

  Map<String, dynamic> toMap() {
    return {
      'data': {
        'firstName': firstName,
        'email': email,
        'fcmToken': fcmToken,
        'roleId': roleId,
        'accessToken': accessToken,
        'status': status,
        'message': message,
      }
    };
  }

  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      firstName: map['data']['firstName'] ?? '',
      email: map['data']['email'] ?? '',
      fcmToken: map['data']['fcmToken'] ?? '',
      roleId: map['data']['roleId'] ?? '',
      accessToken: map['data']['accessToken'] ?? '',
      status: map['status'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));
}

extension UserLogin on UserDto {
  static Map<String, dynamic> loginBody(UserModel userModel) => {
        'email': userModel.email,
        'password': userModel.password,
      };
}
