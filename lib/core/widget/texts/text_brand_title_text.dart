import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/texts/brand_titile_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleTextWithVertifiedIcon extends StatelessWidget {
  const TBrandTitleTextWithVertifiedIcon({
    super.key,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
    required this.title,
    this.maxLines = 1,
    this.textColors,
    this.iconColors = TColors.primary,
  });

  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  final String title;
  final int maxLines;
  final Color? textColors, iconColors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // يضمن أن الصف يأخذ أقل مساحة ممكنة
      children: [
        // النص هو الذي يحتاج للتمدد إذا كان طويلاً فقط
        Flexible(
          child: TBrandTitileText(
            title: title,
            color: textColors,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const Gap(TSizes.sm),
        // الأيقونة لا تحتاج Expanded لأن حجمها ثابت (iconXs)
        Icon(Iconsax.verify5, color: iconColors, size: TSizes.iconXs),
      ],
    );
  }
}
