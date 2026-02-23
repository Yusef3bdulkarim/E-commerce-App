import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart'
    show TTexts;
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../core/utils/constants/image_strings.dart';
import '../../../../../core/utils/popups/full_screen_loader.dart';
import '../../../../../core/utils/popups/loaders.dart';
import '../../../../../core/utils/validators/validation.dart';
import '../../../logic/cubit/auth_cubit.dart';
import '../../screens/verify_email.dart';

class FormSignUp extends StatefulWidget {
  const FormSignUp({super.key});

  @override
  State<FormSignUp> createState() => _FormSignUpState();
}

class _FormSignUpState extends State<FormSignUp> {
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final signupFormKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstName.dispose();
    lastName.dispose();
    userName.dispose();
    email.dispose();
    phoneNumber.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cubit = context.read<RegisterCubit>();
    return Form(
      key: signupFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Email Field
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  validator: (value) =>
                      TValidator.validateEmptyText('FirstName', value),

                  controller: firstName,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.user),
                    labelText: TTexts.tFirstName,
                    hintText: TTexts.tFirstName,
                  ),
                ),
              ),
              Gap(TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('LastName', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.user),
                    labelText: TTexts.tLastName,
                    hintText: TTexts.tLastName,
                  ),
                ),
              ),
            ],
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: userName,
            validator: (value) => TValidator.validateUsername(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.tuserName,
              hintText: TTexts.tuserName,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TTexts.tEmail,
              hintText: TTexts.tEmail,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            controller: phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.tPhoneNo,
              hintText: TTexts.tPhoneNo,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          BlocBuilder<LoginPasswordCubit, LoginPasswordState>(
            builder: (context, state) {
              return TextFormField(
                obscureText: state.isShowPassword,
                controller: password,
                validator: (value) => TValidator.validatePassword(value),
                decoration: InputDecoration(
                  prefixIcon: state.isShowPassword
                      ? const Icon(Icons.fingerprint)
                      : const Icon(Icons.fingerprint_rounded),
                  labelText: TTexts.tPassword,
                  hintText: TTexts.tPassword,

                  suffixIcon: IconButton(
                    onPressed: () =>
                        context.read<LoginPasswordCubit>().togglePassword(),
                    icon: Icon(
                      state.isShowPassword ? Iconsax.eye_slash : Iconsax.eye,
                    ),
                  ),
                ),
              );
            },
          ),
          Gap(TSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlocBuilder<RegisterCubit, RegisterState>(
                    builder: (context, state) {
                      return Checkbox(
                        value: context
                            .read<RegisterCubit>()
                            .isPrivacyPolicyAccepted,
                        onChanged: (value) =>
                            context.read<RegisterCubit>().toggleCheckBox(),
                      );
                    },
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${TTexts.tIAgreeTo}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " ${TTexts.tPrivacyPolicy} ",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                            decoration: TextDecoration.underline,
                            decorationColor: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                          ),
                        ),
                        TextSpan(
                          text: "${TTexts.tAnd}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " ${TTexts.tTermOfUse} ",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                            decoration: TextDecoration.underline,
                            decorationColor: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gap(TSizes.spaceBtwItems),
          BlocConsumer<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return TBtnApp(
                onPressed: () {
                  if (signupFormKey.currentState!.validate()) {
                    if (context.read<RegisterCubit>().isPrivacyPolicyAccepted) {
                      context.read<RegisterCubit>().registerUser(
                        email: email.text.trim(),
                        password: password.text.trim(),
                        firstName: firstName.text.trim(),
                        lastName: lastName.text.trim(),
                        userName: userName.text.trim(),
                        phoneNumber: phoneNumber.text.trim(),
                      );
                    } else {
                      TLoaders.warningSnackBar(
                        context: context,
                        title: 'Accept Privacy Policy',
                        message:
                            'Please accept the Privacy Policy to continue.',
                      );
                    }
                  }
                },
                text: TTexts.tSignup,
              );
            },

            listener: (context, state) {
              if (state is RegisterLoading) {
                TFullScreenLoader.openLoadingDialog(
                  context,
                  "We are processing your information",
                  TImages.docerAnimation,
                );
              }
              if (state is RegisterSuccess || state is RegisterFailure) {
                TFullScreenLoader.stopLoading(context);
                if (state is RegisterFailure) {
                  TLoaders.errorSnackBar(
                    context: context,
                    title: 'Oh Snap',
                    message: "Please Check your inbox and verify your email",
                  );
                }
                if (state is RegisterSuccess) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          VerifyEmail(email: email.text.trim()),
                    ),
                    (route) => false,
                  );
                }
              }
            },
          ),
        ],
      ),
    );
  }
}
