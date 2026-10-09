import 'package:aurastate/core/functions/handle_Auth_State.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/sign_in_cubit/signin_cubit.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/login_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(context),
      body: BlocConsumer<SigninCubitCubit, SigninCubitState>(
        listener: (context, state) {
          handleLoginState(state, context);
        },

        builder: (context, state) {
          return LoginBody();
        },
      ),
    );
  }
}
