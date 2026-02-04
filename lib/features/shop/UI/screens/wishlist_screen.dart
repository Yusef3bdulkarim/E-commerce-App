import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

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
              RoutingHelper.homeScreen,
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
              TGridLayout(
                itemCount: 6,
                itemBuilder: (context, index) => TProductCardVertical(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
