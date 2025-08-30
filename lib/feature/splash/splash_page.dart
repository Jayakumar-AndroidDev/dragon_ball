import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin{

  late AnimationController _fadeController;
  late Animation<double> _fadeValue;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppRoute.onboardPage);
      }
    });

    _fadeController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _fadeValue = Tween<double>(begin: 0.10, end: 1.0).animate(_fadeController);

    _fadeController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeTransition(
          opacity: _fadeValue,
          child: Image.asset('assets/image/dragon_ball_title_img.png',width: 150,
          height: 150,),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}
