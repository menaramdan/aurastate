part of 'signup_cubit_cubit.dart';

@immutable
sealed class SignupCubitState {}

final class SignupCubitInitial extends SignupCubitState {}

final class SignupCubitLoading extends SignupCubitState {}

final class SignupCubitSuccess extends SignupCubitState {
  final UserEntity userEntity;

  SignupCubitSuccess(this.userEntity);
}

final class SignupCubitFailure extends SignupCubitState {
  final Failure failure;

  SignupCubitFailure(this.failure);
}
