import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(int total) : super(AuthState(currentPage: 0, totalPages: total));

  void updatePageIndex(int index) {
    emit(state.copyWith(currentPage: index));
  }

  void nextPage() {
    emit(state.copyWith(currentPage: state.currentPage + 1));
  }
}
