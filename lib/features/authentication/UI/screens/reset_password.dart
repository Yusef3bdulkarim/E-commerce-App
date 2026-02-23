import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart'; // تأكد من المسار
import 'package:ecommerceapp/features/authentication/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth(context) * 0.6,
            ),
            const Gap(TSizes.spaceBtwSections),


            Text(
              email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(TSizes.spaceBtwItems),

            Text(
              TTexts.tChangeYourPassTitle, // تأكد من اسم الثابت عندك
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(TSizes.spaceBtwItems),
            Text(
              TTexts.tChangeYourPassSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const Gap(TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TColors.buttonPrimary,
                ),
                onPressed: () => Navigator.pushReplacementNamed(context, RoutingHelper.signInScreen),
                child: const Text(
                  TTexts.done,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Gap(TSizes.spaceBtwItems),

            SizedBox(
              width: double.infinity,
              child: TextButton(
                // 4. برمجة زرار الـ Resend
                onPressed: () {
                  context.read<ForgetPasswordCubit>().resetPassword(email);
                  // تنبيه بسيط لليوزر
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Success: Email link resent!")),
                  );
                },
                child: const Text(TTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}