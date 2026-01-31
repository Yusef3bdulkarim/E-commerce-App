import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/btn_signIn.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/divider_auth.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/form_signIn.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/auth-Widget/section_icons_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: TSizes.appBarHeight,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace,
            bottom: TSizes.defaultSpace,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                      dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                    ),
                  ),

                  Text(
                    TTexts.tLoginTitle,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Gap(TSizes.sm),
                  Text(
                    TTexts.tLoginSubTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              LoginFormWidget(),
              BtnSignin(),
              Gap(TSizes.defaultSpace),
              DividerSignin(textDiivder: " ${TTexts.tOrSignIn} "),
              Gap(TSizes.spaceBtwSections),
              SectionIconsSignin(),
            ],
          ),
        ),
      ),
    );
  }
}
