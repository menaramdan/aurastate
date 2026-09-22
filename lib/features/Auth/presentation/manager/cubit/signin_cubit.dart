import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signin_cubit_state.dart';

class SigninCubitCubit extends Cubit<SigninCubitState> {
  final AuthRepo authRepo;
  SigninCubitCubit(this.authRepo) : super(SigninCubitInitial());
  Future<void> signin(String email, String password) async {
    emit(SigninCubitLoading());
    var result = await authRepo.signInWithEmailAndPassword(email, password);
    result.fold(
      ifLeft: (failure) {
        emit(SigninCubitFailure(failure));
      },
      ifRight: (user) {
        emit(SigninCubitSuccess(user));
      },
    );
  }

  Future<void> signWithGoogle() async {
    emit(SigninCubitLoading());
    var result = await authRepo.signwithgoogle();
    result.fold(
      ifLeft: (failure) {
        emit(SigninCubitFailure(failure));
      },
      ifRight: (user) {
        emit(SigninCubitSuccess(user));
      },
    );
  }

  Future<void> signWithFacebook() async {
    emit(SigninCubitLoading());
    var result = await authRepo.signwithgoogle();
    result.fold(
      ifLeft: (failure) {
        emit(SigninCubitFailure(failure));
      },
      ifRight: (user) {
        emit(SigninCubitSuccess(user));
      },
    );
  }
}
