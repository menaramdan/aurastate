import 'package:aurastate/core/errors/failure_code.dart';
import 'package:aurastate/core/widgets/error_dialog.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/sign_in_cubit/signin_cubit.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      body: BlocConsumer<SigninCubitCubit, SigninCubitState>(
        listener: (context, state) {
          if (state is SigninCubitFailure) {
            final error = state.failure;

            String errorMessage;
            print('🔥 Failure Code: ${error.failureCode}');

            switch (error.failureCode) {
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
                    TextButton(
                      onPressed: () => context.pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },

        builder: (context, state) {
          return LoginBody();
        },
      ),
    );
  }
}
