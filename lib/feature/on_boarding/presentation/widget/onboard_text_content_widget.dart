import 'package:dragon_ball_app/core/app_text/app_text.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/feature/on_boarding/presentation/widget/get_start_btn_widget.dart';
import 'package:flutter/material.dart';

class OnboardTextContentWidget extends StatefulWidget {
  const OnboardTextContentWidget({super.key});

  @override
  State<OnboardTextContentWidget> createState() =>
      _OnboardTextContentWidgetState();
}

class _OnboardTextContentWidgetState extends State<OnboardTextContentWidget>
    with TickerProviderStateMixin {
  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeValue;

  late AnimationController _titleSlideController;
  late Animation<Offset> _titleSlideValue;
  late Animation<Offset> _descriptionSlideValue;
  late Animation<Offset> _btnSlideValue;

  @override
  void initState() {
    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _fadeValue = Tween<double>(
      begin: 0.10,
      end: 1,
    ).animate(_fadeAnimationController);

    _titleSlideController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _titleSlideValue = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(_titleSlideController);
    _descriptionSlideValue = Tween<Offset>(
      begin: Offset(0, 1),
      end: Offset(0, 0),
    ).animate(_titleSlideController);

    _btnSlideValue = Tween<Offset>(
      begin: Offset(1, 0),
      end: Offset(0, 0),
    ).animate(_titleSlideController);

    _fadeAnimationController.forward();
    _titleSlideController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: Util.heightPercentageSpace(context, height: 0.10),
      left: Util.widthPercentageSpace(context, width: 0.08),
      right: Util.widthPercentageSpace(context, width: 0.08),
      child: FadeTransition(
        opacity: _fadeValue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SlideTransition(
              position: _titleSlideValue,
              child: Text(
                AppText.onboardingTitle,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: 23,
                ),
              ),
            ),

            Util.heightSpace(10),
            SlideTransition(
              position: _descriptionSlideValue,
              child: Text(
                AppText.onboardingDescription,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  
                  fontSize: 13.5,
                ),
              ),
            ),
            Util.heightSpace(20),
            SlideTransition(
              position: _btnSlideValue,
              child: GetStartBtnWidget(),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeAnimationController.dispose();
    super.dispose();
  }
}
