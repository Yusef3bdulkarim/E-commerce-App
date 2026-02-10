import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/image_text_widgets/vertical_image_text.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/product_price_text.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/products_widget/product_title_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widget/icons/circle_icons.dart';
import '../../../../core/widget/icons/product_quantity_with_add_remove_button.dart';
import '../../../../core/widget/texts/text_brand_title_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TRoundedImage(
                      imageUrl: TImages.productImage66,
                      padding: EdgeInsets.all(TSizes.sm),
                      width: 60,
                      height: 60,
                    ),
                    Gap(TSizes.spaceBtwItems),
                    Expanded(
                      child:
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TBrandTitleTextWithVertifiedIcon(title: "iphone 8"),
                          Flexible(
                            child: TProductTitleText(
                              title: 'Black Sports shoes',
                              maxline: 1,
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Color',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: 'Green',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge,
                                ),
                                TextSpan(
                                  text: 'Sizes',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall,
                                ),
                                TextSpan(
                                  text: 'UK 08',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TProductQuantityWithAddRemoveButton(),

                             TProductPriceText(price: "256.0")
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
          separatorBuilder: (_, index) => Gap(TSizes.spaceBtwItems),
          itemCount: 14,
        ),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: (){}, child:Text("Checkout \$256.0") ),
      ),
    );
  }
}
