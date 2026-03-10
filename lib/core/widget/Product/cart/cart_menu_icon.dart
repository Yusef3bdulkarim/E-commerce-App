import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/cart/logic/cart_cubit.dart';
class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    this.counterBgColor,
    this.counterTextColor,
    this.iconColor,
    required this.onPressed,
  });

  final Color? iconColor, counterBgColor, counterTextColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(
          onPressed: () => Navigator.pushNamed(context, RoutingHelper.cartScreen),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor ?? (dark ? TColors.white : TColors.black),
        ),
        // داخل TCartCounterIcon
        Positioned(
          right: 0,
          child: BlocBuilder<CartCubit, CartState>(
            buildWhen: (previous, current) =>
            previous.noOfCartItems != current.noOfCartItems,
            builder: (context, state) {
              if (state.noOfCartItems == 0) {
                return const SizedBox();
              }

              return Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                  color: counterBgColor ??
                      (dark ? TColors.white : TColors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: Text(
                    state.noOfCartItems > 99
                        ? "99+"
                        : state.noOfCartItems.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(
                      color: counterTextColor ??
                          (dark ? TColors.black : TColors.white),
                      fontSizeFactor: 0.8,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}