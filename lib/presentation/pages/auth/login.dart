import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_login/logic/blocs/auth/bloc/auth_bloc.dart';
import 'package:bloc_login/logic/blocs/auth/bloc/auth_state.dart';
import 'package:bloc_login/logic/helpers/validator.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginForm = GlobalKey<FormState>();
  final FocusNode myFocusNodeEmailLogin = FocusNode();
  final FocusNode myFocusNodePasswordLogin = FocusNode();
  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeName = FocusNode();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  bool obscureText = true;
  late String device;

  @override
  void dispose() {
    emailController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.50;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.1, 0.5, 0.7, 0.9],
          colors: [
            Color(0xFF87CDE1),
            Color(0xFF53C1E9),
            Color(0xFF0093CD),
            Color(0xFF037EAF),
          ],
        )),
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20)
                      .add(EdgeInsets.only(top: height * 0.25)),
                  alignment: Alignment.center,
                  child: const Center(
                    child: ImageIcon(
                      AssetImage('assets/icons/login_240px.png'),
                      size: 100,
                      color: Color(0xFF037EAF),
                    ),
                  ),
                ),
                const Text(
                  'Login',
                  style: TextStyle(color: Color(0xFF037EAF), fontSize: 25),
                ),
                SizedBox(height: height * 0.18),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0)
                          .add(EdgeInsets.only(top: height * 0.2)),
                      child: BlocConsumer<AuthBloc, AuthState>(
                        listener: (context, state) {
                          if (state is AuthDenied) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(state.errors![0]),
                              duration: const Duration(milliseconds: 300),
                            ));
                          }
                        },
                        builder: (context, state) {
                          return Form(
                            key: _loginForm,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 40),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'UniNeue',
                                        fontSize: 18),
                                    validator: (val) => validateEmail(val!),
                                    controller: emailController,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                      hintText: 'Email',
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      prefixIcon: ImageIcon(
                                        AssetImage(
                                            'assets/icons/email_240px.png'),
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                    ),
                                    onChanged: (text) {
                                      
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, right: 40),
                                  child: TextFormField(
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'UniNeue',
                                        fontSize: 18),
                                    validator: (val) => validatePassword(val!),
                                    obscureText: obscureText,
                                    controller: pwdController,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: const TextStyle(
                                          color: Colors.white70),
                                      prefixIcon: const ImageIcon(
                                        AssetImage(
                                            'assets/icons/lock_80px.png'),
                                        size: 30,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: GestureDetector(
                                        onTap: _toggleObscure,
                                        child: Icon(
                                          obscureText
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          size: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                      enabledBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white70),
                                      ),
                                    ),
                                    onChanged: (text) {
                                      
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 40.0, right: 40),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: Size(
                                            width * 0.65, height * 0.12),
                                        side: const BorderSide(
                                            color: Colors.white, width: 1),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                      ),
                                      onPressed: (state is AuthLoading)? () => {null} :  () => {
                                                if(validateForm()){
                                                  BlocProvider.of<
                                                            AuthBloc>(
                                                        context)
                                                    .add(
                                                        AuthLoginRequested(
                                                            emailController
                                                                .text,
                                                            pwdController.text,
                                                            "BlocLogin"))
                                                }
                                              },
                                      child: (state is AuthLoading)? const SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(color: Colors.white,)) : const Text(
                                        'Login',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'UniNeue',
                                            fontSize: 20),
                                      )),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushNamed('/forgot-password');
                                    },
                                    child: const Text(
                                      'Forgot your password?',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'UniNeue',
                                          color: Colors.white,
                                          decoration: TextDecoration.underline),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Don't have an account?",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'UniNeue',
                                          fontSize: 18),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed('/register');
                                      },
                                      child: const Text(
                                        'Create one',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'UniNeue',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validateForm() {
    if (_loginForm.currentState!.validate()) {
      _loginForm.currentState?.save();
      return true;
    } else {
      return false;
    }
  }

  void _toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
