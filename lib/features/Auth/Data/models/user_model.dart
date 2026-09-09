import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';

class Usermodel extends UserEntity {
  Usermodel({
    required super.username,
    required super.email,
    required super.uid,
  });
  factory Usermodel.fromEntity(UserEntity user) {
    return Usermodel(email: user.email, username: user.username, uid: user.uid);
  }
}
