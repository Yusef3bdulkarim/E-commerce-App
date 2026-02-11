import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../features/shop/UI/widgets/products_widget/product_price_text.dart';
import '../../../../features/shop/UI/widgets/products_widget/product_title_text.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../icons/product_quantity_with_add_remove_button.dart';
import '../../images/rounded_image.dart';
import '../../texts/text_brand_title_text.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key, this.isShowBottomIcon=true,
  });
final bool isShowBottomIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TRoundedImage(
                  imageUrl: TImages.productImage66,
                  padding: EdgeInsets.all(TSizes.sm),
                  width: 60,
                  height: 60,
                ),
                Gap(TSizes.spaceBtwItems),
                Expanded(
                  child:
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TBrandTitleTextWithVertifiedIcon(title: "iphone 8"),
                      Flexible(
                        child: TProductTitleText(
                          title: 'Black Sports shoes',
                          maxline: 1,
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Color',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'Green',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge,
                            ),
                            TextSpan(
                              text: 'Sizes',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall,
                            ),
                            TextSpan(
                              text: 'UK 08',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyLarge,
                            ),
                          ],
                        ),
                      ),

                      Spacer(),
                      if(isShowBottomIcon) Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TProductQuantityWithAddRemoveButton(),

                          TProductPriceText(price: "256.0")
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      },
      separatorBuilder: (_, index) => Gap(TSizes.spaceBtwItems),
      itemCount: 2,
    );
  }
}