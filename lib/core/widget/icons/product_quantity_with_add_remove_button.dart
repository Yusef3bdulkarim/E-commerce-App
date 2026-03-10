import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/cart/data/models/cart_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_functions.dart';
import 'circle_icons.dart';

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
    required this.productId,
    required this.quantity,
  });

  final String productId;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TCircleIcons(
          nameIcons: Iconsax.minus,
          onPressed: () =>
              context.read<CartCubit>().changeQuantity(productId, quantity - 1),
          color: dark ? TColors.white : TColors.black,
          width: 35,
          height: 35,
          isBackground: false,
          backgroundColor: dark ? TColors.darkerGrey : TColors.lightContainer,
        ),
        Gap(TSizes.spaceBtwItems),
        BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return Text(
              quantity.toString(),
              style: Theme.of(context).textTheme.titleSmall,
            );
          },
        ),
        Gap(TSizes.spaceBtwItems),
        TCircleIcons(
          nameIcons: Iconsax.add,
          onPressed: () =>
              context.read<CartCubit>().changeQuantity(productId, quantity + 1),

          color: dark ? TColors.white : TColors.black,
          width: 35,
          height: 35,
          isBackground: false,
          backgroundColor: TColors.primary,
        ),
      ],
    );
  }
}
