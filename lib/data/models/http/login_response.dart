import 'dart:convert';
import 'package:bloc_login/data/models/user_model.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.success,
        this.message,
        this.user,
        this.token,
    });

    bool success;
    String message;
    User user;
    String token;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        success: json["success"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "user": user?.toJson(),
        "token": token,
    };
}
