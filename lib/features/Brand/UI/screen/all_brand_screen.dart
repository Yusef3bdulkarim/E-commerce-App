import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/widget/Product/sortable/sortable_products.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/brands/brand_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Nike'),),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),child:Column(
          children: [
            TBrandCard(showBorder: true,),
            Gap(TSizes.spaceBtwSections),
            TSortableProducts()
          ],
        ) ,),
      ),
    );
  }
}
