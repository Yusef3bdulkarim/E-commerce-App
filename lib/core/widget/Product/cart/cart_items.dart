import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/cart/data/models/cart_model.dart';
import '../../../../features/products/UI/widgets/products_widget/product_price_text.dart';
import '../../../../features/products/UI/widgets/products_widget/product_title_text.dart';
import '../../../../features/products/data/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../icons/product_quantity_with_add_remove_button.dart';
import '../../images/rounded_image.dart';
import '../../texts/text_brand_title_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, required this.isShowBottomIcon});

  final bool isShowBottomIcon;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
      previous.cartProducts != current.cartProducts,
      builder: (context, state) {
        if (state.cartProducts.isEmpty) {
          return const Center(child: Text("Your cart is empty!"));
        }
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) {
            final item = state.cartProducts[index];
            return Dismissible(
              key: Key(item.product.id),
              // مفتاح فريد لكل منتج
              direction: DismissDirection.endToStart,
              // السحب من اليمين لليسار
              background: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  color: TColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Iconsax.trash, color: TColors.error),
              ),

              // 2. الأكشن اللي هيحصل لما يسحب للاخر
              onDismissed: (direction) {
                context.read<CartCubit>().remove(item.product.id);
              },
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TRoundedImage(
                        imageUrl: item.product.thumbnail.toString(),
                        padding: EdgeInsets.all(TSizes.sm),
                        width: 60,
                        height: 60,
                      ),
                      Gap(TSizes.spaceBtwItems),
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TBrandTitleTextWithVertifiedIcon(
                              title: item.product.name.toString(),
                            ),
                            Flexible(
                              child: TProductTitleText(
                                title: item.product.title.toString(),
                                maxline: 1,
                              ),
                            ),

                            Spacer(),
                            if (isShowBottomIcon)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TProductQuantityWithAddRemoveButton(
                                    productId: item.product.id,
                                    quantity: item.quantity,
                                  ),
                                  TProductPriceText(
                                    price: item.totalPrice.toStringAsFixed(2),
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, index) => Gap(TSizes.spaceBtwItems),
          itemCount: state.cartProducts.length,
        );
      },
    );
  }
}
