import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircleIcons extends StatelessWidget {
  const TCircleIcons({
    super.key,
    required this.nameIcons,
    this.onPressed,
    this.height,
    this.width,
    this.size = TSizes.lg,
    this.color,
    this.backgroundColor,
    this.isBackground = true,
  });

  final IconData nameIcons;
  final void Function()? onPressed;
  final double? height, width, size;
  final Color? color, backgroundColor;
  final bool isBackground;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isBackground
            ? dark
                  ? TColors.black.withOpacity(0.1)
                  : TColors.white.withOpacity(0.5)
            : backgroundColor,
      ),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(nameIcons, color: color),
        iconSize: size,
      ),
    );
  }
}
