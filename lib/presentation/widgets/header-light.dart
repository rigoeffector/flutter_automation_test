import 'package:flutter/material.dart';

class HeaderLight extends StatelessWidget {
  final Widget child;
  const HeaderLight({Key key,
    @required this.child,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0.0),
      child: Container(
          margin: const EdgeInsets.only(bottom: 6.0),
          height: size.height * 0.05,
          width: size.width,
          decoration: const BoxDecoration(
            color: Colors.white,),
          child: child),
    );
  }
}
