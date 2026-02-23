import 'package:ecommerceapp/features/authentication/UI/screens/sign_in_screen.dart';
import 'package:ecommerceapp/features/authentication/UI/screens/verify_email.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/authentication/logic/cubit/auth_cubit.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSignedOut) {
          return SignInScreen();
        }
        return StreamBuilder(
          stream: context.read<AuthCubit>().authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }
            if (snapshot.hasData) {
              final user = snapshot.data!;
              if (!user.emailVerified) return VerifyEmail(email: user.email);
              return const NavigationMenu();
            }
            return SignInScreen();
          },
        );
      },
    );
  }
}
