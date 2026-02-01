import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    this.height,
    this.width,
    this.applyImageRadius = true,
    this.border,
    this.background,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkingImage = false,
    this.onPressed,
    super.key,
    required this.imageUrl,
  });
  final double? height, width;
  final bool applyImageRadius;
  final String imageUrl;
  final BoxBorder? border;
  final Color? background;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkingImage;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: background,
          borderRadius: BorderRadius.circular(TSizes.md),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(TSizes.md)
              : BorderRadiusGeometry.circular(0),
          child: Image(
            image: isNetworkingImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl),
            fit: fit,
          ),
        ),
      ),
    );
  }
}
