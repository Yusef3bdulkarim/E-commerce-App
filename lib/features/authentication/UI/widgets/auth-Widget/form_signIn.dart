import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: TSizes.xl),
      child: Form(
        // key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Email Field
            TextFormField(
              // validator: (value) => TValidator.validateEmail(value),
              // controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(LineAwesomeIcons.user),
                labelText: TTexts.tEmail,
                hintText: TTexts.tEmail,
              ),
            ),
            const SizedBox(height: TSizes.xl - 20),

            /// -- Password Field
            ///
            ///
            TextFormField(
              // obscureText: controller.hidePassword.value,
              // controller: controller.password,
              // validator: (value) => TValidator.validateEmptyText('Password', value),
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

            const SizedBox(height: TSizes.xl - 20),

            /// -- FORGET PASSWORD BTN
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(TTexts.tRememberMe),
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(TTexts.tForgetPassword),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
