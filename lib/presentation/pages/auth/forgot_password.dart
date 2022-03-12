import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final GlobalKey<FormState> _fgtForm = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
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
            const Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child:
                    Image(image: AssetImage('assets/icons/registration.png'))),
            Column(
              children: [
                Container(
                    margin: const EdgeInsets.all(10)
                        .add(EdgeInsets.only(top: height * 0.2)),
                    alignment: Alignment.center,
                    child: const Center(
                      child: ImageIcon(
                        AssetImage('assets/icons/lock_240px.png'),
                        size: 120,
                        color: Colors.white,
                      ),
                    )),
                const Text(
                  'Find your Velocity Account',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'UniNeue'),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                        "Enter the email address for your account to find your account for password reset.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'UniNeue')),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0)
                          .add(EdgeInsets.only(top: height * 0.10)),
                      child: Form(
                        key: _fgtForm,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 40),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'UniNeue'),
                                validator: (val) {
                                  return null;
                                },
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Enter your email',
                                  hintStyle: TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'UniNeue'),
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white70),
                                  ),
                                ),
                                onChanged: (text) {
                                  setState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 50, left: 40.0, right: 40),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    minimumSize:
                                        Size(width * 0.65, height * 0.12),
                                    side: const BorderSide(
                                        color: Colors.white, width: 1),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushNamed('/forgot-password/confirm');
                                  },
                                  child: const Text(
                                    'Search',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'UniNeue'),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
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
}
