import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/utils/theme/widget_themes/shadow_style.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/core/widget/texts/brand_titile_text.dart';
import 'package:ecommerceapp/core/widget/texts/product_title_text.dart';
import 'package:ecommerceapp/core/widget/texts/text_brand_title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.horizontalProductShadow],
          color: dark ? TColors.darkerGrey : TColors.white,
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        ),
        child: Column(
          children: [
            // Image(image: AssetImage(TImages.productImage1)),
            TRoundedContainer(
              height: 140,
              width: 165,
              padding: EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.lightBackground,
              child: Stack(
                children: [
                  TRoundedImage(
                    padding: EdgeInsets.all(10),
                    imageUrl: TImages.productImage21,
                    applyImageRadius: false,
                    fit: BoxFit.cover,
                  ),

                  Positioned(
                    top: 8,
                    child: TRoundedContainer(
                      radios: TSizes.sm,
                      backgroundColor: Colors.yellow.withOpacity(0.8),
                      padding: EdgeInsets.symmetric(
                        horizontal: TSizes.sm,
                        vertical: TSizes.xs,
                      ),
                      child: Text(
                        '25%',
                        style: Theme.of(
                          context,
                        ).textTheme.labelLarge!.apply(color: TColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: TCircleIcons(
                      nameIcons: Iconsax.heart5,
                      color: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: 'Green Nike Air Shoes'),
                  Gap(TSizes.spaceBtwItems / 2),
                  TBrandTitleTextWithVertifiedIcon(title: "Nike"),

                  Row(
                    children: [
                      Text(
                        '\$35.5',
                        style: Theme.of(context).textTheme.headlineMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: SizedBox(
                          width: TSizes.iconLg * 1.2,
                          height: TSizes.iconLg * 1.2,
                          child: Icon(Iconsax.add, color: TColors.white),
                        ),
                      ),
                    ],
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
