import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/sizes.dart';
import 'package:ecommerceapp/core/utils/helpers/imageProvider.dart';
import 'package:ecommerceapp/core/utils/popups/exports.dart';
import 'package:ecommerceapp/core/widget/appbar/appbar.dart';
import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:ecommerceapp/core/widget/texts/section_heading.dart';
import 'package:ecommerceapp/features/personalization/UI/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/routes/routing_helper.dart';
import '../../../authentication/data/models/auth_model.dart';
import '../../../authentication/logic/cubit/auth_cubit.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(title: Text('Profile'), showBackArrow: true),
      body: BlocListener<ProfileCubit, ProfileState>(
        listenWhen: (prev, curr) =>
            prev.getUserStatus != curr.getUserStatus &&
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
        },
        child: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            print("ProfileState user: ${state.user}");
            if (state.getUserStatus == RequestStatus.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.user == null) {
              return const SizedBox();
            }

            final user = state.user!;

            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [

                          TCircleImage(
                            imageProvider:getDisplayImage(state, user),
                            width: 100,
                            height: 100,
                            padding: 0,
                          ),
                          TextButton(
                            onPressed: () =>
                                context.read<ProfileCubit>().pickAndUploadImage(),
                            child: Text('Change Profile Picture'),
                          ),
                        ],
                      ),
                    ),
                    Gap(TSizes.spaceBtwItems / 2),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    TSectionHeading(
                      title: "Profile information",
                      showActionButton: false,
                    ),
                    Gap(TSizes.spaceBtwItems),
                    TProfileMenu(
                      onTap: () {},
                      title: "name",
                      value: "${user.firstName} ${user.lastName}",
                    ),
                    TProfileMenu(
                      onTap: () {},
                      title: "UserName",
                      value: user.userName,
                    ),
                    Gap(TSizes.spaceBtwItems),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    TSectionHeading(
                      title: "Personal information",
                      showActionButton: false,
                    ),
                    Gap(TSizes.spaceBtwItems),
                    TProfileMenu(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: user.id)).then((
                          _,
                        ) {
                          TLoaders.successSnackBar(
                            context: context,
                            title: "Copied!",
                            message: "User ID copied to clipboard!",
                          );
                        });
                      },
                      title: "User ID",
                      value: user.id,
                      icons: Iconsax.copy,
                    ),
                    TProfileMenu(
                      onTap: () {},
                      title: "E-Mail",
                      value: user.email,
                    ),
                    TProfileMenu(
                      onTap: () {},
                      title: "Phone Numbers",
                      value: user.phoneNumber,
                    ),
                    TProfileMenu(onTap: () {}, title: "Gender", value: 'Male'),
                    Divider(),
                    Gap(TSizes.spaceBtwItems),
                    Center(
                      child: TextButton(
                        onPressed: () {
                          context.read<AuthCubit>().signOut();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            RoutingHelper.authenticationWrapper,
                            (route) => false,
                          );
                        },
                        child: Text(
                          "Close Account",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

