import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:dart_either/src/dart_either.dart';

class AuthRepoImple extends AuthRepo {
  @override
  Future<Either<Failure, UserEntity>> createUserAndPassword() {
    // TODO: implement createUserAndPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> loginwithuser() {
    // TODO: implement loginwithuser
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signwithFacebook() {
    // TODO: implement signwithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signwithgoogle() {
    // TODO: implement signwithgoogle
    throw UnimplementedError();
  }
}
