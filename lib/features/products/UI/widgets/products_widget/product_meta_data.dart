import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/product_title_text.dart';
import 'package:ecommerceapp/core/widget/texts/text_brand_title_text.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/product_price_text.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radios: TSizes.sm,
              backgroundColor: Colors.yellow.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                horizontal: TSizes.sm,
                vertical: TSizes.xs,
              ),
              child: Text(
                "${products.discount}%",
                style: Theme.of(
                  context,
                ).textTheme.labelLarge!.apply(color: TColors.black),
              ),
            ),
            Gap(TSizes.spaceBtwItems),
            Text(
              "\$ ${products.price}",
              style: Theme.of(context).textTheme.titleSmall!.apply(
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        Gap(TSizes.spaceBtwItems),
        TProductPriceText(
          price:
              "${products.price - ((products.price * products.discount) / 100)}",
          isLarge: true,
        ),
        Gap(TSizes.spaceBtwItems / 1.5),
        TProductTitleText(title: products.title.toString()),
        Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            Gap(TSizes.spaceBtwItems),
            Text('In Stack', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        Gap(TSizes.spaceBtwItems / 1.5),
        Row(
          children: [
            TCircleImage(
              image: TImages.cosmeticsIcon,
              width: 32,
              height: 32,
              overlayColors: dark ? TColors.white : TColors.black,
            ),
            Gap(TSizes.xs),
            TBrandTitleTextWithVertifiedIcon(
              title: products.name.toString(),
              brandTextSize: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
