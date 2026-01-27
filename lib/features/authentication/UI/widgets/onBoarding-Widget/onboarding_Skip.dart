import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/device/device_utility.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,

      child: TextButton(
        onPressed: () {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RoutingHelper.signInScreen,
            (route) => false,
          );
        },
        child: Text(
          "Skip",
          style: TextStyle(color: dark ? TColors.lightGrey : TColors.dark),
        ),
      ),
    );
  }
}
