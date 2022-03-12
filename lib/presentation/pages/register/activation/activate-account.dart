import 'package:argon_buttons_flutter/argon_buttons_flutter.dart';
import 'package:flutter/material.dart';

class ActivateAccount extends StatefulWidget {
  const ActivateAccount({ Key key }) : super(key: key);

  @override
  _ActivateAccountState createState() => _ActivateAccountState();
}

class _ActivateAccountState extends State<ActivateAccount> {
  final GlobalKey<FormState> _regCodeForm = GlobalKey<FormState>();
  TextEditingController regCodeController = TextEditingController();
  

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
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        child: const Image(
                            image: AssetImage('assets/icons/registration.png')))),
                Column(
                  children: [
                    Container(
                          margin: const EdgeInsets.all(10)
                              .add(EdgeInsets.only(top: height * 0.15)),
                          alignment: Alignment.center,
                          child: const Center(
                            child: ImageIcon(
                              AssetImage('assets/icons/password_200px.png'),
                              size: 200,
                              color: Colors.white,
                            ),
                          )),
                    const Text(
                          'Activate Account',
                          style: TextStyle(
                              color: Colors.white, fontSize: 25, fontFamily: 'UniNeue'),
                        ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0)
                                          .add(EdgeInsets.only(top: height * 0.10)),
                                      child: Form(
                                        key: _regCodeForm,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0, right: 40),
                                              child: TextFormField(
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'UniNeue'),
                                                validator: (val) {},
                                                controller: regCodeController,
                                                keyboardType: TextInputType.number,
                                                decoration: const InputDecoration(
                                                  hintText: 'Activation Code',
                                                  hintStyle: TextStyle(
                                                      color: Colors.white70,
                                                      fontFamily: 'UniNeue'),
                                                  prefixIcon: Icon(
                                                    Icons.offline_pin,
                                                    size: 30,
                                                    color: Colors.white,
                                                  ),
                                                  enabledBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white),
                                                  ),
                                                  focusedBorder:
                                                  UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.white70),
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
                                                    minimumSize: Size(width * 0.65,
                                                        height * 0.12),
                                                    side: const BorderSide(
                                                        color: Colors.white,
                                                        width: 1),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                  ),
                                                  onPressed: () {
                                                    // handle submit code here
                                                    
                                                  },
                                                  child: const Text(
                                                    'Submit',
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
                                    Padding(
                                        padding:
                                        EdgeInsets.only(top: height * 0.15),
                                        child: const Text(
                                          "Did not receive code?",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: 'UniNeue'),
                                        ),
                                      ),
                                
                                     Padding(
                                        padding: EdgeInsets.only(top: height * 0.1),
                                        child: ArgonTimerButton(
                                          height: 50,
                                          width: MediaQuery.of(context).size.width *
                                              0.45,
                                          minWidth:
                                          MediaQuery.of(context).size.width *
                                              0.30,
                                          highlightColor: Colors.transparent,
                                          highlightElevation: 0,
                                          roundLoadingShape: false,
                                          onTap: (startTimer, btnState) {
                                            // reg.controller.getcode(startTimer, btnState!, context);
                                          },
                                          initialTimer: 30,
                                          child: const Text(
                                            "Resend Code",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          loader: (timeLeft) {
                                            return Text(
                                              "Wait | $timeLeft",
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w700),
                                            );
                                          },
                                          borderRadius: 30.0,
                                          elevation: 1,
                                          borderSide: const BorderSide(
                                              color: Colors.white, width: 1.5),
                                        ),
                                      ),
                                   
                                  ],
                                ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
  }
}