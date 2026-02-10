part of 'personalization_cubit.dart';

sealed class PersonalizationState extends Equatable {
  const PersonalizationState();

  @override
  List<Object> get props => [];
}

final class PersonalizationInitial extends PersonalizationState {}
