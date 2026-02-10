import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/core/widget/tile%20profile/user_profile_tile.dart';
import 'package:ecommerceapp/features/personalization/UI/widgets/setting_menu_items.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    showBackArrow: false,
                    title: Text(
                      "Account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineSmall!.apply(color: TColors.white),
                    ),
                  ),

                  TUserProfileTile(
                    onpressed: () => Navigator.pushNamed(
                      (context),
                      RoutingHelper.profileScreen,
                    ),
                  ),
                  Gap(TSizes.spaceBtwSections),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  TSettingMenuItems(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RoutingHelper.userAddressScreen,
                    ),
                    icon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subTitle: 'Set shopping delivery addrees',
                  ),
                  TSettingMenuItems(
                    onTap: () => Navigator.pushNamed(
                      context,
                      RoutingHelper.cartScreen,
                    ),
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subTitle: 'Add , remove products and move to checkout ',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.bag_tick,
                    title: 'My Order',
                    subTitle:
                        'products and move  set Shopping delivery address',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subTitle: 'set Bank AcconutShopping delivery address',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.discount_shape,
                    title: 'My Coupons',
                    subTitle:
                        'List of all the dicsoint set Shopping delivery address',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.notification,
                    title: 'Notification',
                    subTitle:
                        'Notification Message set Shopping delivery address',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.security_card,
                    title: 'Account privacy',
                    subTitle:
                        'Mange data usage and connected Accont delivery address',
                  ),
                  Gap(TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: "App Settings",
                    showActionButton: false,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  TSettingMenuItems(
                    icon: Iconsax.document_upload,
                    title: 'Load Data',
                    subTitle:
                        'Upload data to your cloud firebase Shopping delivery address',
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.location,
                    title: 'Geolocations',
                    subTitle: 'set recommendation based on location ',
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.security_user,
                    title: 'Save Mode',
                    subTitle:
                        'Upload data to your cloud firebase Shopping delivery address',
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),

                  TSettingMenuItems(
                    icon: Iconsax.image,
                    title: 'HD Image Quality',
                    subTitle:
                        'Upload data to your cloud firebase Shopping delivery address',
                    trailing: Switch(value: true, onChanged: (val) {}),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
