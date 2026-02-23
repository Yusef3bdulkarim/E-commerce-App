import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit(this.authRepo) : super(AuthInitial());
  Stream<User?> get authStateChanges => authRepo.authStateChanges;
  Future<void> signOut() async {
    try {
      emit(AuthLoading());
      await authRepo.signOut();
      emit(AuthSignedOut());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
