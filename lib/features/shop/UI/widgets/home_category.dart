import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/image_text_widgets/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return TVerticalImageText(image: TImages.shoeIcon, text: 'Shoes');
        },
        separatorBuilder: (context, index) => Gap(TSizes.spaceBtwItems),
        itemCount: 6,
      ),
    );
  }
}
