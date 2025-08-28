import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/feature/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/feature/home/presentation/widgets/characters/character_list_item.dart';
import 'package:flutter/material.dart';

class GetCharactersWidget extends StatefulWidget {
  const GetCharactersWidget({super.key, required this.listOfCharacter,});

  final List<CharactersEntity> listOfCharacter;

  @override
  State<GetCharactersWidget> createState() => _GetCharactersWidgetState();
}

class _GetCharactersWidgetState extends State<GetCharactersWidget>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;
  

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.65);
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return 

          Positioned.fill(
            child: Center(
              child: SizedBox(
                height: Util.heightPercentageSpace(context, height: 0.60),
                child: PageView.builder(
                  controller: _pageController,
                  physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  onPageChanged: (value) {
                    setState(() {
                      _currentIndex = value;
                    });
                  },
                  itemCount: widget.listOfCharacter.length,
                  itemBuilder: (context, index) {
                    double scale = _currentIndex == index ? 1.0 : 0.8;
                    return TweenAnimationBuilder(
                      duration: const Duration(milliseconds: 500),
                      tween: Tween(begin: scale, end: scale),
                      curve: Curves.bounceOut,
                      child: CharacterListItem(
                        charactersEntity: widget.listOfCharacter[index],
                      ),
                      builder: (context, value, child) {
                        return Transform.scale(scale: value, child: child!);
                      },
                    );
                  },
                ),
              ),
            ),
          );
        
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
