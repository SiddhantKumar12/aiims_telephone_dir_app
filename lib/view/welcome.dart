import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Image.asset(ImagePath.logo),
          title: ListTile(
            title: Text(
              "Telephone",
              style: TextStyle(fontSize: 20.sp),
            ),
            subtitle: Text(
              "Directory",
              style: TextStyle(fontSize: 16.sp),
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
            )
          ],
        ),
        body: CustomImageContainer(
            imagepath: ImagePath.allBackground, child: Container()
            //     Column(
            //   //crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Text("Emergency No."),
            //   ],
            // )
            ));
  }
}
