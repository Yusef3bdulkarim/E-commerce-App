import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(
              image: AssetImage(TImages.deliveredEmailIllustration),
              width: THelperFunctions.screenWidth(context) * 0.6,
            ),
            Gap(TSizes.spaceBtwSections),
            Text(
              TTexts.tChangeYourPassTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            Gap(TSizes.spaceBtwItems),
            Text(
              TTexts.tChangeYourPassSubTitle,
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
                    // color: dark ? TColors.borderLight : TColors.borderDark,
                    width: 0.0,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  TTexts.done,
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
              child: TextButton(
                onPressed: () {},
                child: Text(TTexts.resendEmail),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
