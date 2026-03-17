import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'brand_controller_state.dart';

class BrandControllerCubit extends Cubit<BrandControllerState> {
  BrandControllerCubit() : super(BrandControllerInitial());
}
