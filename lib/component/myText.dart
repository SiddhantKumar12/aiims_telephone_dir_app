import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyText extends StatelessWidget {
  final String label;
  final double? fontSize;
  final Color? fontColor;
  bool alignment;

  MyText(
      {super.key,
      required this.label,
      this.fontSize,
      this.fontColor,
      this.alignment = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
        fontSize: fontSize ?? 16.sp,
        color: fontColor,
      ),
      textAlign: alignment ? TextAlign.center : TextAlign.start,
    );
  }
}
