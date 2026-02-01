import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:flutter/cupertino.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    this.margin = 0,
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.backgroundColor = TColors.white,
  });
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final double margin;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
