import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/onboarding_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/sign_in_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("Page not found"))),
        );
    }
  }
}
