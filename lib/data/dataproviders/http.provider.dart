import 'dart:io';
import 'package:dio/dio.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class HttpProvider {
  var http = Dio(BaseOptions(
      baseUrl: "https://example.com",
      connectTimeout: _defaultConnectTimeout,
      receiveTimeout: _defaultReceiveTimeout,
      headers: {
        HttpHeaders.userAgentHeader: "dio",
        "api": "1.0.0",
      },
      contentType: Headers.jsonContentType));

  Response response;

  // ignore: non_constant_identifier_names
  Future<dynamic> otp_check({String code}) async {
    return await http.post('/otp/check',
        data: {'otp_code': code},
        options: Options(responseType: ResponseType.json));
  }

  Future<dynamic> auth({String username, password, device}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return await http.post('/login',
        data: {'email': username, 'password': password, 'device_name': device},
        options: Options(headers: header));
  }

  Future<dynamic> reg({String username, String password, cpassword}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.post("/register/public",
        data: {
          'email': username,
          'password': password,
          "password_confirmation": cpassword
        },
        options: Options(headers: header));
  }

  Future<dynamic> fgtRequest(String email) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };

    return await http.post("/fgt/request",
        data: {
          'email': email,
        },
        options: Options(headers: header));
  }

  Future<dynamic> fgtVerifyCode(String email, code) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.post("/fgt/verify/code",
        data: {
          'email': email,
          'code': code,
        },
        options: Options(headers: header));
  }

  Future<dynamic> fgtResetPwd(
      String email, String newPassword, String confirmPassword, code) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return await http.post("/fgt/reset/password",
        data: {
          'code': code,
          'email': email,
          'new_password': newPassword,
          'new_password_confirmation': confirmPassword,
        },
        options: Options(headers: header));
  }

  Future<dynamic> activate({String username, String code}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return http.post("/activation/request",
        data: {
          'email': username,
          'code': code,
        },
        options: Options(headers: header));
  }

  Future<dynamic> getcode({String username}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    return http.post("/activation/code",
        data: {
          'email': username,
        },
        options: Options(headers: header));
  }

  Future<dynamic> logout({String token}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await http.post("/logout",
        data: {}, options: Options(headers: header));
  }

  Future<dynamic> changepassword(
      {String password, newpassword, confirmpassword, token}) async {
    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await http.post("/profile/change-password",
        data: {
          'password': password,
          'new_password': newpassword,
          'new_password_confirmation': confirmpassword
        },
        options: Options(headers: header));
  }

  Future download(String url, String file) async {}
}
