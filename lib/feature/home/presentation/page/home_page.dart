import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/feature/home/presentation/provider/get_characters_provider.dart';
import 'package:dragon_ball_app/feature/home/presentation/widgets/characters/get_characters_widget.dart';
import 'package:dragon_ball_app/shared_widgets/internet_fail_page.dart';
import 'package:dragon_ball_app/shared_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _scaleAnimationController;
  late Animation<double> _scaleAnimationValue;

  @override
  void initState() {
    _scaleAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _scaleAnimationValue = Tween(
      begin: 50.0,
      end: 1.0,
    ).animate(_scaleAnimationController);
    _scaleAnimationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InternetFailPage(
        
      onFailure: () {
        
      },
      onSuccess: () {
        
      },
      childWidget: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              bottom: false,
              child: ScaleTransition(
                scale: _scaleAnimationValue,
                child: Image.asset(
                  'assets/image/dragon_ball_title_img.png',
                  width: 160,
                  height: 160,
                ),
              ),
            ),
          ),

          Positioned(
            top: 62,
            left: 30,
            child: SafeArea(
              bottom: false,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AppRoute.drawerPage);
                },
                child: SvgPicture.asset(
                  'assets/icon/icon_drawer.svg',
                  width: 25,
                  height: 25,
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -100,
            right: -100,
            child: Opacity(
              opacity: 0.5,
              child: Image.asset(
                'assets/image/dragon_ball_img_1.png',
                width: 350,
                height: 350,
              ),
            ),
          ),

          Consumer(
            builder: (context, ref, child) {
              final response = ref.watch(getCharactersProvider);

             return response.when(
                data: (data) {
                  return GetCharactersWidget(
                    listOfCharacter: data,
                  );
                },
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => Center(child: LoadingWidget()),
              );
            },
          ),
        ],
      ),
    );
  }
}
