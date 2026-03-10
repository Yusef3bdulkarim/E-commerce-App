import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../core/utils/constants/sizes.dart';
import '../../../../core/utils/shimmers/shimmer.dart';
import '../../../../core/widget/Product/product_cards/product_card_horizontal.dart';
import '../../../../core/widget/texts/section_heading.dart';
import '../../../products/logic/product_controller_cubit.dart';

class TSubCategorySection extends StatelessWidget {
  final String title;
  final String subCategoryId;

  const TSubCategorySection({
    super.key,
    required this.title,
    required this.subCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductControllerCubit, ProductControllerState>(
      builder: (context, state) {
        final products = state.subCategoryProducts[subCategoryId] ?? [];
        if (state.status == ProductStatus.loading){
          return Column(
            children: [
              TShimmerEffect(height: 100, width: double.infinity),
          Gap(TSizes.spaceBtwItems),
            ],
          );

        }
        if (products.isEmpty) return const SizedBox();
        return Column(
          children: [
            TSectionHeading(title: title, showActionButton: false,),

            const Gap(TSizes.spaceBtwItems / 2),
            SizedBox(
              height: 120,

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                separatorBuilder: (_, __) => const Gap(TSizes.spaceBtwItems),
                itemBuilder: (context, index) => TProductCardHorizontal(
                  image: products[index].thumbnail ?? '',
                  title: products[index].name ?? '',
                  price: products[index].price.toString(),
                  subTitle: products[index].brand?.name ?? '',
                ),
              ),
            ),
            Gap(TSizes.spaceBtwItems),
          ],
        );
      },
    );
  }
}
