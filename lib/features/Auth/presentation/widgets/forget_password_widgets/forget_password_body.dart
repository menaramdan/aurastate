import 'package:aurastate/core/app_assets/app_icons.dart';
import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/errors/failure_code.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/routes/app_routes.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/utils/app_validators.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/core/widgets/error_dialog.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/ForgetandresetpasswordCubit/forgetandresetpassword_cubit.dart';
import 'package:aurastate/features/Auth/presentation/widgets/forget_password_widgets/remember_your_password.dart';
import 'package:aurastate/features/Auth/presentation/widgets/log_in_screen_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ForgetPasswordBody extends StatefulWidget {
  const ForgetPasswordBody({super.key});

  @override
  State<ForgetPasswordBody> createState() => _ForgetPasswordBodyState();
}

class _ForgetPasswordBodyState extends State<ForgetPasswordBody> {
  final TextEditingController emailcontroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 500.w),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.p, vertical: 32.p),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    AppText.forgotPassword,
                    style: AppTextStyle.playerDisplaysemibold24.copyWith(
                      color: AppColors.primarycolor1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Enter your email address and we\'ll send you a link to reset your password and regain access to your account.',
                    style: AppTextStyle.interRegular16.copyWith(
                      color: AppColors.primarycolor4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24),
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      AppText.email,
                      style: AppTextStyle.intersemibold122.copyWith(
                        color: AppColors.primarycolor1,
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
                  CustomTextField(
                    validator: AppValidators.email,
                    controller: emailcontroller,
                    keyboardkey: TextInputType.emailAddress,
                    text: 'john@example.com',
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(AppIcons.emailicon),
                    ),
                  ),
                  SizedBox(height: 24),
                  BlocConsumer<
                    ForgetandresetpasswordCubit,
                    ForgetandresetpasswordState
                  >(
                    listener: (context, state) {
                      if (state is ForgetandresetpasswordFailure) {
                        final failure = state.failure;
                        String errormassage;
                        switch (failure.failureCode) {
                          case FailureCode.network:
                            errormassage =
                                'Network error. Please check your connection.';
                            break;
                          case FailureCode.userNotFound:
                            errormassage =
                                'User not found. Please check your email.';
                            break;
                          case FailureCode.emailNotRegistered:
                            errormassage =
                                'Email not registered. Please sign up.';
                            break;
                          case FailureCode.notFound:
                            errormassage =
                                'user not found. Please try again later.';
                            break;
                          case FailureCode.invalidEmailOrPassword:
                            errormassage =
                                'Invalid email or password. Please try again.';
                            break;
                          default:
                            errormassage =
                                'Something went wrong. Please try again.';
                        }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ErrorDialog(massage: errormassage);
                          },
                        );
                      } else if (state is ForgetandresetpasswordSuccess) {
                        context.push(
                          AppRoutes.oTPVerificationScreen,
                          extra: emailcontroller.text,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButtonApp(
                        text: state is ForgetandresetpasswordLoading
                            ? ''
                            : AppText.send,
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            context
                                .read<ForgetandresetpasswordCubit>()
                                .forgetPassword(emailcontroller.text);
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        height: 56.h,
                        svgPicture: SvgPicture.asset(AppIcons.icon),
                        child: state is ForgetandresetpasswordLoading
                            ? SizedBox(
                                width: 18.w,
                                height: 18.h,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : null,
                      );
                    },
                  ),
                  SizedBox(height: 24),
                  RememberYourPassword(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
