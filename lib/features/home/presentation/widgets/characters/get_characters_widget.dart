import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/app_text/app_text.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:dragon_ball_app/features/home/presentation/provider/get_characters_provider.dart';
import 'package:dragon_ball_app/features/home/presentation/widgets/characters/character_list_item.dart';
import 'package:dragon_ball_app/shared_widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GetCharactersWidget extends ConsumerStatefulWidget {
  const GetCharactersWidget({super.key, required this.listOfCharacter, required this.hasMore,});

  final List<CharactersEntity> listOfCharacter;
  final bool hasMore;

  @override
  ConsumerState<GetCharactersWidget> createState() =>
      _GetCharactersWidgetState();
}

class _GetCharactersWidgetState extends ConsumerState<GetCharactersWidget>
    with SingleTickerProviderStateMixin {
  int pageNumber = 1;
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(viewportFraction: 0.65);

    _pageController.addListener(() {
      if (_pageController.position.pixels ==
          _pageController.position.maxScrollExtent) {
        int pageNumberLocalVar = pageNumber + 1;
        ref.read(getCharactersProvider.notifier).changePage(pageNumberLocalVar.toString());
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
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
            itemCount: widget.listOfCharacter.length + 1,
            itemBuilder: (context, index) {
              double scale = _currentIndex == index ? 1.0 : 0.8;

              return TweenAnimationBuilder(
                duration: const Duration(milliseconds: 500),
                tween: Tween(begin: scale, end: scale),
                curve: Curves.bounceOut,
                child: index < widget.listOfCharacter.length
                    ? CharacterListItem(
                        charactersEntity: widget.listOfCharacter[index],
                        listSize: widget.listOfCharacter.length,
                        itemIndex: index,
                      )
                    : Padding(
                        padding: EdgeInsets.only(
                          top: Util.heightPercentageSpace(
                            context,
                            height: 0.16,
                          ),
                        ),
                        child: widget.hasMore ? Center(child: LoadingWidget()) :  Center(child: Text(AppText.noMoreTxt,style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColors.whiteColor),)),
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
