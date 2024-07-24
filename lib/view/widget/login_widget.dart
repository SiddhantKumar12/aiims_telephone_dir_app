import 'package:aiims_telephone_directory/component/myTextForm.dart';
import 'package:aiims_telephone_directory/helper/Utils.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:aiims_telephone_directory/utils/textField_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'otp_widget.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final TextEditingController _controller = TextEditingController();
  bool showOtpField = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              ImagePath.login,
              height: 200.h,
              width: 200.h,
            ),
            Text(
              "Employee Verification",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "We need to register your Employee ID!",
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30.h,
            ),
            MyTextForm(
              inputFormatters: [
                LengthLimitingTextInputFormatter(8),
              ],
              label: "Employee",
              prefixIcon: Icon(
                Icons.person,
                size: 30.h,
                color: Colors.green.shade600,
              ),
              controller: _controller,
              onChanged: (value) {},
              validator: true,
              validatorFunc: MyValidationCheck.employeeIdValidator(),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade600,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Utils.snackbarToast('Coming soon');
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => MyVerify()));
                    // Navigator.pushNamed(context, 'verify');
                  },
                  child: Text("Send the code")),
            )
          ],
        ),
      ),
    );
  }
}
