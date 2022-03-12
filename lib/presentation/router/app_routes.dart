import 'package:flutter/material.dart';
import 'package:bloc_login/presentation/pages/auth/forgot-password-code.dart';
import 'package:bloc_login/presentation/pages/auth/forgot-password-password-update.dart';
import 'package:bloc_login/presentation/pages/auth/forgot_password.dart';
import 'package:bloc_login/presentation/pages/auth/login.dart';
import 'package:bloc_login/presentation/pages/home/home.dart';
import 'package:bloc_login/presentation/pages/register/register_public.dart';
import 'package:bloc_login/presentation/pages/welcome.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    // final GlobalKey<ScaffoldState>? key = settings.arguments as GlobalKey<ScaffoldState>?;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const WelcomeScreen(),
        );
      case '/login':
        return MaterialPageRoute(
          builder: (_) => const Login(),
        );
      case '/forgot-password':
        return MaterialPageRoute(
          builder: (_) => const ForgotPassword(),
        );
      case '/forgot-password/confirm':
        return MaterialPageRoute(
          builder: (_) => const ConfirmForgotPasswordCode(),
        );
      case '/forgot-password/update-password':
        return MaterialPageRoute(
          builder: (_) => const ForgotPasswordChange(),
        );
      case '/register':
        return MaterialPageRoute(
          builder: (_) => const RegisterPublic(),
        );
    
      case '/home':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      default:
        return null;
    }
  }
}
