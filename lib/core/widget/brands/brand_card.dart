import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/text_brand_title_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key, this.showBorder = true, this.onTap});
  final bool showBorder;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        padding: EdgeInsets.all(TSizes.md),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            Flexible(
              child: TCircleImage(
                image: TImages.clothIcon,
                isNetworkImage: false,
                backgroundColors: Colors.transparent,
                overlayColors: dark ? TColors.white : TColors.black,
              ),
            ),
            Gap(TSizes.spaceBtwItems / 2),

            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TBrandTitleTextWithVertifiedIcon(
                    title: "Nike",
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    '256 Products fffffffffffffffff',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
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
