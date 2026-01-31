import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart'
    show TTexts;
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class FormSignUp extends StatelessWidget {
  const FormSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
      // key: controller.loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Email Field
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.user),
                    labelText: TTexts.tFirstName,
                    hintText: TTexts.tFirstName,
                  ),
                ),
              ),
              Gap(TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(LineAwesomeIcons.user),
                    labelText: TTexts.tFirstName,
                    hintText: TTexts.tFirstName,
                  ),
                ),
              ),
            ],
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: TTexts.tuserName,
              hintText: TTexts.tuserName,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: TTexts.tEmail,
              hintText: TTexts.tEmail,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.tPhoneNo,
              hintText: TTexts.tPhoneNo,
            ),
          ),
          Gap(TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.fingerprint),
              labelText: TTexts.tPassword,
              hintText: TTexts.tPassword,
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Iconsax.eye_slash),
              ),
            ),
          ),
          Gap(TSizes.spaceBtwItems),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(value: true, onChanged: (value) {}),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "${TTexts.tIAgreeTo}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " ${TTexts.tPrivacyPolicy} ",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                            decoration: TextDecoration.underline,
                            decorationColor: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                          ),
                        ),
                        TextSpan(
                          text: "${TTexts.tAnd}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        TextSpan(
                          text: " ${TTexts.tTermOfUse} ",
                          style: Theme.of(context).textTheme.bodyMedium!.apply(
                            color: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                            decoration: TextDecoration.underline,
                            decorationColor: dark
                                ? TColors.white
                                : TColors.facebookBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
