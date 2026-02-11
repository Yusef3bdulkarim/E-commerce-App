import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/bottom_add_to_cart.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/product_meta_data.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/rating_and_iconShare.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/features/personalization/UI/widgets/setting_menu_items.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../widgets/products_widget/product_attributes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(),
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  TRatingAndShare(),

                  TProductMetaData(),

                  TProductAttributes(),
                  Gap(TSizes.spaceBtwItems),
                  TBtnApp(
                    text: "Checkout",
                    onPressed: () => Navigator.pushNamed(
                      context,
                      RoutingHelper.checkoutScreen,
                    ),
                  ),
                  Gap(TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  ReadMoreText(
                    'this is a product description for blue nike sleeve less vest. there are more things that can be added but i am is a product description for blue nike sleeve less vest. there are more things ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Divider(),
                  Gap(TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TSectionHeading(
                          title: 'Reviews(199)',
                          showActionButton: false,
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.pushNamed(
                          context,
                          RoutingHelper.productReviewScreen,
                        ),
                        icon: Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),

                  Gap(TSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
