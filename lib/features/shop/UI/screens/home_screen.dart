import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/search_container.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/home_appbar.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/home_category.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  THomeAppBar(),
                  Gap(TSizes.spaceBtwItems),
                  TSearchContainer(text: 'Search in Store'),
                  Gap(TSizes.spaceBtwItems),
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        Gap(TSizes.spaceBtwItems),
                        THomeCategory(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner2,
                      TImages.promoBanner1,
                      TImages.promoBanner3,
                    ],
                  ),

                  Gap(TSizes.spaceBtwItems),
                  TSectionHeading(title: "Popular Products", onPressed: () {}),
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) =>
                        TProductCardVertical(),
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
