import 'package:dragon_ball_app/feature/get_character_detail/presentation/page/character_detail_page.dart';
import 'package:dragon_ball_app/feature/home/presentation/widgets/drawer/drawer_widget.dart';
import 'package:dragon_ball_app/feature/home/presentation/page/home_page.dart';
import 'package:dragon_ball_app/feature/on_boarding/presentation/page/on_boarding_page.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const String onboardPage = '/onBoardPage';
  static const String homePage = '/homePage';
  static const String drawerPage = '/drawerPage';
  static const String characterDetailPage = '/characterDetailPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case onboardPage:
        {
          return MaterialPageRoute(builder: (context) => OnBoardingPage());
        }
      case drawerPage:
        {
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                DrawerPage(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  const Offset begin = Offset(-1.0, 0.0);
                  const Offset end = Offset.zero;
                  const curve = Curves.ease;

                  final tween = Tween(
                    begin: begin,
                    end: end,
                  ).chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
          );
        }

      case homePage:
        {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

      case characterDetailPage:
        {
          String characterId = setting.arguments as String;
          return MaterialPageRoute(builder: (context) => CharacterDetailPage(characterId: characterId),);
        }
      default:
        {
          return MaterialPageRoute(builder: (context) => OnBoardingPage());
        }
    }
  }
}
