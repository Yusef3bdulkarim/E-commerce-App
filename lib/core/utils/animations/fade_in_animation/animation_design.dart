import 'package:ecommerceapp/core/utils/animations/fade_in_animation/cubit/animations_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'fade_in_animation_model.dart';

class TFadeInAnimation extends StatelessWidget {
  TFadeInAnimation({
    super.key,
    required this.durationInMs,
    required this.child,
    this.animate,
  });

  final int durationInMs;
  final TAnimatePosition? animate;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimationsCubit, AnimationsState>(
      builder: (context, state) {
        final isAnimated = state is AnimationActive;
        return AnimatedPositioned(
          duration: Duration(milliseconds: durationInMs),
          top: isAnimated ? animate!.topAfter : animate!.topBefore,
          left: isAnimated ? animate!.leftAfter : animate!.leftBefore,
          bottom: isAnimated ? animate!.bottomAfter : animate!.bottomBefore,
          right: isAnimated ? animate!.rightAfter : animate!.rightBefore,

          child: AnimatedOpacity(
            duration: Duration(milliseconds: durationInMs),
            opacity: isAnimated ? 1 : 0,
            child: child,
          ),
        );
      },
    );
  }
}
