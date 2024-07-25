import 'dart:convert';
import 'package:aiims_telephone_directory/component/bgimage.dart';
import 'package:aiims_telephone_directory/component/myTextForm.dart';
import 'package:aiims_telephone_directory/helper/validation_checker.dart';
import 'package:aiims_telephone_directory/modal_view/get_otp/get_otp_cubit.dart';
import 'package:aiims_telephone_directory/route/pageroute.dart';
import 'package:aiims_telephone_directory/utils/image.dart';
import 'package:aiims_telephone_directory/view/widget/scaffold_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _empController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool showOtpField = false;

  @override
  void dispose() {
    _empController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      body: CustomImageContainer(
        child: SingleChildScrollView(
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
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextForm(
                        inputFormatters: [
                          // LengthLimitingTextInputFormatter(8),
                        ],
                        label: "Employee",
                        prefixIcon: Icon(
                          Icons.person,
                          size: 28.sp,
                          color: Colors.green.shade600,
                        ),
                        controller: _empController,
                        onChanged: (value) {},
                        validator: true,
                        // validatorFunc: MyValidationCheck.employeeIdValidator(),
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 45,
                        child: BlocListener<GetOtpCubit, GetOtpState>(
                          listener: (context, state) {
                            if (state is GetOtpLoading) {
                              Utils.showLoadingProgress(context);
                            }
                            if (state is GetOtpLoaded) {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => OTPScreen(
                              //               empId: _empController.text.trim(),
                              //               otp: state.otp,
                              //             )));
                              Navigator.pop(context);
                              Navigator.pushNamed(context, RoutePath.otpVerify,
                                  arguments: {
                                    'empId': _empController.text
                                        .trim(), // replace with actual employee ID
                                    'otp': state.otp,
                                  });
                            }
                            Navigator.pop(context);
                            if (state is GetOtpError) {
                              MySncakbar.snackbarToast(state.error);
                            }
                          },
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // print(_controller.text.toString());
                                  // otpFunc();
                                  BlocProvider.of<GetOtpCubit>(context).getOtp(
                                      empId: _empController.text.trim());
                                  // Utils.snackbarToast('Code sent');
                                  // // Perform the action of sending the code here
                                  // // Navigator.pushNamed(context, 'verify');
                                } else {
                                  MySncakbar.snackbarToast(
                                      'Invalid Employee ID');
                                }
                              },
                              child: Text("Send the code")),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> otpFunc() async {
  var headers = {'Content-Type': 'application/json'};
  var data = json.encode({"employeeId": "ADMIN@123"});
  var dio = Dio();
  var response = await dio.request(
    'http://192.168.24.131:8080/generate-token-otp',
    options: Options(
      method: 'POST',
      headers: headers,
    ),
    data: data,
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  } else {
    print(response.statusMessage);
  }
}
