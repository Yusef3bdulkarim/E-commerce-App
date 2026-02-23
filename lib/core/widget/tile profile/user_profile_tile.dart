import 'package:ecommerceapp/core/utils/constants/colors.dart';

import 'package:ecommerceapp/core/widget/images/circle_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import '../../utils/helpers/imageProvider.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final user = state.user;

        return ListTile(
          leading: TCircleImage(
            imageProvider:getDisplayImage(state, user),
            width: 60,
            height: 60,
            padding: 0,

          ),
          title: Text(
            user != null
                ? '${user.firstName} ${user.lastName}'
                : 'Coding with T',
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.white),
          ),
          subtitle: Text(
            user?.email ?? 'Support@coding',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white, overflow: TextOverflow.ellipsis),
          ),
          trailing: IconButton(
            onPressed: onPressed,
            icon: Icon(Iconsax.edit, color: TColors.white),
          ),
        );
      },
    );
  }
}