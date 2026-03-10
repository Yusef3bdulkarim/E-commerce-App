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
  const TBrandCard({
    super.key,
    this.showBorder = true,
    this.onTap,
    this.imageIcons,
    this.nameBrand,
    this.numberProduct,
  });

  final bool showBorder;
  final VoidCallback? onTap;
  final String? imageIcons;
  final String? nameBrand;
  final String? numberProduct;

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
                image: imageIcons ?? TImages.clothIcon,
                isNetworkImage: false,
                fit: BoxFit.contain,
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
                    title: nameBrand ?? "Nike",
                    brandTextSize: TextSizes.large,
                    maxLines: 1,

                  ),
                  Text(
                    numberProduct ?? '256 Products fffffffffffffffff',
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
