import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/enums.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Product/cart/cart_menu_icon.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_vertical.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/appbar/tabbar.dart';
import 'package:ecommerceapp/core/widget/brands/brand_showcase.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/search_container.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/brand_titile_text.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/core/widget/texts/text_brand_title_text.dart';
import 'package:ecommerceapp/core/widget/brands/brand_card.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/store_widget/gategory_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/service_git_it/service_locator.dart';
import '../../data/models/Category/model_category.dart';
import '../../data/repo/repo_shop.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final categoryRepo = getIt<RepoShop>();

    return StreamBuilder<List<ModelCategory>>(
      stream: categoryRepo.getAllCategoriesStream(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Scaffold(
            body: Center(child: Text("No Categories Found")),
          );
        }

        final categories = snapshot.data!;

        return DefaultTabController(
          length: categories.length,
          child: Scaffold(
            appBar: TAppBar(
              title: Text(
                'Store',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              actions: [TCartCounterIcon(onPressed: () {})],
              showBackArrow: false,
            ),
            body: NestedScrollView(
              headerSliverBuilder: (_, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: true,
                    backgroundColor: dark ? Colors.black : TColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: [
                          const Gap(TSizes.spaceBtwItems),
                          TSearchContainer(
                            text: "Search Store",
                            showBackground: false,
                            padding: EdgeInsets.zero,
                          ),
                          const Gap(TSizes.spaceBtwSections),
                          TSectionHeading(
                            title: 'Featured Brands',
                            showActionButton: true,
                            onPressed: () {},
                          ),
                          const Gap(TSizes.spaceBtwItems / 1.5),
                          TGridLayout(
                            itemCount: 4,
                            mainAxisExteny: 80,
                            itemBuilder: (_, index) => const TBrandCard(),
                          ),
                        ],
                      ),
                    ),

                    bottom: TTabBar(
                      tabs: categories
                          .map((e) => Tab(child: Text(e.name)))
                          .toList(),
                    ),
                  ),
                ];
              },
              body: TabBarView(
                children: categories
                    .map((e) => TCategoryTab(category: e))
                    .toList(),
              ),
            ),
          ),
        );
      },
    );
  }
}
