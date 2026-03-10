import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/brands/brand_card.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:ecommerceapp/features/shop/data/models/Category/model_category.dart';
import 'package:flutter/material.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({super.key, required this.image, required this.product});

  final List<String> image;
  final ModelCategory product;

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
          TBrandCard(
            showBorder: false,
            nameBrand: product.nameBrand,
            imageIcons: product.image,

          ),
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
        child: Image(image: AssetImage(image), fit: BoxFit.cover),
      ),
    );
  }
}
