import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/errors/failure_code.dart';
import 'package:aurastate/core/services/firebase_auth_services.dart';
import 'package:aurastate/features/Auth/Data/models/user_model.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:dart_either/src/dart_either.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  AuthRepoImple(this.firebaseAuthServices);
  @override
  Future<Either<Failure, UserEntity>> createUserAndPassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      var user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email,
        password,
        username,
      );
      var userEntity = Usermodel.fromEntity(
        UserEntity(username: username, email: email, uid: user.uid),
      );
      return Right(userEntity);
    } on AppFailure catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signwithFacebook() async {
    try {
      var user = await firebaseAuthServices.signInWithFacebook();
      var userEnitiy = Usermodel.Firebaseuser(user.user!);
      return Right(userEnitiy);
    } on AppFailure catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signwithgoogle() async {
    try {
      var user = await firebaseAuthServices.signInWithGoogle();
      var userEnitiy = Usermodel.Firebaseuser(user.user!);
      return Right(userEnitiy);
    } on Exception catch (e) {
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    } on AppFailure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      var result = await firebaseAuthServices.signInWithEmailAndPassword(
        email,
        password,
      );
      var userEnitiy = Usermodel.fromEntity(
        UserEntity(
          username: result.displayName ?? '',
          email: email,
          uid: result.uid,
        ),
      );
      return Right(userEnitiy);
    } on AppFailure catch (e) {
      return Left(e);
    } on Exception catch (e) {
      return Left(
        AppFailure(failureCode: FailureCode.unknown, message: e.toString()),
      );
    }
  }
}
