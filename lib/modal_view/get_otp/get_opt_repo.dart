import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class OtpRepo {
  static Future<Response> getOtp({required String empId}) async {
    try {
      print(empId);
      Dio dio = DioApi().sendRequest;
      print(empId);

      final response = await dio.post(ApiStrings.getOtp, data: {
        "employeeId": empId,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
