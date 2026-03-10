import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/utils/shimmers/shimmer.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/features/products/logic/product_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../core/service_git_it/service_locator.dart';
import '../../../data/models/product_model.dart';
import '../../../data/repo/product_repo.dart';
import '../../screens/product_details.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = context.read<ProductControllerCubit>();
    final images = controller.getAllProductImages(products);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.lightGrey,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child:
                      BlocBuilder<
                        ProductControllerCubit,
                        ProductControllerState
                      >(
                        buildWhen: (perv, current) =>
                            perv.selectedProductImage !=
                            current.selectedProductImage,
                        builder: (context, state) {
                          final image = state.selectedProductImage.isEmpty
                              ? products.thumbnail
                              : state.selectedProductImage;
                          return Image(
                            image: AssetImage(image ?? TImages.productImage21),
                          );
                        },
                      ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: images.length,
                  separatorBuilder: (_, __) => const Gap(TSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    return BlocBuilder<
                      ProductControllerCubit,
                      ProductControllerState
                    >(
                      builder: (context, state) {
                        final isSelected =
                            state.selectedProductImage == images[index] ||
                            (state.selectedProductImage.isEmpty &&
                                images[index] == products.thumbnail);

                        return TRoundedImage(
                          imageUrl: images[index],
                          width: 80,
                          background: dark ? TColors.dark : TColors.white,
                          onPressed: () =>
                              controller.updateSelectedImage(images[index]),
                          border: Border.all(
                            color: isSelected
                                ? TColors.primary
                                : Colors.transparent,
                            width: 2,
                          ),
                          padding: const EdgeInsets.all(TSizes.sm),
                        );
                      },
                    );
                  },
                ),
              ),
            ),

            /// 3. الـ AppBar
            const TAppBar(showBackArrow: true),
          ],
        ),
      ),
    );
  }
}
