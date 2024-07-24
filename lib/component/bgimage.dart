import 'package:flutter/material.dart';

import '../utils/image.dart';

class CustomImageContainer extends StatelessWidget {
  final String? imagePath;
  final Widget child;

  CustomImageContainer({this.imagePath, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath ?? ImagePath.allBackground),
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
