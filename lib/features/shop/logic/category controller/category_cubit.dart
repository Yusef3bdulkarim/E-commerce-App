import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/shop/data/models/Category/model_category.dart';
import 'package:ecommerceapp/features/shop/data/repo/repo_shop.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryState());
  final repo = getIt<RepoShop>();

  Future<void> fetchHomeData() async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final categories = await repo.getAllCategories();
      emit(
        state.copyWith(categories: categories, status: CategoryStatus.loaded),
      );
    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.error, message: e.toString()));
    }
  }

  Future<void> fetchSubCategoriesProducts(String categoryId) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final subCats = await repo.getSubCategories(categoryId);
      emit(
        state.copyWith(status: CategoryStatus.loaded, subCategories: subCats),
      );

    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  Future<void> fetchSubCategories(String parentId) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final subCats = await repo.getSubCategories(parentId);
      emit(
        state.copyWith(status: CategoryStatus.loaded, subCategories: subCats),
      );
    } catch (e) {
      emit(state.copyWith(status: CategoryStatus.error, message: e.toString()));
    }
  }
}
