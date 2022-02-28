import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:bloc_login/data/models/user_model.dart';


abstract class AuthState extends Equatable {
  const AuthState([List props = const []]): super();
}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props =>[];
}

class AuthLoading extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthGranted extends AuthState {
  final String? token;
  final User? user;
  AuthGranted(this.token, this.user): super([token, user]);

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'user': user?.toJson(),
    };
  }

  factory AuthGranted.fromMap(Map<String, dynamic> map) {
    return AuthGranted(
      map['token'],
      map['user'] != null ? User.fromJson(map['user']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthGranted.fromJson(String source) => AuthGranted.fromMap(json.decode(source));

  @override
  List<Object?> get props => [token, user];
}

class AuthDenied extends AuthState {
  final List<String>? errors;
  const AuthDenied(this.errors);

  @override
  List<Object?> get props => [errors];
}
