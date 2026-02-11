import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class TBtnApp extends StatelessWidget {
  const TBtnApp({
    super.key,
    required this.text,
    this.width = double.infinity,
    this.color = TColors.primary,
    this.textColor = TColors.white,  this.onPressed,
  });

  final String text;
  final double width;
  final Color color;
  final Color textColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color:color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
