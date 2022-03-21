import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/logic/blocs/auth/bloc/auth_bloc.dart';
import 'package:bloc_login/logic/blocs/auth/bloc/auth_state.dart';
import 'package:bloc_login/presentation/router/app_routes.dart';
import 'package:flutter_driver/driver_extension.dart';
import 'data/repositories/authentication_repository/authentication_repository.dart';

void main() async {
  enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(App(
      authenticationRepository: AuthenticationRepository(),
    )),
    storage: storage,
  );
}

class App extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;

  const App({
    Key key,
    this.authenticationRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      // initialize auth bloc with the *AuthInit* event which fetches previous state
      child: BlocProvider(
        create: (context) {
          return AuthBloc(
            authenticationRepository: authenticationRepository,
          )..add(AuthInit());
        },
        child: BlocApp(),
      ),
    );
  }
}

class BlocApp extends StatelessWidget {
  BlocApp({Key key}) : super(key: key);

  final AppRouter _appRouter = AppRouter();
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/icons/logo.png'), context);
    precacheImage(
        const AssetImage('assets/icons/welcome-background.png'), context);
    precacheImage(
        const AssetImage('assets/icons/registration_100px.png'), context);
    precacheImage(const AssetImage('assets/icons/registration.png'), context);
    precacheImage(const AssetImage('assets/icons/login_240px.png'), context);
    precacheImage(const AssetImage('assets/icons/menu.png'), context);

    return MaterialApp(
      title: 'Velocity Health',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthGranted) {
                  _navigator.pushNamedAndRemoveUntil("/home", (route) => false);
                } else if (state is AuthInitial) {
                  // _navigator.pushNamedAndRemoveUntil("/home", (route) => false);
                  _navigator.pushNamedAndRemoveUntil("/", (route) => false);
                }
              },
              child: child,
            );
          },
        );
      },
      onGenerateRoute: _appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
