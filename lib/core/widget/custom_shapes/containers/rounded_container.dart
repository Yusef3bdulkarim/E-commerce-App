// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedContainer extends StatelessWidget {
  TRoundedContainer({
    Key? key,
    this.width,
    this.child,
    this.showBorder = false,
    this.backgroundColor,
    this.margin,
    this.radios = TSizes.cardRadiusLg,
    this.height,
    this.borderColor = TColors.borderPrimary,
    this.padding,
  }) : super(key: key);
  final double? radios, height, width;
  final Widget? child;
  final bool showBorder;
  final Color? borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: showBorder ? Border.all(color: borderColor!) : null,
        borderRadius: BorderRadius.circular(radios!),
      ),
      child: child,
    );
  }
}
