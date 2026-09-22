import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Usermodel extends UserEntity {
  Usermodel({
    required super.username,
    required super.email,
    required super.uid,
  });
  factory Usermodel.fromEntity(UserEntity user) {
    return Usermodel(email: user.email, username: user.username, uid: user.uid);
  }

  factory Usermodel.Firebaseuser(User user) {
    return Usermodel(
      username: user.displayName ?? '',
      email: user.email ?? '',
      uid: user.uid,
    );
  }
}
