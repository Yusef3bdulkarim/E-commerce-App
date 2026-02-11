import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widget/Product/cart/cart_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TBtnApp(
          text: 'Checkout \$350.0',
          onPressed: () =>
              Navigator.pushNamed(context, RoutingHelper.checkoutScreen),
        ),
      ),
    );
  }
}
