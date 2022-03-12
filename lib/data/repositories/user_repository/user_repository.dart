import 'dart:async';

import 'package:bloc_login/data/models/user_model.dart';

class UserRepository {
  User _user;

  Future<User> getUser() async {
    if (_user != null) return _user;
    
  }
}
