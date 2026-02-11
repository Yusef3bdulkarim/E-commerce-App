import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/core/widget/Btn/btn_app.dart';
import 'package:ecommerceapp/core/widget/Product/cart/cart_items.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerceapp/core/widget/success_screen/success_screen.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/checkout_screen_widget/billing_address_section.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/checkout_screen_widget/billing_amount_section.dart';
import 'package:ecommerceapp/features/shop/UI/widgets/checkout_screen_widget/billing_payment_section.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/widget/Product/cart/coupone_widget.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Column(
            children: [
              TCartItems(isShowBottomIcon: false),
              Gap(TSizes.spaceBtwItems),
              TCouponCode(),
              Gap(TSizes.spaceBtwItems),
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    TBillingAmountSection(),
                    Gap(TSizes.spaceBtwItems),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    TBillingPaymentSection(),
                    TBillingAddressSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TBtnApp(
          text: 'Checkout',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SuccessScreen(
                imageName: TImages.successfulPaymentIcon,
                title: 'Payment Success',
                subTitle: 'Your item will shipped soon',
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutingHelper.NavigationScreen,
                  (route) => false,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
