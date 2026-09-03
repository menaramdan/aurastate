import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:dart_either/dart_either.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> createUserAndPassword();
  Future<Either<Failure, UserEntity>> loginwithuser();
  Future<UserEntity> signwithgoogle();
  Future<UserEntity> signwithFacebook();
}
