import 'package:ecommerceapp/core/utils/shimmers/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';
import '../constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        shrinkWrap: true,

        itemBuilder: (context, index) {
          return Column(
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55),
              Gap(TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
        separatorBuilder: (context, index) => Gap(TSizes.spaceBtwItems),
        itemCount: 5,
      ),
    );
  }
}
