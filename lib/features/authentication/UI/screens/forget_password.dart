import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              TTexts.tForgetPassword,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Gap(TSizes.spaceBtwItems),
            Text(
              TTexts.tForgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            Gap(TSizes.spaceBtwSections * 2),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TTexts.tEmail,
                hintText: TTexts.tEmail,
              ),
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
                    // color: dark ? TColors.borderLight : TColors.borderDark,
                    width: 0.0,
                  ),
                ),
                onPressed: () => Navigator.pushNamed(
                  context,
                  RoutingHelper.resetPasswordScreen,
                ),
                child: Text(
                  TTexts.submit,
                  style: TextStyle(
                    color: TColors.disabledTextDark,
                    fontWeight: FontWeight.bold,
                    fontSize: TSizes.fontSizeMd,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
