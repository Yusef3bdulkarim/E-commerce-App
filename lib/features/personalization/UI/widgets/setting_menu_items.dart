import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';

import 'package:flutter/material.dart';

class TSettingMenuItems extends StatelessWidget {
  const TSettingMenuItems({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon, color: TColors.primary),
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
            color: dark ? TColors.white : TColors.black,
          ),
        ),
        subtitle: Text(
          subTitle,
          style: Theme.of(context).textTheme.bodyMedium!.apply(
            color: dark ? TColors.white : TColors.black,
          ),
        ),
        trailing: trailing,
      ),
    );
  }
}
