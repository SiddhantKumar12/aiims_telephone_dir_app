import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class LoginRepo {
  static Future<Response> getLogin() async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio.post(ApiStrings.login,
          data: {"username": "admin@123", "password": "abc"});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
