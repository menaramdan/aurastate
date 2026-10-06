import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'forgetandresetpassword_state.dart';

class ForgetandresetpasswordCubit extends Cubit<ForgetandresetpasswordState> {
  final AuthRepo authRepo;
  ForgetandresetpasswordCubit(this.authRepo)
    : super(ForgetandresetpasswordInitial());
  Future<void> forgetPassword(String email) async {
    emit(ForgetandresetpasswordLoading());
    var result = await authRepo.forgotPassword(email);
    result.fold(
      ifLeft: (failure) {
        emit(ForgetandresetpasswordFailure(failure));
      },
      ifRight: (value) {
        emit(ForgetandresetpasswordSuccess());
      },
    );
  }

  Future<void> sendEmailVerification() async {
    emit(ForgetandresetpasswordLoading());
    var result = await authRepo.sendEmailVerification();
    result.fold(
      ifLeft: (failure) {
        emit(ForgetandresetpasswordFailure(failure));
      },
      ifRight: (value) {
        emit(ForgetandresetpasswordSuccess());
      },
    );
  }
}
