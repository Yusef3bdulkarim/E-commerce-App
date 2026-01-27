part of 'animations_cubit.dart';

class AnimationsState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AnimationsInitial extends AnimationsState {}

// ignore: must_be_immutable
final class AnimationActive extends AnimationsState {}

// fade_in_animation_state.dart
class NavigateToWelcome extends AnimationsState {} // حالة التنقل

final class AnimationComplate extends AnimationsState {}
