part of 'home_cubit.dart';

class HomeState extends Equatable {
  final int carousalCurrentIndex;
  final List<BannerModel> banner;

  HomeState({this.carousalCurrentIndex = 0, this.banner = const[]});

  HomeState copyWith({
    int? carousalCurrentIndex,
    List<BannerModel>? banner
  }) {
    return HomeState(
        carousalCurrentIndex: carousalCurrentIndex ?? this.carousalCurrentIndex,
        banner: banner ?? this.banner
    );
  }

  @override
  List<Object> get props => [carousalCurrentIndex, banner];
}

