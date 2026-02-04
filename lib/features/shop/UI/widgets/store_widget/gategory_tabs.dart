import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/brands/brand_showcase.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandShowCase(
                image: [
                  TImages.productImage1,
                  TImages.productImage21,
                  TImages.productImage22,
                ],
              ),

              Gap(TSizes.spaceBtwItems),
              TSectionHeading(title: 'You might like', onPressed: () {}),
              Gap(TSizes.spaceBtwItems),
              TGridLayout(
                itemCount: 4,
                itemBuilder: (context, index) => TProductCardVertical(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
