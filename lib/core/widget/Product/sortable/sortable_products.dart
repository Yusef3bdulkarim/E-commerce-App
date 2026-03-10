import 'package:ecommerceapp/core/utils/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../features/products/logic/product_controller_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../layouts/grid_layour.dart';
import '../product_cards/product_card_vertical.dart';

class TSortableProducts extends StatefulWidget {
  const TSortableProducts({super.key});

  @override
  State<TSortableProducts> createState() => _TSortableProductsState();
}

class _TSortableProductsState extends State<TSortableProducts> {
  @override
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductControllerCubit, ProductControllerState>(
      builder: (context, state) {
        if (state.status == ProductStatus.loading)
          return const Center(child: CircularProgressIndicator());
        return Column(
          children: [
            DropdownButtonFormField(
              dropdownColor: TColors.white,
              decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
              value: state.currentSortOption ,
              items: ['Name', 'Newest', 'Best Seller', 'Sale']
                  .map(
                    (option) =>
                        DropdownMenuItem(value: option, child: Text(option)),
                  )
                  .toList(),
              onChanged: (val) {
                if (val != null && state.product.isNotEmpty) {
                  context.read<ProductControllerCubit>().updateSortOption(val);
                  context.read<ProductControllerCubit>().sortProducts(val);
                }
              },
            ),
            const Gap(TSizes.spaceBtwSections),
            TGridLayout(
              key: ValueKey(state.currentSortOption),
              itemCount: state.product.length,
              itemBuilder: (context, index) {
                if (state.status == ProductStatus.loading)
                  return TShimmerEffect(height: 140, width: 165);

                return TProductCardVertical(
                  key: ValueKey(state.product.hashCode ^ state.product.length),
                  products: state.product[index],
                );
              },
            ),
          ],
        );
      },
    );
  }
}
