import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final double height, width;
  final Color color;
  final String image;
  const ProfileImage(
      {Key key, @required this. image, this.height = 100.0, this.width = 100.0, this.color = Colors.white,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        image: DecorationImage(
          image: NetworkImage('https://system.velocityhealth.co.za'+ image),
          fit: BoxFit.contain,
        ),
        border: Border.all(
          color: color,
          width: 3.0,
        ),
      ),
    );
  }
}
