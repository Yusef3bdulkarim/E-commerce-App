import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/success_screen/success_screen.dart';
import 'package:ecommerceapp/features/authentication/data/repo/auth_repo.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:ecommerceapp/features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key, this.email});

  final String? email;

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  @override
  void initState() {
    super.initState();
    context.read<RegisterCubit>().setTimerForAutoRedirect();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocListener<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is VerifyEmailSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SuccessScreen(
                imageName: TImages.tWelcomeScreenImage,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () { Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutingHelper.NavigationScreen,
                  (route) => false,

                );
                  context.read<ProfileCubit>().getUserDetails();
                }
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RoutingHelper.signInScreen);

              },
              icon: Icon(CupertinoIcons.clear),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Image(
                  image: AssetImage(TImages.deliveredEmailIllustration),
                  width: THelperFunctions.screenWidth(context) * 0.6,
                ),
                Gap(TSizes.spaceBtwSections),
                Text(
                  TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                Gap(TSizes.spaceBtwItems),

                Text(
                  widget.email ?? "your-email@example.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),

                Gap(TSizes.spaceBtwItems),
                Text(
                  TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
                Gap(TSizes.spaceBtwSections),

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
                      context
                          .read<RegisterCubit>()
                          .checkEmailVerificationStatus();
                    },
                    child: Text(
                      TTexts.tContinue,
                      style: TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: TSizes.fontSizeMd,
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () =>
                        context.read<RegisterCubit>().sendEmailVerification(),
                    child: Text(TTexts.resendEmail),
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
