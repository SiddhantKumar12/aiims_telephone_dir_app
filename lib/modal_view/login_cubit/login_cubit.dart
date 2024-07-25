import 'package:aiims_telephone_directory/modal/user_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import '../../helper/dio_error_helper.dart';
import '../../helper/mycommon_text.dart';
import 'login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void getLogin({required String empId, required String otp}) async {
    emit(LoginLoading());
    try {
      final response = await LoginRepo.getLogin(empId: empId, otp: otp);

      if (response.statusCode == 200) {
        UserModal userModal = UserModal.fromJson(response.data);

        emit(LoginLoaded(userModal: userModal));
      } else {
        emit(LoginError(error: response.data[MyCommonText.message]));
      }
    } on DioException catch (e) {
      emit(LoginError(error: handleDioError(e)));
    } catch (e) {
      emit(LoginError(error: 'Something Went Wrong'));
    }
  }
}
