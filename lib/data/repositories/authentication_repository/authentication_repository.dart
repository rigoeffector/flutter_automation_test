import 'dart:async';
import 'package:dio/dio.dart';
import 'package:bloc_login/data/dataproviders/http.provider.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated, error, loading }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _httpProvider = HttpProvider();
  Stream<AuthenticationStatus> get status async* {
    yield* _controller.stream;
  }

  Future<Response> logIn({
    required String username,
    required String password,
    required String device
  }) async {
    return await _httpProvider.auth(username: username, password: password, device: device);
  }

  logOut(String token) async {
    //do logout api call here
    // _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
