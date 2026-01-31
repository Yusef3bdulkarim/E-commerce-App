import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../constants/colors.dart';
import '../helpers/helper_functions.dart';

class TLoaders {
  //
  static hideSnackBar(BuildContext context) =>
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

  static customToast({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12.0),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: THelperFunctions.isDarkMode(context)
                ? TColors.darkerGrey.withOpacity(0.9)
                : TColors.grey.withOpacity(0.9),
          ),
          child: Center(
            child: Text(message, style: Theme.of(context).textTheme.bodySmall),
          ),
        ),
      ),
    );
  }

  static successSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
    int duration = 3,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          leading: const Icon(Iconsax.check, color: TColors.white),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(message, style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: TColors.dashboardAppbarBackground,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(10),
        duration: Duration(seconds: duration),
      ),
    );
  }

  static warningSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          leading: const Icon(Iconsax.warning_2, color: TColors.white),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(message, style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static errorSnackBar({
    required BuildContext context,
    required String title,
    String message = '',
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: ListTile(
          leading: const Icon(Iconsax.warning_2, color: TColors.white),
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(message, style: const TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.red.shade600,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}
