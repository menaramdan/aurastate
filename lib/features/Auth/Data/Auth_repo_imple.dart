import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/services/firebase_auth_services.dart';
import 'package:aurastate/features/Auth/Data/models/user_model.dart';
import 'package:aurastate/features/Auth/Domain/Auth_repo.dart';
import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:dart_either/src/dart_either.dart';

class AuthRepoImple extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  AuthRepoImple(this.firebaseAuthServices);
  @override
  Future<Either<Failure, UserEntity>> createUserAndPassword() async {}

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
