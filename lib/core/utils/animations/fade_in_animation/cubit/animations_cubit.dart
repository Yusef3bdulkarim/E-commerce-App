import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'animations_state.dart';

class AnimationsCubit extends Cubit<AnimationsState> {
  AnimationsCubit() : super(AnimationsInitial());

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));
    emit(AnimationActive());
    await Future.delayed(Duration(milliseconds: 3000));
    emit(AnimationComplate());
    await Future.delayed(Duration(milliseconds: 2000));
    emit(NavigateToWelcome());
  }

  void animationIn() async {
    await Future.delayed(const Duration(milliseconds: 500));
    emit(AnimationActive());
  }

  void animationOut() {
    emit(AnimationComplate());
  }
}
