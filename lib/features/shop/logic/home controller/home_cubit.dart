import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/core/service_git_it/service_locator.dart';
import 'package:ecommerceapp/features/shop/data/models/banner_model/banner_model.dart';
import 'package:ecommerceapp/features/shop/data/repo/repo_shop.dart';
import 'package:equatable/equatable.dart';
import 'dart:async'; // <--- ضيف السطر ده هنا

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final repo = getIt<RepoShop>();
  StreamSubscription? x;

  HomeCubit() : super(HomeState()) {
    getAllBanner();
  }

  void getAllBanner() {
    x?.cancel();
    x = repo.getAllBannerStream().listen((bannerList) {
      emit(state.copyWith(banner: bannerList));
    });
  }

  void updatePageIndicator(int index) =>
      emit(state.copyWith(carousalCurrentIndex: index));

  @override
  Future<void> close() {
    x?.cancel();
    return super.close();
  }
}
