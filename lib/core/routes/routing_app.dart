import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/forget_password.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/onboarding_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/reset_password.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/sign_in_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/sign_up_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/verify_email.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/personalization/UI/screens/add_new_address.dart';
import 'package:ecommerceapp/features/personalization/UI/screens/address_screen.dart';
import 'package:ecommerceapp/features/personalization/UI/screens/profile_screen.dart';
import 'package:ecommerceapp/features/personalization/UI/screens/settings_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/cart_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/checkout_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/home_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/product_details.dart';
import 'package:ecommerceapp/features/shop/UI/screens/product_review_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/store_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/wishlist_screen.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RoutingApp {
  Route? onGenerateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case RoutingHelper.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) {
            return BlocProvider(
              create: (_) => AuthCubit(3),
              child: OnBoardingScreen(),
            );
          },
        );
      case RoutingHelper.signInScreen:
        return MaterialPageRoute(builder: (_) => SignInScreen());
      case RoutingHelper.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case RoutingHelper.verifyEmailScreen:
        return MaterialPageRoute(builder: (_) => VerifyEmail());
      case RoutingHelper.forgetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ForgetPassword());
      case RoutingHelper.resetPasswordScreen:
        return MaterialPageRoute(builder: (_) => ResetPassword());
      case RoutingHelper.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case RoutingHelper.storeScreen:
        return MaterialPageRoute(builder: (_) => StoreScreen());
      case RoutingHelper.wishlistScreen:
        return MaterialPageRoute(builder: (_) => WishlistScreen());
      case RoutingHelper.settingsScreen:
        return MaterialPageRoute(builder: (_) => SettingsScreen());
      case RoutingHelper.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case RoutingHelper.NavigationScreen:
        return MaterialPageRoute(builder: (_) => NavigationMenu());
      case RoutingHelper.productDetailsScreen:
        return MaterialPageRoute(builder: (_) => ProductDetailsScreen());
      case RoutingHelper.productReviewScreen:
        return MaterialPageRoute(builder: (_) => ProductReviewScreen());
      case RoutingHelper.userAddressScreen:
        return MaterialPageRoute(builder: (_) => UserAddressScreen());
      case RoutingHelper.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case RoutingHelper.addNewAddressScreen:
        return MaterialPageRoute(builder: (_) => AddNewAddressScreen());
      case RoutingHelper.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
