import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/brands/brand_showcase.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../../core/service_git_it/service_locator.dart';
import '../../../../../core/utils/shimmers/shimmer.dart';
import '../../../../products/data/models/product_model.dart';
import '../../../../products/data/repo/product_repo.dart';
import '../../../../products/logic/product_controller_cubit.dart';
import '../../../data/models/Category/model_category.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final ModelCategory category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                FutureBuilder<List<ProductModel>>(
                  future: getIt<ProductRepo>().getProductsForCategory(
                    categoryId: category.id,
                  ),
                  builder: (context, snapshot) {
                    // حالة التحميل
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const TShimmerEffect(
                        height: 250,
                        width: double.infinity,
                      );
                    }

                    // لو مفيش داتا أو لستة فاضية
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("No products found"));
                    }

                    final products = snapshot.data!;
                    print("Category: ${category.name}, Products Found: ${products.length}");
                    // استخراج بيانات البراند دايناميك من أول منتج
                    // لو المنتج معندوش براند، بنستخدم بيانات الكاتيجوري كاحتياطي (Fallback)
                    final brandName =
                        products[0].brand?.name ?? category.nameBrand;
                    final brandImage = products[0].brand?.image ?? category.image;

                    // استخراج أول 3 صور منتجات دايناميك للعرض في الـ Showcase
                    final showcaseImages = products
                        .where((p) => p.thumbnail != null)
                        .take(3)
                        .map((p) => p.thumbnail!)
                        .toList();

                    return Column(
                      children: [
                        /// الـ Showcase ببيانات دايناميك 100%
                        TBrandShowCase(image: showcaseImages, product: category),
                        const Gap(TSizes.spaceBtwItems),
                        TSectionHeading(
                          title: 'You might like',
                          onPressed: () {},
                        ),
                        const Gap(TSizes.spaceBtwItems),

                        TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              TProductCardVertical(products: products[index]),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      );
  }
}
