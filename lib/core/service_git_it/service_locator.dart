import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:ecommerceapp/features/shop/logic/cubit/home_cubit.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../features/authentication/logic/cubit/auth_cubit.dart';
import '../../features/authentication/data/repo/auth_repo.dart';
import '../../features/personalization/data/repo/profile_repo.dart';
import '../../features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import '../utils/network/network_managed_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepo());
  getIt.registerLazySingleton<NetworkManagerCubit>(() => NetworkManagerCubit());
  getIt.registerLazySingleton<HomeCubit>(() => HomeCubit());
  getIt.registerLazySingleton<OnboardingCubit>(() => OnboardingCubit());
  getIt.registerLazySingleton<ForgetPasswordCubit>(() => ForgetPasswordCubit());
  getIt.registerLazySingleton<LoginPasswordCubit>(() => LoginPasswordCubit());
  getIt.registerLazySingleton<RegisterCubit>(() => RegisterCubit());
  getIt.registerLazySingleton<NavBarCubit>(() => NavBarCubit());
  getIt.registerLazySingleton<ProfileCubit>(() => ProfileCubit());
  getIt.registerLazySingleton<AuthCubit>(() => AuthCubit(getIt<AuthRepo>()));
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(()=>GoogleSignIn.standard());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());


  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton(() => NetworkCubit());
}
