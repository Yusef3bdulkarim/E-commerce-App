import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../../core/utils/constants/colors.dart';
import '../../../../../core/utils/constants/sizes.dart';
import '../../../../../core/widget/Product/rating/ratign_bar_indicator.dart';
import '../../../../../core/widget/custom_shapes/containers/rounded_container.dart';
import '../../../../../core/widget/texts/product_title_text.dart';
import '../../../../../core/widget/texts/section_heading.dart';
import '../products_widget/product_price_text.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key, required this.image, required this.name, required this.date, required this.subTitle, required this.titleValide, required this.subTitleValide, required this.rating});
  final String image,name,date,subTitle,titleValide,subTitleValide;
  final double rating;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: TColors.black,
                borderRadius: BorderRadius.circular(50),
                image: DecorationImage(image: AssetImage(image)),
              ),
            ),
            Gap(TSizes.xs),
            Text(name, style: Theme
                .of(context)
                .textTheme
                .titleLarge),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: dark ? TColors.grey : TColors.primary,
              ),
            ),
          ],
        ),
        Gap(TSizes.spaceBtwItems),
        Row(
          children: [
            TRatingBarIndicator(rating: rating),
            Gap(TSizes.defaultSpace),
            Text(date, style: Theme
                .of(context)
                .textTheme
                .bodySmall),
          ],
        ),
        Gap(TSizes.spaceBtwItems),
        Text(
          subTitle,
          style: Theme
              .of(context)
              .textTheme
              .bodySmall,
        ),
        Gap(TSizes.spaceBtwItems),
        Column(
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
                          title: titleValide,
                          showActionButton: false,
                        ),
                      ),
                      Gap(TSizes.spaceBtwItems),

                    Spacer(),
                      Text(date, style: Theme
                          .of(context)
                          .textTheme
                          .bodyMedium),
                    ],
                  ),
                  Gap(TSizes.spaceBtwItems),
                  ReadMoreText(
                    subTitleValide,
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'read more',
                    trimExpandedText: 'Show less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                        color: Colors.blue
                    ),
                  ),
                ],
              ),
            ),


          ],
        ),


      ]
      ,
    );


  }
}
