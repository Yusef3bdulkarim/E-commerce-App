import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/utils/shimmers/category_shimmer.dart';
import 'package:ecommerceapp/core/widget/image_text_widgets/vertical_image_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../logic/category controller/category_cubit.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({super.key});

  @override

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        if (state.status == CategoryStatus.loading) {
          return TCategoryShimmer();
        }
        if (state.status == CategoryStatus.error) {
          TLoaders.errorSnackBar(
            context: context,
            title: "Something error please try again",
            message: state.message.toString(),
          );
        }
        return SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final category = state.categories[index];

              return TVerticalImageText(
                image: category.image.isNotEmpty ? category.image : TImages.animalIcon,
                text: category.name,
                onTap: () {
                      Navigator.pushNamed(
                    context,
                    RoutingHelper.subCategoriesScreen,
                    arguments: category,
                  );
                },
              );
            },
            separatorBuilder: (context, index) => Gap(TSizes.spaceBtwItems),
            itemCount: state.categories.length,
          ),
        );
      },
    );
  }
}
