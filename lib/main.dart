import 'package:ecommerceapp/app.dart';

import 'package:ecommerceapp/core/utils/helpers/exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<NetworkManagerCubit>(
          create: (context) => NetworkManagerCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
