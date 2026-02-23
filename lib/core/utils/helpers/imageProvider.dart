import 'package:flutter/cupertino.dart';

import '../../../features/authentication/data/models/auth_model.dart';
import '../../../features/personalization/logic/cubit/profile_cubit/profile_cubit.dart';
import '../constants/image_strings.dart';

ImageProvider getDisplayImage(ProfileState state, UserModel? user) {
  if (state.imageFile != null) {
    return FileImage(state.imageFile!); // local file
  } else if (state.imageUrl != null) {
    return NetworkImage(state.imageUrl!); // uploaded URL
  } else if (user?.imageName.isNotEmpty == true) {
    return NetworkImage(user!.imageName); // existing user image
  } else {
    return AssetImage(TImages.user); // default asset
  }
}