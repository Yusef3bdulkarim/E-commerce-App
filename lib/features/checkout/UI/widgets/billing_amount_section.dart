import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:ecommerceapp/features/checkout/logic/checkout_cubit.dart';
import 'package:ecommerceapp/features/checkout/logic/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constants/sizes.dart';

class TBillingAmountSection extends StatefulWidget {
  const TBillingAmountSection({super.key});

  @override
  State<TBillingAmountSection> createState() => _TBillingAmountSectionState();
}

class _TBillingAmountSectionState extends State<TBillingAmountSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.status == CartStatus.error) {
          TLoaders.errorSnackBar(
            context: context,
            title: "Some things wrong in data Products!!",
          );
        }
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  state.subTotal.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Gap(TSizes.spaceBtwItems / 2),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shopping Fee',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  state.shippingFee.toString(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            Gap(TSizes.spaceBtwItems / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
                Text(
                  state.taxFee.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Gap(TSizes.spaceBtwItems / 2),
          ],
        );
      },
    );
  }
}
