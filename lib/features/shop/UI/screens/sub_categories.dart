import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_horizontal.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubCategories extends StatelessWidget {
  const SubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            TRoundedImage(
              imageUrl: TImages.banner2,
              width: double.infinity,
              applyImageRadius: true,
            ),
            Gap(TSizes.spaceBtwSections),
            Column(
              children: [
                TSectionHeading(title: 'Sports Shirts', onPressed: () {}),
                Gap(TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 115,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TProductCardHorizontal(
                        image: TImages.productImage63,
                        title: "Adidas Football",
                        subTitle: 'Adidas',
                        price: '50.0',
                        isShowDiscount: true,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Gap(TSizes.spaceBtwItems),
                    itemCount: 4,
                  ),
                ),

                TSectionHeading(title: 'Sports Shoes', onPressed: () {}),
                Gap(TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 115,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TProductCardHorizontal(
                        image: TImages.productImage63,
                        title: "Adidas Football",
                        subTitle: 'Adidas',
                        price: '50.0',
                        isShowDiscount: true,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Gap(TSizes.spaceBtwItems),
                    itemCount: 4,
                  ),
                ),
                TSectionHeading(title: 'Track Sults', onPressed: () {}),
                Gap(TSizes.spaceBtwItems / 2),
                SizedBox(
                  height: 115,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return TProductCardHorizontal(
                        image: TImages.productImage21,
                        title: "Adidas Football",
                        subTitle: 'Adidas',
                        price: '50.0',
                        isShowDiscount: true,
                      );
                    },
                    separatorBuilder: (context, index) =>
                        Gap(TSizes.spaceBtwItems),
                    itemCount: 4,
                  ),
                ),



              ],
            ),
          ],
        ),
      ),
    );
  }
}
