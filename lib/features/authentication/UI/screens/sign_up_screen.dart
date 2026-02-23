import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/verify_email.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/divider_auth.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/form_sign_up.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/section_icons_auth.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../logic/cubit/auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                TTexts.tSignUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Gap(TSizes.spaceBtwSections),

              FormSignUp(),
              Gap(TSizes.defaultSpace),
              DividerSignin(textDiivder: " ${TTexts.tOrSignUp} "),
              Gap(TSizes.spaceBtwSections),
              SectionIconsSignin(),
            ],
          ),
        ),
      ),
    );
  }
}
