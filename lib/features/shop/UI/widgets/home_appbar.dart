import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/Product/cart/cart_menu_icon.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      showBackArrow: false,
      title: Column(
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: TColors.white),
          ),
        ],
      ),
      actions: [TCartCounterIcon(onPressed: () {},iconColor: TColors.white,)],
    );
  }
}
