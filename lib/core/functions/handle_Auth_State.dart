import 'package:aurastate/core/errors/failure_code.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/widgets/error_dialog.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/ForgetandresetpasswordCubit/forgetandresetpassword_cubit.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/sign_in_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void handleForgotPasswordState(
  ForgetandresetpasswordState state,
  BuildContext context,
) {
  if (state is ForgetandresetpasswordFailure) {
    final failure = state.failure;
    String errorMassage;
    switch (failure.failureCode) {
      case FailureCode.invalidEmail:
        errorMassage = 'Invalid email address';
        break;

      case FailureCode.userNotFound:
        errorMassage = 'User not found';
        break;

      case FailureCode.wrongPassword:
        errorMassage = 'Wrong password';
        break;
      case FailureCode.invalidEmailOrPassword:
        errorMassage = 'Invalid email , try later ';
      default:
        errorMassage = 'An error occurred';
    }
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(massage: errorMassage);
      },
    );
  } else if (state is ForgetandresetpasswordSuccess) {
    context.go(AppRoutes.successScreen);
  }
}

void handleLoginState(SigninCubitState state, BuildContext context) {
  if (state is SigninCubitFailure) {
    final error = state.failure;

    String errorMessage;

    switch (error.failureCode) {
      case FailureCode.network:
        errorMessage = 'Please check your internet connection and try again.';
        break;
      case FailureCode.invalidEmail:
        errorMessage = 'Invalid email address';
        break;

      case FailureCode.userNotFound:
        errorMessage = 'User not found';
        break;

      case FailureCode.wrongPassword:
        errorMessage = 'Wrong password';
        break;
      case FailureCode.invalidEmailOrPassword:
        errorMessage = 'Invalid email or password';
      default:
        errorMessage = 'An error occurred';
    }
    showDialog(
      context: context,
      builder: (context) {
        return ErrorDialog(massage: errorMessage);
      },
    );
  } else if (state is SigninCubitSuccess) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Login successful'),
          actions: [
            TextButton(onPressed: () => context.pop(), child: const Text('OK')),
          ],
        );
      },
    );
  }
}
