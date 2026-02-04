import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class TBrandTitileText extends StatelessWidget {
  const TBrandTitileText({
    super.key,
    required this.title,
    this.color,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final String title;
  final Color? color;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.bodyMedium!.apply(color: color)
          : brandTextSize == TextSizes.large
          ? Theme.of(context).textTheme.titleLarge
          : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
