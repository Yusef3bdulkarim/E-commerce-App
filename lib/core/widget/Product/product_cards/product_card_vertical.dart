import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/core/utils/theme/widget_themes/shadow_style.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/icons/circle_icons.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';

import 'package:ecommerceapp/core/widget/texts/product_title_text.dart';
import 'package:ecommerceapp/core/widget/texts/text_brand_title_text.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:ecommerceapp/features/products/UI/screens/product_details.dart';
import 'package:ecommerceapp/features/products/data/models/product_model.dart';
import 'package:ecommerceapp/features/shop/data/models/Category/model_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/wishlist_screen/logic/washlist_cubit.dart';
import '../../../utils/popups/loaders.dart';

class TProductCardVertical extends StatelessWidget {
  final ProductModel products;

  const TProductCardVertical({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        boxShadow: [TShadowStyle.horizontalProductShadow],
        color: dark ? TColors.darkerGrey : TColors.white,
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
      ),
      child: Column(
        children: [
          TRoundedContainer(
            height: 140,
            width: 165,
            padding: EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.lightBackground,
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(products: products),
                      ),
                    );
                  },
                  child: TRoundedImage(
                    padding: EdgeInsets.all(10),
                    imageUrl: products.thumbnail.toString(),
                    applyImageRadius: false,
                    fit: BoxFit.cover,
                  ),
                ),

                products.discount > 0
                    ? Positioned(
                        top: 8,
                        child: TRoundedContainer(
                          radios: TSizes.sm,
                          backgroundColor: Colors.yellow.withOpacity(0.8),
                          padding: EdgeInsets.symmetric(
                            horizontal: TSizes.sm,
                            vertical: TSizes.xs,
                          ),
                          child: Text(
                            "${products.discount}%",
                            style: Theme.of(
                              context,
                            ).textTheme.labelLarge!.apply(color: TColors.black),
                          ),
                        ),
                      )
                    : SizedBox.shrink(),
                Positioned(
                  right: 0,
                  top: 0,
                  child: BlocSelector<WashlistCubit, WashlistState, bool>(
                    selector: (state) =>
                        state.favoriteProducts.any((p) => p.id == products.id),
                    builder: (context, isFav) {
                      return TCircleIcons(
                        nameIcons: isFav ? Iconsax.heart5 : Iconsax.heart,
                        color: isFav
                            ? Colors.red
                            : (dark ? TColors.white : TColors.black),
                        onPressed: () async {
                          final wasFav = isFav;

                          // 1️⃣ حدث الـ UI فورًا
                          context.read<WashlistCubit>().toggleFavoriteLocal(
                            products,
                          );

                          // 2️⃣ اعمل العملية على Firebase في الخلفية بدون await UI
                          context.read<WashlistCubit>().toggleFavorite(
                            products,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(products: products),
                      ),
                    );
                  },
                  child: TProductTitleText(title: products.title.toString()),
                ),
                Gap(TSizes.spaceBtwItems / 2),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailsScreen(products: products),
                      ),
                    );
                  },
                  child: TBrandTitleTextWithVertifiedIcon(
                    title: products.name.toString(),
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(products: products),
                            ),
                          );
                        },
                        child: Text(
                          '\$${products.price}',
                          style: Theme.of(context).textTheme.headlineSmall,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: TColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(TSizes.cardRadiusMd),
                            bottomRight: Radius.circular(
                              TSizes.productImageRadius,
                            ),
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            context.read<CartCubit>().add(products);
                          },
                          child: SizedBox(
                            width: TSizes.iconLg * 1.2,
                            height: TSizes.iconLg * 1.2,
                            child: Icon(Iconsax.add, color: TColors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
