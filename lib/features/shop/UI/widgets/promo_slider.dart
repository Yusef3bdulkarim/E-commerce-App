import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/shimmers/shimmer.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/circular_container.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/features/shop/logic/home%20controller/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.banner.isEmpty) {
          return TShimmerEffect(width: double.infinity, height: 190, radius: 15);
        }
        return Column(
          children: [
            CarouselSlider(
              items: state.banner
                  .map((url) => TRoundedImage(imageUrl: url.imageUrl))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    context.read<HomeCubit>().updatePageIndicator(index),
              ),
            ),
            Gap(TSizes.spaceBtwItems),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < state.banner.length; i++)
                  TCircularContainer(
                    margin: 2,
                    width: 12,
                    height: 4,
                    backgroundColor: state.carousalCurrentIndex == i
                        ? TColors.primary
                        : TColors.grey,
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}
