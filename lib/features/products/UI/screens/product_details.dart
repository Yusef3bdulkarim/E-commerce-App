import 'package:ecommerceapp/core/routes/routing_helper.dart';

import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/bottom_add_to_cart.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/product_meta_data.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/rating_and_iconShare.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/product_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../cart/logic/cart_cubit.dart';
import '../../../checkout/logic/checkout_cubit.dart';
import '../../data/models/product_model.dart';
import '../widgets/products_widget/product_attributes.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: products),

      body: SingleChildScrollView(
        child: Column(
          children: [
            TProductImageSlider(products: products),
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  TRatingAndShare(products: products),

                  TProductMetaData(products: products),

                  TProductAttributes(products: products),
                  Gap(TSizes.spaceBtwItems),
                  TBtnApp(
                    text: "Checkout",
                    onPressed: () {
                      context.read<CartCubit>().getCheckoutDetails();
                      Navigator.pushNamed(
                        context,
                        RoutingHelper.checkoutScreen,
                        arguments: products,
                      );
                    },
                  ),
                  Gap(TSizes.spaceBtwSections),
                  TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  ReadMoreText(
                    products.description.toString(),
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
