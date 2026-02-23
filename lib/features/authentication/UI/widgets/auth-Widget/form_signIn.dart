import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/helpers/shared_prefrence.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../../personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import '../../../logic/cubit/auth_cubit.dart';

class LoginFormWidget extends StatefulWidget {
  LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginPasswordCubit>();

    return BlocBuilder<LoginPasswordCubit, LoginPasswordState>(
      builder: (context, state) {
        final dark = THelperFunctions.isDarkMode(context);
        return Form(
          key: _loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Email Field
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: _emailController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  labelText: TTexts.tEmail,
                  hintText: TTexts.tEmail,
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// -- Password Field
              TextFormField(
                obscureText: !state.isShowPassword,
                controller: _passwordController,
                validator: (value) =>
                    TValidator.validateEmptyText("Password", value),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: TTexts.tPassword,
                  hintText: TTexts.tPassword,
                  suffixIcon: IconButton(
                    onPressed: () => cubit.togglePassword(),
                    icon: Icon(
                      state.isShowPassword ? Iconsax.eye : Iconsax.eye_slash,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: state.isRememberMeChecked,
                        onChanged: (value) => cubit.toggleRememberMe(value),
                      ),
                      const Text(TTexts.tRememberMe),
                    ],
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RoutingHelper.forgetPasswordScreen,
                    ),
                    child: const Text(TTexts.tForgetPassword),
                  ),
                ],
              ),
              Gap(TSizes.spaceBtwItems),
              TBtnApp(
                isChild: false,
                child: state is LoginLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        TTexts.tSignIn,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                onPressed: state is LoginLoading
                    ? null
                    : () {
                        if (_loginFormKey.currentState!.validate()) {
                          context.read<LoginPasswordCubit>().login(
                            email: _emailController.text.trim(),
                            pass: _passwordController.text.trim(),
                          );
                          context.read<ProfileCubit>().getUserDetails();
                        }
                      },
              ),

              Gap(TSizes.spaceBtwItems),
              TBtnApp(
                color: dark ? Colors.black : Colors.white,
                text: TTexts.tCreateAccount,
                textColor: dark ? TColors.disabledTextLight : TColors.black,
                textSize: TSizes.fontSizeMd,
                fontWeight: FontWeight.w500,
                onPressed: () {
                  Navigator.pushNamed(context, RoutingHelper.signUpScreen);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
