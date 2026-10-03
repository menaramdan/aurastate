part of 'forgetandresetpassword_cubit.dart';

@immutable
sealed class ForgetandresetpasswordState {}

final class ForgetandresetpasswordInitial extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordLoading extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordSuccess extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordFailure extends ForgetandresetpasswordState {
  final String message;
  ForgetandresetpasswordFailure(this.message);
}
