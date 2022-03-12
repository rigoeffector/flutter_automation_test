import 'package:flutter/material.dart';

class RegisterPublic extends StatefulWidget {
  const RegisterPublic({Key key}) : super(key: key);

  @override
  _RegisterPublicState createState() => _RegisterPublicState();
}

class _RegisterPublicState extends State<RegisterPublic> {
  final GlobalKey<FormState> _reg1Form = GlobalKey<FormState>();
  final GlobalKey<FormState> _otpForm = GlobalKey<FormState>();
  TextEditingController otpController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController cpwdController = TextEditingController();
  bool obscureText1 = true;
  bool obscureText = true;

  @override
  void dispose() {
    otpController.dispose();
    emailController.dispose();
    pwdController.dispose();
    cpwdController.dispose();
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
                        .add(EdgeInsets.only(top: height * 0.10)),
                    alignment: Alignment.center,
                    child: const Center(
                      child: ImageIcon(
                        AssetImage('assets/icons/registration_100px.png'),
                        size: 80,
                        color: Colors.white,
                      ),
                    )),
                const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white, fontSize: 25, fontFamily: 'UniNeue'),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0)
                          .add(EdgeInsets.only(top: height * 0.25)),
                      child: Form(
                        key: _reg1Form,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 40),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'UniNeue'),
                                validator: (val) {},
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
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
                                  top: 40, left: 20.0, right: 40),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.white, fontFamily: 'UniNeue'),
                                validator: (val) {},
                                obscureText: obscureText,
                                keyboardType: TextInputType.text,
                                controller: pwdController,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'UniNeue'),
                                  prefixIcon: const ImageIcon(
                                    AssetImage('assets/icons/lock_80px.png'),
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
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
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
                                  top: 40, left: 20.0, right: 40),
                              child: TextFormField(
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'UniNeue',
                                    fontSize: 18),
                                keyboardType: TextInputType.text,
                                validator: (val) {},
                                obscureText: obscureText1,
                                controller: cpwdController,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  hintStyle: const TextStyle(
                                      color: Colors.white70,
                                      fontFamily: 'UniNeue'),
                                  prefixIcon: const ImageIcon(
                                    AssetImage('assets/icons/lock_80px.png'),
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  suffixIcon: GestureDetector(
                                    onTap: _toggleObscure1,
                                    child: Icon(
                                      obscureText1
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      size: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
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
                                    //submit
                                  },
                                  child: const Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontFamily: 'UniNeue'),
                                  )),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Already have an account?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'UniNeue'),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed("/login");
                                  },
                                  child: const Text(
                                    'Login now',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'UniNeue',
                                    ),
                                  ),
                                ),
                              ],
                            )
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

  void _confirmCode() {
    var height = MediaQuery.of(context).size.height * 0.50;
    var width = MediaQuery.of(context).size.width;
    // AwesomeDialog(
    //   context: context,
    //   dialogBackgroundColor: const Color(0xFF0093CD),
    //   headerAnimationLoop: false,
    //   dialogType: DialogType.NO_HEADER,
    //   title: 'Confirm Company',dismissOnBackKeyPress: false,
    //   dismissOnTouchOutside: false,
    //   closeIcon: const Icon(
    //     Icons.close,
    //     color: Colors.white,
    //   ),
    //   showCloseIcon: true,
    //   body: Container(
    //     color: const Color(0xFF0093CD),
    //     child: Column(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Form(
    //               key: _otpForm,
    //               child: Column(
    //                 children: [
    //                   const Padding(
    //                     padding: EdgeInsets.all(8.0),
    //                     child: Text(
    //                       'Confirm Company',
    //                       style: TextStyle(
    //                           color: Colors.white,
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 28,
    //                           fontFamily: 'UniNeue'),
    //                     ),
    //                   ),
    //                   const SizedBox(
    //                     height: 10,
    //                   ),
    //                   Padding(
    //                     padding:
    //                     const EdgeInsets.only(left: 20.0, right: 40),
    //                     child: TextFormField(
    //                       style: const TextStyle(
    //                           color: Colors.white, fontFamily: 'UniNeue'),
    //                       validator: (val){
    //                         return null;
    //                       },
    //                       keyboardType: TextInputType.number,
    //                       controller: otpController,
    //                       decoration: const InputDecoration(
    //                         hintText: 'Enter Code',
    //                         hintStyle: TextStyle(
    //                             color: Colors.white70,
    //                             fontFamily: 'UniNeue'),
    //                         prefixIcon: Icon(
    //                           Icons.offline_pin,
    //                           size: 30,
    //                           color: Colors.white,
    //                         ),
    //                         enabledBorder: UnderlineInputBorder(
    //                           borderSide: BorderSide(color: Colors.white),
    //                         ),
    //                         focusedBorder: UnderlineInputBorder(
    //                           borderSide: BorderSide(color: Colors.white70),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   Padding(
    //                     padding: const EdgeInsets.only(
    //                         top: 50, left: 40.0, right: 40),
    //                     child: ElevatedButton(
    //                         style: ElevatedButton.styleFrom(
    //                           minimumSize:
    //                           Size(width * 0.65, height * 0.12),
    //                           side: const BorderSide(
    //                               color: Colors.white, width: 1),
    //                           shape: RoundedRectangleBorder(
    //                               borderRadius:
    //                               BorderRadius.circular(30)),
    //                         ),
    //                         onPressed: () {
    //                           // if (validateForm()) {
    //                           //   _checkOTP(context);
    //                           // }
    //                         },
    //                         child: const Text(
    //                           'Submit',
    //                           style: TextStyle(
    //                               color: Colors.white,
    //                               fontSize: 20,
    //                               fontFamily: 'UniNeue'),
    //                         )),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ],
    //       ),
    //   ),
    //   btnOkIcon: Icons.check_circle,
    // ).show();
  }

  void _checkOTP(BuildContext context) {
    // _registerController?.checkOTP(otpController.text, context);
    // Navigator.pop(context);
    // AwesomeDialog(
    //   context: context,
    //   dialogType: DialogType.INFO,
    //   animType: AnimType.BOTTOMSLIDE,
    //   dismissOnTouchOutside: false,
    //   title: 'Checking OTP',
    //   desc: 'loading.............',
    // ).show();
    // _otpForm.currentState?.reset();
  }

  void _toggleObscure() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _toggleObscure1() {
    setState(() {
      obscureText1 = !obscureText1;
    });
  }
}
