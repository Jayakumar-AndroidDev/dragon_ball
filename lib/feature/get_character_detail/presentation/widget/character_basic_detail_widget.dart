import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/feature/get_character_detail/presentation/widget/title_value_widget.dart';
import 'package:flutter/material.dart';

class CharacterBasicDetailWidget extends StatefulWidget {
  const CharacterBasicDetailWidget({
    super.key,
    required this.name,
    required this.image,
    required this.ki,
    required this.maxKi,
    required this.race,
    required this.gender,
    required this.planet,
    required this.affiliation,
  });

  final String name;
  final String image;
  final String ki;
  final String maxKi;
  final String race;
  final String gender;
  final String planet;
  final String affiliation;

  @override
  State<CharacterBasicDetailWidget> createState() =>
      _CharacterBasicDetailWidgetState();
}

class _CharacterBasicDetailWidgetState extends State<CharacterBasicDetailWidget>
    with TickerProviderStateMixin {
  late List<AnimationController> slideDetailControllers;
  late List<Animation<Offset>> slideDetailValues;

  late AnimationController slideImageControllers;
  late Animation<Offset> slideImageValues;

  @override
  void initState() {
    slideDetailControllers = [];
    slideDetailValues = [];

    slideImageControllers = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    slideImageValues = Tween(
      begin: Offset(5, 0),
      end: Offset.zero,
    ).animate(slideImageControllers);

    for (var i = 0; i <= 5; i++) {
      slideDetailControllers.add(
        AnimationController(vsync: this, duration: Duration(milliseconds: 500)),
      );
      slideDetailValues.add(
        Tween(
          begin: Offset(0, -1.toDouble()),
          end: Offset.zero,
        ).animate(slideDetailControllers[i]),
      );
    }

    for (var i = 0; i <= 5; i++) {
      slideDetailControllers[i].forward();
    }

    slideImageControllers.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 13,
          children: [
            SlideTransition(
              position: slideDetailValues[0],
              child: TitleValueWidget(title: "Name", value: widget.name),
            ),
            SlideTransition(
              position: slideDetailValues[1],
              child: TitleValueWidget(title: "Ki", value: widget.ki),
            ),
            SlideTransition(
              position: slideDetailValues[2],
              child: TitleValueWidget(title: "Max Ki", value: widget.maxKi),
            ),
            SlideTransition(
              position: slideDetailValues[3],
              child: TitleValueWidget(
                title: "Race - Gender",
                value: "${widget.race} - ${widget.gender}",
              ),
            ),
            SlideTransition(
              position: slideDetailValues[4],
              child: TitleValueWidget(title: "Planet", value: widget.planet),
            ),
            SlideTransition(
              position: slideDetailValues[5],
              child: TitleValueWidget(title: "Affiliation", value: widget.affiliation),
            ),
          ],
        ),

        SlideTransition(
          position: slideImageValues,
          child: SizedBox(
            width: Util.widthPercentageSpace(context, width: 0.45),
            height: Util.heightPercentageSpace(context, height: 0.5),
            child: Image.network(
              widget.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
