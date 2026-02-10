import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'personalization_state.dart';

class PersonalizationCubit extends Cubit<PersonalizationState> {
  PersonalizationCubit() : super(PersonalizationInitial());
}
