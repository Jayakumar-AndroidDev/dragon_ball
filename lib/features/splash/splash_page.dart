import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/core/local_storage/shared_pref.dart';
import 'package:dragon_ball_app/shared_widgets/internet_fail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeValue;
  bool isConnectionLost = false;

  @override
  void initState() {
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeValue = Tween<double>(begin: 0.10, end: 1.0).animate(_fadeController);

    _fadeController.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InternetFailPage(
      onSuccess: () {
        Future.delayed(const Duration(seconds: 2), () async {
          if (mounted) {
            bool isFirstTime = SharedPref.getIsFirstUser();

            if (isFirstTime) {
              Navigator.of(context).pushReplacementNamed(AppRoute.onboardPage);
            } else {
              Navigator.of(context).pushReplacementNamed(AppRoute.homePage);
            }
          }
        });
      },
      onFailure: () {},
      childWidget: Center(
        child: FadeTransition(
          opacity: _fadeValue,
          child: Image.asset(
            'assets/image/dragon_ball_title_img.png',
            width: 150,
            height: 150,
          ),
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
