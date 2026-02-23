import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(const OnboardingState(currentPage: 0, totalPages: 3));

  void updatePageIndex(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void nextPage() {
    if (!state.isLastPage) {
      emit(
        state.copyWith(
          currentPage: state.currentPage + 1,
        ),
      );
    }
  }
}