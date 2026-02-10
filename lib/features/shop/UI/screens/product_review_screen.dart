import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/device/device_utility.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/product_review_widgets/user_review_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/utils/constants/image_strings.dart';
import '../../../../core/widget/Product/rating/ratign_bar_indicator.dart';
import '../widgets/product_review_widgets/overall_product_rating.dart';
import '../widgets/product_review_widgets/rating_progress_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Reviews & Ratings'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rating and reciews are verified and are from peaple who use the same type of deviced that you use.',
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall,
              ),
              Gap(TSizes.spaceBtwItems),
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text('12.661', style: Theme
                  .of(context)
                  .textTheme
                  .bodySmall),
              Gap(TSizes.spaceBtwSections),
              TUserReviewCard(
                image: TImages.user3,
                name: "John Doe",
                date: '01-Nov-2023',
                subTitle:
                'The user interface og the app is quite intuitice . i was able to navigate and make purchases seamlessly. Great job!.',
                titleValide: "T's Store",
                subTitleValide: 'this is a product description for blue nike sleeve less vest. there are more things that can be added but i am is a product description for blue nike sleeve less vest. there are more things ',
                rating: 3.5,
              ),
              Gap(TSizes.spaceBtwItems),
              TUserReviewCard(
                image: TImages.user2,
                name: "John Doe",
                date: '01-Nov-2023',
                subTitle:
                'The user interface og the app is quite intuitice . i was able to navigate and make purchases seamlessly. Great job!.',
                titleValide: "T's Store",
                subTitleValide: 'this is a product description for blue nike sleeve less vest. there are more things that can be added but i am is a product description for blue nike sleeve less vest. there are more things ',
                rating: 2.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
