import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:aiims_telephone_directory/view/widget/contacts.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
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
    return MyScaffold(
        showLogin: true,
        body: CustomImageContainer(
          child: ContactListPage(),
        ));
  }
}
