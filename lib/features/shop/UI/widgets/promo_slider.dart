import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/circular_container.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/features/shop/logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({super.key, required this.banners});
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            CarouselSlider(
              items: banners
                  .map((url) => TRoundedImage(imageUrl: url))
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
                for (int i = 0; i < 3; i++)
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
