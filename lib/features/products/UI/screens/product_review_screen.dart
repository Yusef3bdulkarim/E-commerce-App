import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/device/device_utility.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
            children: [
              Text(
                'Rating and reciews are verified and are from peaple who use the same type of deviced that you use.',
              ),
              Gap(TSizes.spaceBtwItems),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      '4.8',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '5',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Gap(TSizes.spaceBtwItems/2),
                            Expanded(
                              child: SizedBox(
                                width:
                                    TDeviceUtils.getScreenWidth(context) * 0.8,
                                child: LinearProgressIndicator(
                                  value: 0.5,
                                  minHeight: 11,
                                  backgroundColor: TColors.grey,
                                  borderRadius: BorderRadius.circular(7),
                                  valueColor: AlwaysStoppedAnimation(
                                    TColors.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
