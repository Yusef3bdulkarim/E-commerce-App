import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/utils/constants/sizes.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.isSelectedAddress});

  final bool isSelectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: isSelectedAddress
              ? TColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: isSelectedAddress
              ? Colors.transparent
              : dark
              ? TColors.darkerGrey
              : TColors.grey,
          margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  isSelectedAddress ? Iconsax.tick_circle : null,
                  color: isSelectedAddress
                      ? dark
                            ? TColors.lightContainer
                            : TColors.dark
                      : null,
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'John Doe',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Gap(TSizes.sm / 2),
                  Text(
                    '(+123) 456 7951',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(TSizes.sm / 2),
                  Text(
                    '235625 Timmy Coves , South liana . 4164646 , USA',
                    softWrap: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
