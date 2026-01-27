import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/device/device_utility.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Positioned(
          bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
          left: TSizes.defaultSpace,
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: ExpandingDotsEffect(
              activeDotColor: dark ? TColors.lightGrey : TColors.dark,
              dotHeight: 6,
            ),
          ),
        );
      },
    );
  }
}
