import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
class TCircleImage extends StatelessWidget {
  const TCircleImage({
    super.key,
    this.fit = BoxFit.cover,
    this.imageProvider,
    this.image,
    this.isNetworkImage = false,
    this.overlayColors,
    this.backgroundColors,
    this.width = 56,
    this.height = 65,
    this.padding = TSizes.sm,
  });

  final ImageProvider? imageProvider; // يجي له precedence لو موجود
  final String? image; // موجود علشان باقي الأماكن
  final bool isNetworkImage;
  final BoxFit? fit;
  final Color? overlayColors, backgroundColors;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    ImageProvider? finalImage;

    if (imageProvider != null) {
      finalImage = imageProvider;
    } else if (image != null) {
      finalImage = isNetworkImage ? NetworkImage(image!) : AssetImage(image!);
    }

    return Container(
      height: height,
      width: width,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColors ?? (dark ? TColors.black : TColors.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: finalImage != null
            ? Image(image: finalImage, fit: fit, color: overlayColors)
            : SizedBox.shrink(),
      ),
    );
  }
}