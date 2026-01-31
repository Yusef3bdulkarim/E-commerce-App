part of 'home_cubit.dart';

class HomeState extends Equatable {
  HomeState({this.carousalCurrentIndex = 0});
  final int carousalCurrentIndex;
  @override
  List<Object> get props => [carousalCurrentIndex];
}

final class HomeInitial extends HomeState {}
