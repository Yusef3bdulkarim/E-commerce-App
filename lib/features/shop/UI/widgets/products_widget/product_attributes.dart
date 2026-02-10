import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/chip/choice_chip.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/texts/product_title_text.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/product_price_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          padding: EdgeInsets.all(TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 75,
                    child: TSectionHeading(
                      title: "Vaiation",
                      showActionButton: false,
                    ),
                  ),
                  Gap(TSizes.spaceBtwItems),

                  Column(
                    children: [
                      Row(
                        children: [
                          TProductTitleText(title: "Price : ", smallSize: true),

                          Text(
                            '\$25',
                            style: Theme.of(context).textTheme.titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          Gap(TSizes.spaceBtwItems),
                          TProductPriceText(price: "20"),
                        ],
                      ),
                      Row(
                        children: [
                          TProductTitleText(title: "Stack : ", smallSize: true),
                          Text(
                            "In stack",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              TProductTitleText(
                title:
                    "This is the description of the product and it can go upt max 4 lines",
                smallSize: true,
                maxlines: 4,
              ),
            ],
          ),
        ),

        Gap(TSizes.spaceBtwItems),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: "Colors"),
            Gap(TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green', selected: true,onselected: (val){},),
                TChoiceChip(text: 'Blue', selected: false,onselected: (val){},),
                TChoiceChip(text: 'Yellow', selected: false,onselected: (val){},),

              ],
            )

          ],
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionHeading(title: "Size"),
            Gap(TSizes.spaceBtwItems / 2),
           Wrap(
             spacing: 8,
             children: [
               TChoiceChip(text: 'EU 34', selected: true,onselected: (val){},),
               TChoiceChip(text: 'EU 36', selected: false,onselected: (val){},),
               TChoiceChip(text: 'EU 38', selected: false,onselected: (val){},),
             ],
           )

          ],
        ),
      ],
    );
  }
}
