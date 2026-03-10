import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../core/widget/Product/sortable/sortable_products.dart';
import '../../../../core/widget/appbar/appbar.dart';

class AllProductScreen extends StatelessWidget {
  const AllProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'All Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TSortableProducts(),
        ),
      ),
    );
  }
}
