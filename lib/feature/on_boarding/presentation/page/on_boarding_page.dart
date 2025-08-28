import 'package:dragon_ball_app/feature/on_boarding/presentation/widget/onboard_bg_image_widget.dart';
import 'package:dragon_ball_app/feature/on_boarding/presentation/widget/onboard_gradient_widget.dart';
import 'package:dragon_ball_app/feature/on_boarding/presentation/widget/onboard_text_content_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OnBoardBgImageWidget(),
          OnboardGradientWidget(),
          OnboardTextContentWidget(),
        ],
      ),
    );
  }
}
