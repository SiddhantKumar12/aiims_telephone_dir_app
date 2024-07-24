import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/myText.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 03), () {
      Navigator.pushReplacementNamed(context, RoutePath.welcome);
      // Navigator.pushReplacement(
      //     context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomImageContainer(
      imagePath: ImagePath.splashBackground,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50.h),
              child: Image.asset(
                ImagePath.logo,
                height: 200.h,
                width: 200.h,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: [
                MyText(
                    label: "AIIMS Delhi",
                    fontSize: 25.sp,
                    fontColor: Colors.black),
                // MyText(lable: lable, fontsize: fontsize, fontcolor: fontcolor)
                Text(
                  'TELEPHONE DIRECTORY',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.sp,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
