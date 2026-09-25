import 'package:aurastate/core/constants/text.dart';
import 'package:aurastate/core/responsive/responsive_extensions.dart';
import 'package:aurastate/core/styles/app_colors.dart';
import 'package:aurastate/core/styles/app_text_style.dart';
import 'package:aurastate/core/widgets/custom_button.dart';
import 'package:aurastate/features/Auth/presentation/manager/cubit/signup_cubit_cubit.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/Already%20_have%20_an_account.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/TermsAndPrivacyCheckbox.dart';
import 'package:aurastate/features/Auth/presentation/widgets/sign_up_screen_widgets/custom_signup_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isPasswordVisible = false;
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    namecontroller.dispose();
    emailcontroller.dispose();
    phonecontroller.dispose();
    passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 24.p),
        physics: ClampingScrollPhysics(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.p),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                73.verticalSpace,
                Text(
                  AppText.joinAuraEstate,
                  style: AppTextStyle.playerDisplaybold32.copyWith(
                    color: AppColors.primarycolor1,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Elevate your lifestyle with exclusive\nproperties.',
                  style: AppTextStyle.interRegular16.copyWith(
                    color: AppColors.primarycolor2,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    AppText.fULLNAME,
                    style: AppTextStyle.intersemibold122.copyWith(
                      color: AppColors.primarycolor1,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                SignupFields(
                  namecontroller: namecontroller,
                  emailcontroller: emailcontroller,
                  phonecontroller: phonecontroller,
                  passwordcontroller: passwordcontroller,
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 24.p),
                  child: TermsAndPrivacyCheckbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? true;
                      });
                    },
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.p),
                  child: BlocBuilder<SignupCubitCubit, SignupCubitState>(
                    builder: (context, state) {
                      return CustomButtonApp(
                        text: state is SignupCubitLoading
                            ? ''
                            : AppText.register,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            context.read<SignupCubitCubit>().signup(
                              emailcontroller.text,
                              passwordcontroller.text,
                              namecontroller.text,
                            );
                          }
                        },
                        borderRadius: BorderRadiusGeometry.circular(60),
                        child: state is SignupCubitLoading
                            ? const SizedBox(
                                width: 18,
                                height: 18,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : null,
                      );
                    },
                  ),
                ),
                SizedBox(height: 24),
                AlreadyHaveAnAccount(),
                30.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
