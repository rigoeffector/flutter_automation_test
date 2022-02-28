import 'package:flutter/material.dart';

class ForgotPasswordChange extends StatefulWidget {
  const ForgotPasswordChange({Key? key}) : super(key: key);

  @override
  _ForgotPasswordChangeState createState() => _ForgotPasswordChangeState();
}

class _ForgotPasswordChangeState extends State<ForgotPasswordChange> {
  final GlobalKey<FormState> _resetPwdForm = GlobalKey<FormState>();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  bool obscureText1 = true;
  bool obscureText2 = true;

  @override
  void dispose() {
    pwdController.dispose();
    cpwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height * 0.50;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0093CD),
          centerTitle: true,
          title: const Text("Reset your Password",
              style: TextStyle(fontFamily: 'UniNeue', color: Colors.white)),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              height: height * 0.2,
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://velocityhealth.co.za/assets/images/icons/logo.png"),
                        fit: BoxFit.fill,
                      ),
                      border: Border.all(
                        color: const Color(0xFF0093CD),
                        width: 3.0,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: const <Widget>[
                          Text(
                            "Name Surname",
                            style: TextStyle(
                              color: Color(0xFF0093CD),
                              fontSize: 20.0,
                              fontFamily: 'UniNeue',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "email@example.com",
                        style: TextStyle(
                          color: Color(0xFF0093CD),
                          fontSize: 13.0,
                          fontFamily: 'UniNeue',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Text(
                  "Strong password contains numbers, letters and punctuation marks",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xFF0093CD),
                      fontSize: 20,
                      fontFamily: 'UniNeue')),
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: Form(
                key: _resetPwdForm,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, right: 40),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color(0xFF0093CD), fontFamily: 'UniNeue'),
                        validator: (val) {
                          return null;
                        },
                        controller: pwdController,
                        obscureText: obscureText1,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          hintText: 'New Password',
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscure1,
                            child: Icon(
                              obscureText1
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.0,
                              color: const Color(0xFF0093CD),
                            ),
                          ),
                          hintStyle: const TextStyle(
                              color: Color(0xFF0093CD), fontFamily: 'UniNeue'),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: const Color(0xffff026c93)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF0093CD)),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20.0, right: 40, top: 50),
                      child: TextFormField(
                        style: const TextStyle(
                            color: Color(0xFF0093CD), fontFamily: 'UniNeue'),
                        validator: (val) {
                          return null;
                        },
                        controller: cpwdController,
                        keyboardType: TextInputType.text,
                        obscureText: obscureText2,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          suffixIcon: GestureDetector(
                            onTap: _toggleObscure2,
                            child: Icon(
                              obscureText2
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 20.0,
                              color: Color(0xFF0093CD),
                            ),
                          ),
                          hintStyle: const TextStyle(
                              color: Color(0xFF0093CD), fontFamily: 'UniNeue'),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFFF026C93)),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF0093CD)),
                          ),
                        ),
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 50, left: 40.0, right: 40),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(width * 0.65, height * 0.12),
                            side: const BorderSide(
                                color: Color(0xFF0093CD), width: 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                          ),
                          onPressed: () {
                            //submit
                          },
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'UniNeue'),
                          )),
                    ),
                  ],
                ),
              )),
            )
          ],
        ));
    ;
  }

  void _toggleObscure1() {
    setState(() {
      obscureText1 = !obscureText1;
    });
  }

  void _toggleObscure2() {
    setState(() {
      obscureText2 = !obscureText2;
    });
  }
}
