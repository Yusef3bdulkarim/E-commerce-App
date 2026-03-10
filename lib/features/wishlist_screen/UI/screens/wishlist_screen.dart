import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/features/wishlist_screen/logic/washlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/service_git_it/service_locator.dart';
import '../../../products/data/repo/product_repo.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: false,
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircleIcons(
            nameIcons: Iconsax.add,
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context,
              RoutingHelper.NavigationScreen,
              (route) => false,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // في WishlistScreen
              BlocBuilder<WashlistCubit, WashlistState>(
                builder: (context, state) {
                  if (state.status == WashlistStatus.loading) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (state.status == WashlistStatus.error) {
                    TLoaders.errorSnackBar(
                      context: context,
                      title: "These is wrong in app please try agian",
                      message: state.message,
                    );
                  }
                  if (state.favoriteProducts.isEmpty) {
                    return const Center(child: Text("Wishlist is empty "));
                  }

                  return TGridLayout(
                    itemCount: state.favoriteProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      products: state.favoriteProducts[index],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
