
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class CharacterDescriptionWidget extends StatefulWidget {
  const CharacterDescriptionWidget({super.key, required this.description,});

  final String description;

  @override
  State<CharacterDescriptionWidget> createState() =>
      _CharacterDescriptionWidgetState();
}

class _CharacterDescriptionWidgetState
    extends State<CharacterDescriptionWidget> with TickerProviderStateMixin {

  late AnimationController _slideAnimationController;
  late Animation<Offset> _slideValue;

  late AnimationController _fadeAnimationController;
  late Animation<double> _fadeValue;

  @override
  void initState() {
    _slideAnimationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _slideValue = Tween(begin: Offset(0, 0.10),end:  Offset.zero).animate(_slideAnimationController);

    _fadeAnimationController = AnimationController(vsync: this,duration: const Duration(seconds: 1));
    _fadeValue = Tween(begin: 0.0,end:  1.0).animate(_fadeAnimationController);

    _slideAnimationController.forward();
    _fadeAnimationController.forward();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _slideValue,
      child: FadeTransition(
        opacity: _fadeValue,
        child: ReadMoreText(
          widget.description,
          trimLines: 5,
          style: TextStyle(fontFamily: 'mozila', color: Colors.white),
          moreStyle: Theme.of(context).textTheme.bodySmall,
          lessStyle: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }
}
