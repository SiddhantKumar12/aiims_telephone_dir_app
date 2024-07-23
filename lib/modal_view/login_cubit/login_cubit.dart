import 'package:aiims_telephone_directory/modal/user_modal.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../helper/dio_error_helper.dart';
import 'login_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void getLogin() async {
    emit(LoginLoading());
    try {
      final response = await LoginRepo.getLogin();

      if (response.statusCode == 200) {
        UserModal cadreModal = UserModal.fromJson(response.data);

        emit(LoginLoaded(userModal: cadreModal));
      } else {
        emit(LoginError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(LoginError(error: handleDioError(e)));
    } catch (e) {
      emit(LoginError(error: 'Something Went Wrong'));
    }
  }
}
