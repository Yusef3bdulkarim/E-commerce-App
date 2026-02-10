import 'package:ecommerceapp/features/shop/UI/widgets/product_review_widgets/rating_progress_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(text: '5', value: 0.5),
              TRatingProgressIndicator(text: '8', value: 0.8),
              TRatingProgressIndicator(text: '2', value: 0.2),
              TRatingProgressIndicator(text: '4', value: 0.4),
            ],
          ),
        ),
      ],
    );
  }
}
