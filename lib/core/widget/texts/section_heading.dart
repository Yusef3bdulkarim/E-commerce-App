import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColors,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });
  final Color? textColors;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.headlineSmall!.apply(color: textColors),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Spacer(),
        if (showActionButton)
          TextButton(
            onPressed: onPressed,

            child: Text(
              buttonTitle,
              style: TextStyle(color: TColors.textSecondary),
            ),
          ),
      ],
    );
  }
}
