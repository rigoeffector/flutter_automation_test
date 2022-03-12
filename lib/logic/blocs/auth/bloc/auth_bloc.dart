import 'dart:async';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:bloc_login/data/models/http.response.dart';
import 'package:bloc_login/data/models/http/login_response.dart';
import 'package:bloc_login/data/models/user_model.dart';
import 'package:bloc_login/data/repositories/authentication_repository/authentication_repository.dart';

import 'auth_state.dart';
part 'auth_event.dart';

class AuthBloc extends HydratedBloc<AuthEvent, AuthState> {
  AuthBloc({AuthenticationRepository authenticationRepository}) : _authenticationRepository = authenticationRepository, super(AuthInitial()) {
    // handle auth init
    on<AuthInit>(_onAuthenticationInit);
    on<AuthLogoutRequested>(_onAuthenticationLogoutRequested);
    on<AuthLoginRequested>(_onAuthenticationLoginRequested);
    on<AuthRefreshRequested>(_onAuthenticationLoginRefresh);
    on<Authenticated>(_onAuthenticated);
  }
  
  final AuthenticationRepository _authenticationRepository;

  Future<FutureOr<void>> _onAuthenticationInit(AuthInit event, Emitter<AuthState> emit) async {
    // check if current state is AuthGranted
    // if AuthGranted -> preserve state
    // else emit AuthInitial state
    emit(state is AuthGranted ?  state : AuthInitial());
  }

  Future<FutureOr<void>> _onAuthenticationLogoutRequested(AuthLogoutRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    await _authenticationRepository.logOut(event.token);

    emit(AuthInitial());
  }

  Future<FutureOr<void>> _onAuthenticationLoginRequested(AuthLoginRequested event, Emitter<AuthState> emit) async {
    try{
      emit(AuthLoading());
      Response parsed = await _authenticationRepository.logIn(
          username: event.email, password: event.password, device: event.device);
      HttpResponse response =
      HttpResponse.fromJson(parsed.data, parsed.statusCode);

      if (response.status == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        emit(AuthGranted(loginResponse.token, loginResponse.user));
      }else{
        emit(const AuthDenied(["Login failed"]));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(const AuthDenied(["Unknown error"]));
    }
  }
  
  FutureOr<void> _onAuthenticated(Authenticated event, Emitter<AuthState> emit) {
    emit(AuthGranted(event.token, event.user));
  }

  Future<FutureOr<void>> _onAuthenticationLoginRefresh(AuthRefreshRequested event, Emitter<AuthState> emit) async {
    
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) {
    try {
      return AuthGranted.fromMap(json);
    } catch (_) {
      return AuthInitial();
    }
  }

  @override
  Map<String, dynamic> toJson(AuthState state) {
    if(state is AuthGranted){
      return state.toMap();
    }else{
      return null;
    }
  }
}
