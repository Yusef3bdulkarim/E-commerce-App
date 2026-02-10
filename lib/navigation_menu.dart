import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
import 'package:ecommerceapp/features/personalization/UI/screens/settings_screen.dart';
import 'package:ecommerceapp/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:ecommerceapp/features/shop/UI/screens/home_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/store_screen.dart';
import 'package:ecommerceapp/features/shop/UI/screens/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, dynamic>(
      builder: (context, state) {
        final dark = THelperFunctions.isDarkMode(context);
        final cubit = context.read<NavBarCubit>();
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            backgroundColor: dark ? TColors.black : TColors.white,
            height: 80,
            elevation: 0,
            selectedIndex: state,
            onDestinationSelected: (val) => cubit.changeIndex(val),
            indicatorColor: TColors.primary.withOpacity(0.2),
            destinations: [
              NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
              NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
              NavigationDestination(
                icon: Icon(Iconsax.heart),
                label: 'Wishlist',
              ),
              NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
            ],
          ),
          body: cubit.screens[state],
        );
      },
    );
  }
}

class NavBarCubit extends Cubit<dynamic> {
  NavBarCubit() : super(0);

  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    SettingsScreen(),
  ];
  void changeIndex(int index) => emit(index);
}
