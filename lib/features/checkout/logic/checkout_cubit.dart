import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());

  void getCheckoutDetails(double productPrice, discountPercentage) {
    double discountedPrice =
        productPrice - (productPrice * (discountPercentage / 100));

    double shipping = 5.0;
    double taxRate = 0.1;
    double tax = discountedPrice * taxRate;
    double total = discountedPrice + shipping + tax;
    emit(
      state.copyWith(
        status: CheckoutStatus.loaded,
        subTotal: productPrice,
        shippingFee: shipping,
        taxFee: tax,
        totalPrice: total,
      ),
    );
  }
}
