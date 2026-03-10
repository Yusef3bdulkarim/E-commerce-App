part of 'checkout_cubit.dart';

enum CheckoutStatus { initial, loaded, error }

@immutable
 class CheckoutState {
  final CheckoutStatus status;
  final double? subTotal;
  final double? shippingFee;
  final double? taxFee;
  final double? totalPrice;

  CheckoutState({
    this.status = CheckoutStatus.initial,
    this.subTotal = 0.0,
    this.shippingFee = 0.0,
    this.taxFee = 0.0,
    this.totalPrice = 0.0
  });

  CheckoutState copyWith({
    CheckoutStatus? status,
    double? subTotal,
    double? shippingFee,
    double? taxFee,
    double? totalPrice,
  }) {
    return CheckoutState(
      status: status ?? this.status,
      subTotal: subTotal ?? this.subTotal,
      shippingFee: shippingFee ?? this.shippingFee,
      taxFee: taxFee ?? this.taxFee,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
