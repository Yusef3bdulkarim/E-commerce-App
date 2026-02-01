import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.text,
    this.textColor = TColors.white,
    this.backgroundColor = TColors.white,
    this.onTap,
  });
  final String image, text;
  final Color textColor, backgroundColor;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 56,
            width: 56,
            padding: EdgeInsets.all(TSizes.sm),
            decoration: BoxDecoration(
              color: backgroundColor ?? (dark ? TColors.black : TColors.white),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                color: dark ? TColors.lightBackground : TColors.dark,
              ),
            ),
          ),
          Gap(TSizes.spaceBtwItems / 2),
          Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: textColor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
