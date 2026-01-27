part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final int currentPage;
  final int totalPages;

  const AuthState({required this.currentPage, required this.totalPages});

  bool get isLastPage => currentPage == totalPages - 1;

  AuthState copyWith({int? currentPage, int? totalPages}) {
    return AuthState(
      currentPage: currentPage ?? this.currentPage,
      totalPages: totalPages ?? this.totalPages,
    );
  }

  @override
  List<Object> get props => [currentPage, totalPages, isLastPage];
}
