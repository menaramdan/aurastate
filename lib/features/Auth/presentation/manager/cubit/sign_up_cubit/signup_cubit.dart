import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_cubit_state.dart';

class SignupCubitCubit extends Cubit<SignupCubitState> {
  final AuthRepo authRepo;
  SignupCubitCubit(this.authRepo) : super(SignupCubitInitial());
  Future<void> signup(String email, String password, String username) async {
    emit(SignupCubitLoading());
    var result = await authRepo.createUserAndPassword(
      email,
      password,
      username,
    );
    result.fold(
      ifLeft: (Failure) {
        emit(SignupCubitFailure(Failure));
      },
      ifRight: (user) {
        emit(SignupCubitSuccess(user));
      },
    );
  }
}
