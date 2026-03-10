import 'package:ecommerceapp/core/routes/routing_helper.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/imageProvider.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/personalization/UI/widgets/profile_menu.dart';
import 'package:ecommerceapp/core/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import '../../logic/cubit/profile_cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    // تحميل البيانات أول ما الشاشة تتحمل
    context.read<ProfileCubit>().getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: const Text('Profile'), showBackArrow: true),
      body: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (prev, curr) =>
        prev.deleteStatus != curr.deleteStatus ||
            prev.getUserStatus != curr.getUserStatus ||
            prev.uploadStatus != curr.uploadStatus,
        listener: (context, state) {
          if (state.getUserStatus == RequestStatus.error) {
            TLoaders.errorSnackBar(
              context: context,
              title: "Something went wrong",
              message: state.message ?? "Unknown error",
            );
          }
          if (state.uploadStatus == RequestStatus.error) {
            TLoaders.errorSnackBar(
              context: context,
              title: "Upload failed",
              message: "Could not upload the profile picture.",
            );
          }
          if (state.deleteStatus == RequestStatus.success) {
            Navigator.of(context).pushNamedAndRemoveUntil(
              RoutingHelper.authenticationWrapper,
                  (route) => false,
            );
          }
          if (state.deleteStatus == RequestStatus.error) {
            TLoaders.errorSnackBar(
              context: context,
              title: "Delete Failed",
              message: state.message ?? "Something went wrong",
            );
          }
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if (state.getUserStatus == RequestStatus.loading || state.user == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final user = state.user!;

            return SingleChildScrollView(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  // الصورة من Firebase فقط
                  TCircleImage(
                    imageProvider: getDisplayImage(state, user),
                    width: 100,
                    height: 100,
                    padding: 0,
                  ),
                  TextButton(
                    onPressed: () => context.read<ProfileCubit>().pickAndUploadImage(),
                    child: const Text('Change Profile Picture'),
                  ),
                  const Gap(TSizes.spaceBtwItems),
                  const Divider(),
                  const Gap(TSizes.spaceBtwItems),
                  const TSectionHeading(title: "Profile information", showActionButton: false),
                  const Gap(TSizes.spaceBtwItems),
                  TProfileMenu(title: "Name", value: "${user.firstName} ${user.lastName}", onTap: () {}),
                  TProfileMenu(title: "UserName", value: user.userName, onTap: () {}),
                  const Gap(TSizes.spaceBtwItems),
                  const Divider(),
                  const Gap(TSizes.spaceBtwItems),
                  const TSectionHeading(title: "Personal information", showActionButton: false),
                  const Gap(TSizes.spaceBtwItems),
                  TProfileMenu(
                    title: "User ID",
                    value: user.id,
                    icons: Iconsax.copy,
                    onTap: () {
                      Clipboard.setData(ClipboardData(text: user.id));
                      TLoaders.successSnackBar(
                        context: context,
                        title: "Copied!",
                        message: "User ID copied to clipboard!",
                      );
                    },
                  ),
                  TProfileMenu(title: "E-Mail", value: user.email, onTap: () {}),
                  TProfileMenu(title: "Phone Number", value: user.phoneNumber, onTap: () {}),
                  TProfileMenu(title: "Gender", value: 'Male', onTap: () {}),
                  const Divider(),
                  const Gap(TSizes.spaceBtwItems),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        final passwordController = TextEditingController();

                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Confirm Delete"),
                            backgroundColor: TColors.grey,
                            content: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: const InputDecoration(labelText: "Enter your password"),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text("Cancel"),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  context.read<ProfileCubit>().deleteAccount(
                                    email: user.email,
                                    password: passwordController.text,
                                    isGoogle: false,
                                  );
                                },
                                child: const Text("Delete", style: TextStyle(color: Colors.red)),
                              ),
                            ],
                          ),
                        );
                      },
                      child: const Text("Close Account", style: TextStyle(color: Colors.red)),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}