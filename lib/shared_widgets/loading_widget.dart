import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  const LoadingWidget({super.key});

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationAnimationController;
  late Animation<double> _rotationValue;

  @override
  void initState() {
    _rotationAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
    _rotationValue = Tween(
      begin: 0.0,
      end: 5.0,
    ).animate(_rotationAnimationController);
    _rotationAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RotationTransition(
            turns: _rotationValue,
            child: Image.asset(
              'assets/image/7th_dragon_ball_img.png',
              width: 45,
              height: 45,
            ),
          ),
          Text(
            "Loading...!",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _rotationAnimationController.dispose();
    super.dispose();
  }
}
