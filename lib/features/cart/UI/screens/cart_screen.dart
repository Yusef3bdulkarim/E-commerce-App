import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/features/checkout/UI/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widget/Product/cart/cart_items.dart';
import '../../logic/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Cart", style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartProducts.isEmpty) {
            return const Center(child: Text("Your cart is empty!"));
          }

          return Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TCartItems(isShowBottomIcon: true),
          );
        },
      ),

      bottomNavigationBar: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state.cartProducts.isEmpty) return const SizedBox();
          return Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: TBtnApp(
              text: 'Checkout \$${state.totalCartPrice}',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()),
              ),
            ),
          );
        },
      ),
    );
  }
}
