import 'package:flutter/widgets.dart';

class OnBoardBgImageWidget extends StatelessWidget {
  const OnBoardBgImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
            child: Image.asset(
              'assets/image/onboard_bg_img.jpg',
              gaplessPlayback: true,
              fit: BoxFit.cover,
            ),
          );
  }
}