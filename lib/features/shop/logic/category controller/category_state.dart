part of 'category_cubit.dart';

enum CategoryStatus { initial, loading, loaded, error }

@immutable
class CategoryState extends Equatable {
  final CategoryStatus status;
  final List<ModelCategory> categories;      // الأقسام الرئيسية
  final List<ModelCategory> subCategories;
  final String? message;

  // Constructor
  const CategoryState({
    this.status = CategoryStatus.initial,
    this.categories = const [],
    this.subCategories = const [],
    this.message,
  });

  CategoryState copyWith({
    CategoryStatus? status,
    List<ModelCategory>? categories,
    List<ModelCategory>? subCategories,
    String? message,
  }) {
    return CategoryState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      subCategories: subCategories ?? this.subCategories,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, message, categories,subCategories];
}