import 'package:ecommerceapp/app.dart';

import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:ecommerceapp/features/shop/logic/cubit/home_cubit.dart';
import 'package:ecommerceapp/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تأكد من أن Firebase يتم تشغيله بعد السطر السابق
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NetworkManagerCubit>(
          create: (context) => NetworkManagerCubit(),
        ),
        BlocProvider<HomeCubit>(create: (context) => HomeCubit()),
        BlocProvider<NavBarCubit>(create: (context) => NavBarCubit()),
      ],
      child: const MyApp(),
    ),
  );
}
