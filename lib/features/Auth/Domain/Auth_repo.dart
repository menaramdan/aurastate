import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserAndPassword(
    String email,
    String password,
    String username,
  );
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<UserEntity> signwithgoogle();
  Future<UserEntity> signwithFacebook();
}
