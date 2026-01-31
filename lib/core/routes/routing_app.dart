import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/widget/success_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/forget_password.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/onboarding_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/reset_password.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/sign_in_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/sign_up_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/verify_email.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';

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
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
