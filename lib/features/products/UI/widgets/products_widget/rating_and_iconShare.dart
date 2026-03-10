import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/models/product_model.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Iconsax.star5, color: Colors.amber, size: 24),
            Gap(TSizes.spaceBtwItems / 2),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: products.rating.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  TextSpan(text: "(${products.share})"),
                ],
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.share, size: TSizes.iconMd),
        ),
      ],
    );
  }
}
