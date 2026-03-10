import 'package:ecommerceapp/core/list_data_upload.dart';
import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/search_container.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/home_appbar.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/home_category.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/service_git_it/service_locator.dart';
import '../../../../core/utils/shimmers/shimmer.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/data/repo/product_repo.dart';
import '../../../products/logic/product_controller_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductControllerCubit>().fetchFeatureProduct();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const THomeAppBar(),
                  const Gap(TSizes.spaceBtwItems),
                  TSearchContainer(text: 'Search in Store'),
                  const Gap(TSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: const [
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                        ),
                        Gap(TSizes.spaceBtwItems),
                        THomeCategory(),
                        Gap(TSizes.spaceBtwSections),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  const TPromoSlider(),
                  const Gap(TSizes.spaceBtwItems),
                  TSectionHeading(
                    onPressed: () {
                      context.read<ProductControllerCubit>().fetchAllProduct();
                      Navigator.pushNamed(
                        context,
                        RoutingHelper.allProductScreen,
                      );
                    },
                    title: "Popular Products",
                  ),

                  BlocBuilder<ProductControllerCubit, ProductControllerState>(
                    builder: (context, state) {
                      if (state.status == ProductStatus.loading) {
                        return TGridLayout(
                          itemCount: 4,
                          itemBuilder: (_, __) =>
                              const TShimmerEffect(height: 250, width: 180),
                        );
                      }
                      if (state.status == ProductStatus.error) {
                        return TLoaders.errorSnackBar(
                          context: context,
                          title: "Oh Snap !!",
                          message: state.message.toString(),
                        );
                      }
                      if (state.featuredProducts.isEmpty) {
                        return const Center(child: Text("No Products found"));
                      }
                      return TGridLayout(
                        itemCount: state.featuredProducts.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          products: state.featuredProducts[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
