import 'package:ecommerceapp/features/authentication/UI/screens/sign_in_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/verify_email.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/logic/cubit/auth_cubit.dart';
import 'features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: context.read<AuthCubit>().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final user = snapshot.data;

        if (user == null) return SignInScreen();

        final isGoogleUser = user.providerData.any((p) => p.providerId == 'google.com');

        // لو ايميل محقق أو Google user يسمح بالدخول
        if (isGoogleUser || user.emailVerified) {
          context.read<ProfileCubit>().getUserDetails();
          return const NavigationMenu();
        }

        // ايميل غير محقق
        return VerifyEmail(email: user.email);
      },
    );
  }
}