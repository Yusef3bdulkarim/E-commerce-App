import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/validators/validation.dart';


class ForgetPassword extends StatefulWidget {

  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
        listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            Navigator.pushNamed(
              context,
              RoutingHelper.resetPasswordScreen,
              arguments: emailController.text,
            );
          } else if (state is ForgetPasswordFailure) {
            TLoaders.errorSnackBar(context: context, title: "There is Error in   ");
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            key: forgetPasswordFormKey,
            child: Column(
              children: [
                Text(
                  TTexts.tForgetPassword,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(TSizes.spaceBtwItems),
                Text(
                  TTexts.tForgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                const Gap(TSizes.spaceBtwSections * 2),

                TextFormField(
                  controller: emailController,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.tEmail,
                    hintText: TTexts.tEmail,
                  ),
                ),
                const Gap(TSizes.spaceBtwSections),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: TColors.buttonPrimary,
                    ),
                    onPressed: () {

                      if (forgetPasswordFormKey.currentState!.validate()) {
                        context.read<ForgetPasswordCubit>().resetPassword(
                          emailController.text.trim(),
                        );
                      }
                    },
                    child: const Text(
                      TTexts.submit,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
