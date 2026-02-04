import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/personalization/UI/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Profile'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircleImage(image: TImages.user, width: 80, height: 80),
                    TextButton(
                      onPressed: () {},
                      child: Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              Gap(TSizes.spaceBtwItems / 2),
              Divider(),
              Gap(TSizes.spaceBtwItems),
              TSectionHeading(
                title: "Profile information",
                showActionButton: false,
              ),
              Gap(TSizes.spaceBtwItems),
              TProfileMenu(onTap: () {}, title: "Name", value: 'Coding With T'),
              TProfileMenu(
                onTap: () {},
                title: "UserName",
                value: 'Coding With_t',
              ),
              Gap(TSizes.spaceBtwItems),
              Divider(),
              Gap(TSizes.spaceBtwItems),
              TSectionHeading(
                title: "Personal information",
                showActionButton: false,
              ),
              Gap(TSizes.spaceBtwItems),
              TProfileMenu(
                onTap: () {},
                title: "User ID",
                value: '45218',
                icons: Iconsax.copy,
              ),
              TProfileMenu(
                onTap: () {},
                title: "E-Mail",
                value: 'Coding With.com',
              ),
              TProfileMenu(
                onTap: () {},
                title: "Phone Numbers",
                value: '+02156358',
              ),
              TProfileMenu(onTap: () {}, title: "Gender", value: 'Male'),
              TProfileMenu(
                onTap: () {},
                title: "Date of Birth",
                value: '10 Oct,1994',
              ),
              Divider(),
              Gap(TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
