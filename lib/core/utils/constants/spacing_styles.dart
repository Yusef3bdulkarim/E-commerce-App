import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight =
      EdgeInsetsGeometry.only(
        top: TSizes.appBarHeight,
        left: TSizes.defaultSpace,
        right: TSizes.defaultSpace,
        bottom: TSizes.defaultSpace,
      );
}
