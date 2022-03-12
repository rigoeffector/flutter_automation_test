import 'dart:async';
import 'dart:io';
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
    }on SocketException catch (_) {
      
    } on FormatException catch (_) {
      
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Response res = e.response;
      if(res == null){
        if (kDebugMode) {
          print(e.type);
        }
        
      }else{
        HttpResponse response = HttpResponse.fromJson(res.data, res.statusCode);
        switch (e.type) {
          case DioErrorType.response:
            if (res.statusCode == 500) {
              emit(const AuthDenied(["System error"]));
            }

            else if(res.statusCode == 403){
              emit(const AuthDenied(["Some Error"]));
            }

            else if(res.statusCode == 404){
              print(res.data);
              emit(const AuthDenied(["Not Found"]));
            }

            
            else if(res.statusCode == 401){
              emit(const AuthDenied(["Invalid login credentials"]));
              
            }

            else if (res.statusCode == 422) {
              if(response.data['error']['message']['email'] != null){
                emit(const AuthDenied(["Unknown error"]));
                    // message: response.data['error']['message']['email'][0]));
              }
              if(response.data['error']['message']['password'] != null){
                emit(const AuthDenied(["Unknown error"]));
                    // message: response.data['error']['message']['password'][0]));
              }
              if(response.data['error']['message']['device_name'] != null){
                emit(const AuthDenied(["Unknown error"]));
                    // message: response.data['error']['message']['device_name'][0]));
              }
            } else {
              emit(const AuthDenied(["Unknown error"]));
                  // message: response.data['error']['message']));
              
            }

            break;
          case DioErrorType.sendTimeout:
            emit(const AuthDenied(["Unknown error"]));
                // message: 'Timed out. Please check your connection'));
            break;
          case DioErrorType.cancel:
            emit(const AuthDenied(["Unknown error"]));
                // message: 'Request cancelled'));
            break;

          case DioErrorType.other:
            break;
          case DioErrorType.connectTimeout:
            emit(const AuthDenied(["Unknown error"]));
                // message: 'Connection timed out. Please check your data connection'));
            break;

          case DioErrorType.receiveTimeout:
            emit(const AuthDenied(["Timed out. Please try again later"]));
                // message: ''));
            break;

          default:
            
            break;
        }
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
