part of 'signin_cubit.dart';

@immutable
sealed class SigninCubitState {}

final class SigninCubitInitial extends SigninCubitState {}

final class SigninCubitLoading extends SigninCubitState {}

final class SigninCubitSuccess extends SigninCubitState {
  final UserEntity userEntity;

  SigninCubitSuccess(this.userEntity);
}

final class SigninCubitFailure extends SigninCubitState {
  final Failure failure;

  SigninCubitFailure(this.failure);
}
