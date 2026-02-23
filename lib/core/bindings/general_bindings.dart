//

//
// class GeneralBindings extends Bindings {
//   @override
//   void dependencies() {
//     /// -- Core
//     Get.put(NetworkManager());
//
//     /// -- Repository
//     Get.lazyPut(() => AuthenticationRepository(), fenix: true);
//     Get.put(CartController());
//     Get.put(ThemeController());
//     Get.put(ProductController());
//     Get.lazyPut(() => UserController());
//     Get.lazyPut(() => CheckoutController());
//     Get.lazyPut(() => AddressController());
//
//     Get.lazyPut(() => OnBoardingController(), fenix: true);
//
//     Get.lazyPut(() => LoginController(), fenix: true);
//     Get.lazyPut(() => SignUpController(), fenix: true);
//     Get.lazyPut(() => OTPController(), fenix: true);
//     Get.put(TNotificationService());
//     Get.lazyPut(() => NotificationController(), fenix: true);
//   }
// }
