import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/device/device_utility.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Positioned(
          right: TSizes.defaultSpace,
          bottom: TDeviceUtils.getBottomNavigationBarHeight(),
          child: ElevatedButton(
            onPressed: () {
              if (!state.isLastPage) {
                context.read<AuthCubit>().nextPage();
              } else {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutingHelper.signInScreen,
                  (route) => false,
                );
              }
            },
            child: const Icon(Iconsax.arrow_right, color: TColors.white),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              backgroundColor: dark ? TColors.primary : TColors.black,
            ),
          ),
        );
      },
    );
  }
}
