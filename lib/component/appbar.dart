import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/helper_text.dart';
import '../utils/image.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(
        ImagePath.logo,
        height: 70.h,
        width: 70.h,
        color: Colors.black,
      ),
      title: Text(
        CommonText.appName,
        style: TextStyle(fontSize: 14.sp),
      ),
      subtitle: Text(
        "All India Institute Of Medical Sciences\nNew Delhi",
        style: TextStyle(fontSize: 12.sp),
      ),
    );
  }
}
