import 'package:ecommerceapp/app.dart';
import 'package:ecommerceapp/core/routes/routing_helper.dart';

import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:ecommerceapp/features/shop/logic/cubit/home_cubit.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/service_git_it/service_locator.dart';
import 'core/utils/helpers/shared_prefrence.dart';
import 'features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupServiceLocator();
  await TSharedPreferences.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  final currentUser = FirebaseAuth.instance.currentUser;
  String initialroute;
  if (currentUser == null) {
    initialroute = RoutingHelper.signInScreen;
  } else if (!currentUser.emailVerified) {
    initialroute = RoutingHelper.verifyEmailScreen;
  } else {
    initialroute = RoutingHelper.NavigationScreen;
  }
  RoutingHelper.NavigationScreen;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<NetworkManagerCubit>()),
        BlocProvider(create: (context) => getIt<HomeCubit>()),
        BlocProvider(create: (context) => getIt<NavBarCubit>()),
        BlocProvider(create: (context) => getIt<OnboardingCubit>()),
        BlocProvider(create: (context) => getIt<LoginPasswordCubit>()),
        BlocProvider(create: (context) => getIt<RegisterCubit>()),
        BlocProvider(create: (context) => getIt<ProfileCubit>()),
        BlocProvider(create: (context) => getIt<ForgetPasswordCubit>()),
        BlocProvider(create: (context) => getIt<ForgetPasswordCubit>()),
        BlocProvider(create: (context) => getIt<AuthCubit>()),
      ],
      child: MyApp(initialRoute: initialroute),
    ),
  );
}
