import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/routes/routing_helper.dart';
import '../../../../../core/utils/popups/loaders.dart';

class SectionIconsSignin extends StatelessWidget {
  const SectionIconsSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginPasswordCubit, LoginPasswordState>(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () =>
                  context.read<LoginPasswordCubit>().loginWithGoogle(),
              icon: Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.tGoogleLogo),
              ),
            ),
          ),
          Gap(TSizes.spaceBtwItems),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100),
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image(
                width: TSizes.iconMd,
                height: TSizes.iconMd,
                image: AssetImage(TImages.tFacebookLogo),
              ),
            ),
          ),
        ],
      ),

      listener: (context, state) {
        Future.delayed(Duration.zero, () {
          if (state is LoginSuccess) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutingHelper.NavigationScreen,
              (route) => false,
            );
          }
        });

        if (state is LoginFailure) {
          TLoaders.errorSnackBar(
            context: context,
            title: "We are processing your information",
            message:
                "We are processing your informationWe are processing your information",
          );
        }
      },
    );
  }
}
