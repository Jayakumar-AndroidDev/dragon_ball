import 'package:flutter/material.dart';

class OnboardGradientWidget extends StatelessWidget {
  const OnboardGradientWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                  colors: [
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black,
                  ],
                ),
              ),
            ),
          );
  }
}