import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text('Coding with T', style: Theme.of(context).textTheme.bodyMedium),
        Gap(TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Icon(Icons.phone, color: Colors.grey, size: 16),
            Gap(TSizes.spaceBtwItems),
            Text('012 565 9668', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Gap(TSizes.spaceBtwItems / 2),

        Row(
          children: [
            Icon(Icons.location_history, color: Colors.grey, size: 16),
            Gap(TSizes.spaceBtwItems),
            Text(
              'South liana , Naine 57645 , USA',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        Gap(TSizes.spaceBtwItems / 2),
      ],
    );

  }
}
