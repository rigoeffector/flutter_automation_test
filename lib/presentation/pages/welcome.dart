import 'package:bloc_login/presentation/pages/auth/login.dart';
import 'package:bloc_login/presentation/pages/register/register_public.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({
    Key key,
  }) : super(key: key);

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
            Container(
              height: height + 25,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(height),
                    bottomLeft: Radius.circular(height),
                  )),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: height * 0.25, bottom: height * 0.4),
                  child: Container(
                      margin: const EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: const Image(
                        height: 200,
                        width: 200,
                        fit: BoxFit.contain,
                        image: AssetImage('assets/icons/logo.jpeg'),
                      )),
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            ElevatedButton(
                              key:Key('loginBtn'),
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.65, height * 0.12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/login');
                                },
                                child: const Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            SizedBox(
                              height: height * 0.1,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  minimumSize:
                                      Size(width * 0.65, height * 0.12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushNamed('/register');
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
