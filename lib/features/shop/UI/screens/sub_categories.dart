import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/Product/product_cards/product_card_horizontal.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/images/rounded_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../core/service_git_it/service_locator.dart';
import '../../../../core/utils/shimmers/shimmer.dart';
import '../../../products/data/models/product_model.dart';
import '../../../products/data/repo/product_repo.dart';
import '../../../products/logic/product_controller_cubit.dart';
import '../../data/models/Category/model_category.dart';
import '../../logic/category controller/category_cubit.dart';
import '../widgets/sub_category_section.dart';

class SubCategories extends StatefulWidget {
  const SubCategories({super.key});

  @override
  State<SubCategories> createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  late ModelCategory category;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    category = ModalRoute.of(context)!.settings.arguments as ModelCategory;
    context.read<CategoryCubit>().fetchSubCategories(category.id);
    context.read<ProductControllerCubit>().fetchProductsForCategory(
      category.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      body: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state.status == CategoryStatus.loading)
            return TShimmerEffect(height: 100, width: double.infinity);

          for (var subCat in state.subCategories) {
            if (!(context
                .read<ProductControllerCubit>()
                .state
                .subCategoryProducts
                .containsKey(subCat.id))) {
              context
                  .read<ProductControllerCubit>()
                  .fetchProductsForSubCategory(subCat.id);
            }
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                TRoundedImage(
                  imageUrl: category.banner.isNotEmpty
                      ? category.banner
                      : TImages.banner2,
                  width: double.infinity,
                  applyImageRadius: true,
                ),
                const Gap(TSizes.spaceBtwSections),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.subCategories.length,
                  itemBuilder: (context, index) {
                    return TSubCategorySection(
                      title: state.subCategories[index].id,
                      subCategoryId: state.subCategories[index].id,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
