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

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: false,
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark
                    ? const Color.fromARGB(255, 0, 0, 0)
                    : TColors.white,
                expandedHeight: 430,

                flexibleSpace: Padding(
                  padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      Gap(TSizes.spaceBtwItems),
                      TSearchContainer(
                        text: "Search Store",
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      Gap(TSizes.spaceBtwSections),

                      TSectionHeading(
                        title: 'Featured Brands',
                        showActionButton: true,
                        onPressed: () {},
                      ),
                      Gap(TSizes.spaceBtwItems / 1.5),
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExteny: 80,
                        itemBuilder: (context, index) {
                          return const TBrandCard();
                        },
                      ),
                    ],
                  ),
                ),

                bottom: TTabBar(
                  tabs: [
                    Tab(child: Text("sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
