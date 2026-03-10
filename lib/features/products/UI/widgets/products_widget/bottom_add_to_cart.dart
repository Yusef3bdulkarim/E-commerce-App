import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: TSizes.defaultSpace,
            vertical: TSizes.defaultSpace / 2,
          ),
          decoration: BoxDecoration(
            color: dark ? TColors.darkerGrey : TColors.lightBackground,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  TCircleIcons(
                    nameIcons: Iconsax.minus,
                    onPressed: () =>
                        context.read<CartCubit>().updateQuantity(false),
                    color: dark ? TColors.white : TColors.black,
                    width: 40,
                    height: 40,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  Text(
                    state.quantity.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Gap(TSizes.spaceBtwItems),
                  TCircleIcons(
                    nameIcons: Iconsax.add,
                    onPressed: () =>
                        context.read<CartCubit>().updateQuantity(true),
                    color: dark ? TColors.white : TColors.black,
                    width: 40,
                    height: 40,
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CartCubit>().add(product);
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: TColors.black,
                  side: BorderSide(color: TColors.black),
                ),
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    color: TColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
