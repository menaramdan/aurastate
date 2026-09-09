import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/errors/failure_code.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthServices {
  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AppFailure(
          failureCode: FailureCode.validation,
          message: 'The password is too weak.',
        );
      } else if (e.code == 'email-already-in-use') {
        throw AppFailure(
          failureCode: FailureCode.validation,
          message: 'The email is already in use.',
        );
      } else {
        throw AppFailure(failureCode: FailureCode.unknown, message: e.message);
      }
    } catch (e) {
      throw AppFailure(failureCode: FailureCode.unknown, message: e.toString());
    }
  }
}
