import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:aiims_telephone_directory/view/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/appbar.dart';
import '../route/route_generater.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   backgroundColor: Colors.white,
        //   leading: Image.asset(ImagePath.logo),
        //   title: ListTile(
        //     title: Text(
        //       "Telephone Directory",
        //       style: TextStyle(fontSize: 16.sp),
        //     ),
        //     subtitle: Text(
        //       "All India Institute Of Medical Sciences\nNew Delhi",
        //       style: TextStyle(fontSize: 12.sp),
        //     ),
        //   ),
        //   // actions: [
        //   //   TextButton(
        //   //     onPressed: () {},
        //   //     child: Text(
        //   //       "LOGIN",
        //   //       style: TextStyle(color: Colors.blue, fontSize: 14.sp),
        //   //     ),
        //   //     // style: ButtonStyle(
        //   //     //   backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        //   //     // ),
        //   //   )
        //   // ],
        // ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 80.h,
          title: CustomAppBar(),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  //MyRoutes.navigateToSettingsScreen(context);
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
        body: CustomImageContainer(
            imagepath: ImagePath.allBackground, child: ContactListPage()));
  }
}
