import 'package:ecommerceapp/core/routes/routing_app.dart';
import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/theming/theme_App.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: TThemeApp.lightThemeData,
      darkTheme: TThemeApp.darkThemeData,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: RoutingApp().onGenerateRoute,
      initialRoute: initialRoute,
    );
  }
}
