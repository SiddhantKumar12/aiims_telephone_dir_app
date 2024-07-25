import 'package:aiims_telephone_directory/helper/mycommon_text.dart';
import 'package:aiims_telephone_directory/modal_view/get_otp/get_opt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../helper/dio_error_helper.dart';
part 'get_otp_state.dart';

class GetOtpCubit extends Cubit<GetOtpState> {
  GetOtpCubit() : super(GetOtpInitial());

  void getOtp({required String empId}) async {
    emit(GetOtpLoading());
    try {
      final response = await OtpRepo.getOtp(empId: empId);

      if (response.statusCode == 200) {
        String otp = response.data["otp"];

        emit(GetOtpLoaded(otp: otp));
      } else {
        emit(GetOtpError(error: response.data[MyCommonText.message]));
      }
    } on DioException catch (e) {
      emit(GetOtpError(error: handleDioError(e)));
    } catch (e) {
      emit(GetOtpError(error: 'Something Went Wrong'));
    }
  }
}
