import 'package:flutter/material.dart';

class CustomImageContainer extends StatelessWidget {
  final String imagepath;
  final Widget child;

  CustomImageContainer({required this.imagepath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagepath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            spreadRadius: 5,
            blurRadius: 5,
            // offset: Offset(0, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
