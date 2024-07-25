part of 'get_otp_cubit.dart';

@immutable
sealed class GetOtpState {}

final class GetOtpInitial extends GetOtpState {}

final class GetOtpLoading extends GetOtpState {}

final class GetOtpLoaded extends GetOtpState {
  final String otp;
  GetOtpLoaded({required this.otp});
}

final class GetOtpError extends GetOtpState {
  final String error;
  GetOtpError({required this.error});
}
