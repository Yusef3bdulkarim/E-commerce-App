import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/brands/brand_card.dart';
import 'package:ecommerceapp/core/widget/layouts/grid_layour.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/widget/appbar/appbar.dart';

class BrandScreen extends StatelessWidget {
  const BrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Brand', style: Theme.of(context).textTheme.headlineSmall),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TSectionHeading(title: 'Brands', showActionButton: false),
              Gap(TSizes.spaceBtwItems),
              TGridLayout(
                mainAxisExteny: 80,
                itemCount: 10,
                itemBuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Navigator.pushNamed(
                    context,
                    RoutingHelper.allBrandScreen,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
