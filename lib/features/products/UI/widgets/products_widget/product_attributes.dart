import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/chip/choice_chip.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/texts/product_title_text.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/products/UI/widgets/products_widget/product_price_text.dart';
import 'package:ecommerceapp/features/products/logic/product_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../data/models/product_model.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.products});

  final ProductModel products;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = context.read<ProductControllerCubit>();
    return BlocBuilder<ProductControllerCubit, ProductControllerState>(
      builder: (context, state) {
        final selectedVariation = state.selectedVariation;
        final hasVariation =
            selectedVariation != null && selectedVariation.id.isNotEmpty;
        return Column(
          children: [
            if (hasVariation)
              TRoundedContainer(
                backgroundColor: dark ? TColors.darkGrey : TColors.grey,
                padding: EdgeInsets.all(TSizes.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 75,
                          child: TSectionHeading(
                            title: "Vaiation",
                            showActionButton: false,
                          ),
                        ),
                        Gap(TSizes.spaceBtwItems),

                        Column(
                          children: [
                            Row(
                              children: [
                                TProductTitleText(
                                  title: "Price : ",
                                  smallSize: true,
                                ),
                                if (selectedVariation.salePrice > 0)
                                  Text(
                                    "\$${selectedVariation.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .apply(
                                          decoration:
                                              TextDecoration.lineThrough,
                                        ),
                                  ),
                                Gap(TSizes.spaceBtwItems),
                                TProductPriceText(
                                  price:
                                      "${products.price - ((products.price * products.discount) / 100)}",
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                TProductTitleText(
                                  title: "Stock : ",
                                  smallSize: true,
                                ),
                                Text(
                                  controller.getProductStockStatus(
                                    selectedVariation.stock,
                                  ),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            Gap(TSizes.spaceBtwItems),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: products.productAttributes!.map((attribute) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionHeading(title: attribute.name ?? '', showActionButton: false),
                    const Gap(TSizes.spaceBtwItems / 2),
                    Wrap(
                      spacing: 8,
                      children: attribute.values!.map((value) {
                        final isSelected = state.selectedAttributes[attribute.name] == value;

                        return TChoiceChip(
                          text: value,
                          selected: isSelected,
                          onselected: (val) {
                            controller.updateAttributeSelection(products, attribute.name!, value);
                          },
                        );
                      }).toList(),
                    ),
                    const Gap(TSizes.spaceBtwItems),
                  ],
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

// Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     TSectionHeading(title: "Colors"),
//     Gap(TSizes.spaceBtwItems / 2),
//     Wrap(
//       spacing: 8,
//       children: [
//         TChoiceChip(
//           text: 'Green',
//           selected: true,
//           onselected: (val) {},
//         ),
//         TChoiceChip(
//           text: 'Blue',
//           selected: false,
//           onselected: (val) {},
//         ),
//         TChoiceChip(
//           text: 'Yellow',
//           selected: false,
//           onselected: (val) {},
//         ),
//       ],
//     ),
//   ],
// ),
