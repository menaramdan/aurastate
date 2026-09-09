import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/errors/failure_code.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
    String email,
    String password,
    String username,
  ) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await credential.user!.updateDisplayName(username);
      return credential.user!;
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

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppFailure(
          failureCode: FailureCode.validation,
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        throw AppFailure(
          failureCode: FailureCode.validation,
          message: 'Wrong password provided for that user.',
        );
      } else {
        throw AppFailure(failureCode: FailureCode.unknown, message: e.message);
      }
    } catch (e) {
      throw AppFailure(failureCode: FailureCode.unknown, message: e.toString());
    }
  }
}
