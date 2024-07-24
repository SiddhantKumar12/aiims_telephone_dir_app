import 'package:aiims_telephone_directory/view/widget/login_widget.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../component/appbar.dart';
import '../component/bgimage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CustomImageContainer(child: LoginWidget()),
    );
  }
}
