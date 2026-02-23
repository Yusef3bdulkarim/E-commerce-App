// import 'package:ecommerceapp/core/routes/routing_helper.dart';
// import 'package:ecommerceapp/core/utils/constants/colors.dart';
// import 'package:ecommerceapp/core/utils/constants/sizes.dart';
// import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
// import 'package:ecommerceapp/core/utils/helpers/helper_functions.dart';
// import 'package:ecommerceapp/core/utils/popups/exports.dart';
// import 'package:ecommerceapp/features/authentication/logic/cubit/login_cubit/login_password_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:gap/gap.dart';
//
// import '../../../logic/cubit/auth_cubit.dart';
//
// class BtnSignin extends StatelessWidget {
//   const BtnSignin({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);
//     return BlocBuilder<LoginPasswordCubit, LoginPasswordState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   elevation: 0,
//                   shadowColor: Colors.transparent,
//                   backgroundColor: TColors.buttonPrimary,
//                   side: BorderSide(
//                     color: dark ? TColors.borderLight : TColors.borderDark,
//                     width: 1.0,
//                   ),
//                 ),
//                 onPressed: state is LoginLoading
//                     ? null
//                     : () => context.read<LoginPasswordCubit>().login(),
//                 child: state is LoginLoading
//                     ? const CircularProgressIndicator(color: Colors.white)
//                     : const Text(TTexts.tSignIn),
//               ),
//             ),
//             Gap(TSizes.spaceBtwItems),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   elevation: 0,
//                   shadowColor: Colors.transparent,
//                   backgroundColor: dark ? Colors.black : Colors.white,
//                   side: BorderSide(
//                     color: dark ? TColors.borderLight : TColors.borderDark,
//                     width: 1.0,
//                   ),
//                 ),
//                 onPressed: () {
//                   Navigator.pushNamed(context, RoutingHelper.signUpScreen);
//                 },
//                 child: Text(
//                   TTexts.tCreateAccount,
//                   style: TextStyle(
//                     color: dark ? TColors.disabledTextLight : TColors.black,
//                     fontWeight: FontWeight.bold,
//                     fontSize: TSizes.fontSizeMd,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
