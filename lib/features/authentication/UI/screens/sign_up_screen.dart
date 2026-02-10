import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/divider_auth.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/form_sign_up.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/section_icons_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
              Gap(TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    backgroundColor: TColors.buttonPrimary,
                    side: BorderSide(
                      color: dark ? TColors.borderLight : TColors.borderDark,
                      width: 1.0,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      RoutingHelper.verifyEmailScreen,
                    );
                  },
                  child: Text(
                    TTexts.tSignup,
                    style: TextStyle(
                      color: TColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: TSizes.fontSizeMd,
                    ),
                  ),
                ),
              ),

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
