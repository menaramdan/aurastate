part of 'forgetandresetpassword_cubit.dart';

@immutable
sealed class ForgetandresetpasswordState {}

final class ForgetandresetpasswordInitial extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordLoading extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordSuccess extends ForgetandresetpasswordState {}

final class ForgetandresetpasswordFailure extends ForgetandresetpasswordState {
  final Failure failure;
  ForgetandresetpasswordFailure(this.failure);
}
