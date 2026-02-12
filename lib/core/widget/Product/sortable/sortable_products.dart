import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/sizes.dart';
import '../../layouts/grid_layour.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
          decoration: InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: ['Name', 'Higher prices', 'Lower Prices', 'Sale', 'Namest']
              .map((option) {
                return DropdownMenuItem(child: Text(option), value: option);
              })
              .toList(),
          onChanged: (val) {},
        ),
        Gap(TSizes.spaceBtwSections),
        TGridLayout(
          itemCount: 10,

          itemBuilder: (context, index) => TProductCardVertical(),
        ),
      ],
    );
  }
}
