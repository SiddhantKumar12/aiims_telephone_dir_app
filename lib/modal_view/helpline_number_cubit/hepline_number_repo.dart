import 'package:dio/dio.dart';

import '../../helper/api_strings.dart';
import '../../helper/dio_helper.dart';

class HelpLineNumberRepo {
  static Future<Response> getNumber() async {
    try {
      Dio dio = DioApi().sendRequest;
      final response = await dio.get(ApiStrings.helpLineNumber);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
