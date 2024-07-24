part of 'helpline_number_cubit.dart';

@immutable
sealed class HelplineNumberState {}

final class HelplineNumberInitial extends HelplineNumberState {}

final class HelplineNumberLoading extends HelplineNumberState {}

final class HelplineNumberLoaded extends HelplineNumberState {}

final class HelplineNumberError extends HelplineNumberState {
  final String error;
  HelplineNumberError({required this.error});
}
