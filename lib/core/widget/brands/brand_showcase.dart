import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/brands/brand_card.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({super.key, required this.image});
  final List<String> image;
  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: EdgeInsets.all(TSizes.md),
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          TBrandCard(showBorder: false),
          Row(
            children: image
                .map((e) => brandTopProductImageWidget(e, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Expanded brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.lightContainer,
        margin: EdgeInsets.only(right: TSizes.sm),
        padding: EdgeInsets.all(TSizes.md),
        child: Image(image: AssetImage(image), fit: BoxFit.contain),
      ),
    );
  }
}
