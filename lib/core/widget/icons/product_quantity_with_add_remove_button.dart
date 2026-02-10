
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import 'circle_icons.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircleIcons(
          nameIcons: Iconsax.minus,
          color: dark
              ? TColors.white
              : TColors.black,
          width: 35,
          height: 35,
          isBackground: false,
          backgroundColor: dark
              ? TColors.darkerGrey
              : TColors.lightContainer,
        ),
        Gap(TSizes.spaceBtwItems),
        Text(
          '2',
          style: Theme.of(
            context,
          ).textTheme.titleSmall,
        ),
        Gap(TSizes.spaceBtwItems),
        TCircleIcons(
          nameIcons: Iconsax.add,
          color: dark
              ? TColors.white
              : TColors.black,
          width: 35,
          height: 35,
          isBackground: false,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
