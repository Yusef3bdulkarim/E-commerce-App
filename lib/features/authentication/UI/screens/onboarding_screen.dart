import 'package:ecommerceapp/core/utils/constants/image_strings.dart';
import 'package:ecommerceapp/core/utils/constants/text_strings.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/onBoarding-Widget/onboarding_Skip.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/onBoarding-Widget/onboarding_dot_navigator.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/onBoarding-Widget/onboarding_next_button.dart';
import 'package:ecommerceapp/features/authentication/UI/widgets/onBoarding-Widget/onboarding_page.dart';
import 'package:ecommerceapp/features/authentication/logic/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthCubit, AuthState>(
        listenWhen: (prev, curr) => prev.currentPage != curr.currentPage,
        listener: (context, state) {
          _pageController.animateToPage(
            state.currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },
        child: Stack(
          children: [
            PageView(
              controller: _pageController,

              onPageChanged: (index) =>
                  context.read<AuthCubit>().updatePageIndex(index),
              children: [
                OnBoardingPage(
                  image: TImages.tOnBoardingImage1,
                  title: TTexts.tOnBoardingTitle1,
                  subTitle: TTexts.tOnBoardingSubTitle1,
                ),
                OnBoardingPage(
                  image: TImages.tOnBoardingImage2,
                  title: TTexts.tOnBoardingTitle2,
                  subTitle: TTexts.tOnBoardingSubTitle2,
                ),
                OnBoardingPage(
                  image: TImages.tOnBoardingImage3,
                  title: TTexts.tOnBoardingTitle3,
                  subTitle: TTexts.tOnBoardingSubTitle3,
                ),
              ],
            ),

            OnBoardingSkip(),

            OnBoardingDotNavigation(pageController: _pageController),
            OnBoardingNextButton(),
          ],
        ),
      ),
    );
  }
}
