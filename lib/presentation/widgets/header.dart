import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Widget child;
  const Header({Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          height: size.height * 0.1,
          decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0.0, 1.0), //(x,y)
                  blurRadius: 6.0,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.5, 0.9],
                colors: [
                  Color(0xFF53C1E9),
                  Color(0xFF0093CD),
                  Color(0xFFFF026C93),
                ],
              )),
          child: child),
    );
  }
}
