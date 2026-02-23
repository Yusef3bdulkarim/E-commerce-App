import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TBtnApp extends StatelessWidget {
  const TBtnApp({
    super.key,
    this.text = "",
    this.width = double.infinity,
    this.color = TColors.primary,
    this.textColor = TColors.white,
    this.onPressed,
    this.child,
    this.isChild = true,
    this.textSize = 14,
    this.fontWeight = FontWeight.bold,
  });

  final String text;
  final FontWeight fontWeight;
  final double textSize;
  final double width;
  final Color color;
  final Color textColor;
  final Widget? child;
  final bool isChild;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: isChild
            ? Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontWeight: fontWeight,
                  fontSize: textSize,
                ),
              )
            : child,
      ),
    );
  }
}
