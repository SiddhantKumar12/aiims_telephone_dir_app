import 'package:aiims_telephone_directory/modal_view/helpline_number_cubit/hepline_number_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../helper/dio_error_helper.dart';

part 'helpline_number_state.dart';

class HelplineNumberCubit extends Cubit<HelplineNumberState> {
  HelplineNumberCubit() : super(HelplineNumberInitial());

  void getLogin() async {
    emit(HelplineNumberLoading());
    try {
      final response = await HelpLineNumberRepo.getNumber();

      if (response.statusCode == 200) {
        // UserModal cadreModal = UserModal.fromJson(response.data);

        emit(HelplineNumberLoaded());
      } else {
        emit(HelplineNumberError(error: response.data['error']));
      }
    } on DioException catch (e) {
      emit(HelplineNumberError(error: handleDioError(e)));
    } catch (e) {
      emit(HelplineNumberError(error: 'Something Went Wrong'));
    }
  }
}
