import 'package:flutter/material.dart';
import '../../widget/loaders/animation_loader.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';


class TFullScreenLoader {
  static void openLoadingDialog(BuildContext context, String text, String animation) {
    showDialog(
      context: context,
      useRootNavigator: true,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// لإغلاق الديايلوج
  static void stopLoading(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }
}