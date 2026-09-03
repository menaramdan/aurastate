import 'package:aurastate/features/Auth/Domain/Entities/user_entity.dart';

class Usermodel extends UserEntity {
  Usermodel({
    required super.username,
    required super.email,
    required super.uid,
  });
}
