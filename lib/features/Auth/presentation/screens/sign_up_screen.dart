import 'package:aurastate/core/functions/build_App_Bar.dart';
import 'package:aurastate/core/widgets/error_dialog.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/signup_cubit_cubit.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: BlocConsumer<SignupCubitCubit, SignupCubitState>(
        listener: (context, state) {
          if (state is SignupCubitFailure) {
            ErrorDialog(massage: state.failure.message ?? 'try later please');
          } else if (state is SignupCubitSuccess) {
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
          return SignUpBody();
        },
      ),
    );
  }
}
