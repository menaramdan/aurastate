import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/errors/failure_code.dart';
import 'package:aurastate/core/functions/error_handle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthServices {
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
        throw handleError(e);
      }
    } catch (e) {
      throw handleError(e);
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
          failureCode: FailureCode.userNotFound,
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password') {
        throw AppFailure(
          failureCode: FailureCode.wrongPassword,
          message: 'Wrong password provided for that user.',
        );
      } else {
        throw AppFailure(
          failureCode: FailureCode.invalidEmailOrPassword,
          message: e.message,
        );
      }
    } catch (e) {
      throw handleError(e);
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      await GoogleSignIn.instance.initialize(
        serverClientId:
            '75660776334-oeblt0fmbqevudvbkjp8qciludbige4l.apps.googleusercontent.com',
      );
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      throw handleError(e);
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login(
        permissions: ['public_profile'],
      );
      if (loginResult.status != LoginStatus.success) {
        throw AppFailure(
          failureCode: FailureCode.unknown,
          message: 'Facebook login failed: ${loginResult.status}',
        );
      }

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      return await FirebaseAuth.instance.signInWithCredential(
        facebookAuthCredential,
      );
    } on Exception catch (e) {
      throw handleError(e);
    }
  }

  Future<void> forgotPassword(String email) async {
    try {
      // ignore: unused_local_variable
      var result = await FirebaseAuth.instance.sendPasswordResetEmail(
        email: email,
      );
    } on FirebaseAuthException catch (e) {
      throw AppFailure(
        failureCode: FailureCode.invalidEmailOrPassword,
        message: e.message,
      );
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw AppFailure(
          failureCode: FailureCode.userNotFound,
          message: 'No user found for that email.',
        );
      }
      await user.reload();
      if (user.emailVerified == false) {
        await user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppFailure(
          failureCode: FailureCode.userNotFound,
          message: 'No user found for that email.',
        );
      } else {
        throw AppFailure(
          failureCode: FailureCode.invalidEmailOrPassword,
          message: e.message,
        );
      }
    }
  }

  Future<void> updatePassword(String password) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        throw AppFailure(
          failureCode: FailureCode.userNotFound,
          message: 'No user found for that email.',
        );
      }
      await user.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw AppFailure(
          failureCode: FailureCode.userNotFound,
          message: 'No user found for that email.',
        );
      } else {
        throw AppFailure(
          failureCode: FailureCode.invalidEmailOrPassword,
          message: e.message,
        );
      }
    }
  }
}
