import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BtnSignin extends StatelessWidget {
  const BtnSignin({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
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
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutingHelper.homeScreen,
              (route) => false,
            ),
            child: Text(
              TTexts.tSignIn,
              style: TextStyle(
                color: TColors.disabledTextDark,
                fontWeight: FontWeight.bold,
                fontSize: TSizes.fontSizeMd,
              ),
            ),
          ),
        ),
        Gap(TSizes.spaceBtwItems),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shadowColor: Colors.transparent,
              backgroundColor: dark ? Colors.black : Colors.white,
              side: BorderSide(
                color: dark ? TColors.borderLight : TColors.borderDark,
                width: 1.0,
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(context, RoutingHelper.signUpScreen);
            },
            child: Text(
              TTexts.tCreateAccount,
              style: TextStyle(
                color: dark
                    ? TColors.disabledTextLight
                    : TColors.disabledTextDark,
                fontWeight: FontWeight.bold,
                fontSize: TSizes.fontSizeMd,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
