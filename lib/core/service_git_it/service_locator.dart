import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/forget_password_cubit/forget_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/onboarding_cubit/onboarding_cubit.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/register_Cubit/register_cubit.dart';
import 'package:ecommerceapp/features/cart/data/repo/cart_repo.dart';
import 'package:ecommerceapp/features/cart/logic/cart_cubit.dart';
import 'package:ecommerceapp/features/checkout/data/repo/order_repo.dart';
import 'package:ecommerceapp/features/products/data/repo/product_repo.dart';
import 'package:ecommerceapp/features/products/logic/product_controller_cubit.dart';
import 'package:ecommerceapp/features/shop/data/repo/repo_shop.dart';
import 'package:ecommerceapp/features/shop/logic/category%20controller/category_cubit.dart';
import 'package:ecommerceapp/features/shop/logic/home%20controller/home_cubit.dart';
import 'package:ecommerceapp/features/wishlist_screen/data/repo/washlist_repo.dart';
import 'package:ecommerceapp/features/wishlist_screen/logic/washlist_cubit.dart';
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
  getIt.registerLazySingleton<FirebaseFirestore>(
        () => FirebaseFirestore.instance,
  );
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
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.standard());
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo());
  getIt.registerLazySingleton<RepoShop>(() => RepoShop());
  getIt.registerLazySingleton<CategoryCubit>(() => CategoryCubit());
  getIt.registerLazySingleton<ProductRepo>(() => ProductRepo());
  getIt.registerLazySingleton<CartCubit>(() => CartCubit());
  getIt.registerLazySingleton<WashlistCubit>(() => WashlistCubit());
  getIt.registerLazySingleton<WashlistRepo>(() => WashlistRepo());
  getIt.registerLazySingleton<CartRepo>(() => CartRepo());
  getIt.registerLazySingleton<OrderRepository>(() => OrderRepository());
  getIt.registerLazySingleton<ProductControllerCubit>(
    () => ProductControllerCubit(),
  );

  getIt.registerLazySingleton(() => NetworkCubit());
}
