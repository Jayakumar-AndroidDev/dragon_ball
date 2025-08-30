import 'package:flutter/material.dart';

class CharacterTransformationListWidget extends StatefulWidget {
  const CharacterTransformationListWidget({super.key,required this.transformation});

  final List<String> transformation;

  @override
  State<CharacterTransformationListWidget> createState() => _CharacterTransformationListWidgetState();
}

class _CharacterTransformationListWidgetState extends State<CharacterTransformationListWidget> {
  final _listKey = GlobalKey<AnimatedListState>();
  final _items = <String>[];
  List<String> list = [];

  @override
  void initState() {
   list = widget.transformation;
    _addItemsOneByOne();
    super.initState();
  }

  Future<void> _addItemsOneByOne() async {
    for (var i = 0; i < list.length; i++) {
      await Future.delayed(const Duration(milliseconds: 250));
      _items.insert(i, list[i]);
      _listKey.currentState?.insertItem(i);
    }
  }

  @override
  Widget build(BuildContext context) {

  if(widget.transformation.isNotEmpty){
    return SizedBox(
                  height: 180,
                  child: AnimatedList(
                    key: _listKey,
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20
                    ),
                    scrollDirection: Axis.horizontal,
                    initialItemCount: _items.length,
                    itemBuilder: (context, index,animationValue) => SizedBox(
                      width: 120,
                      height: 200,
                      child: SlideTransition(
                        position: Tween(
                          begin: Offset(1, 0),
                          end: Offset.zero,
                        ).animate(animationValue),
                        child: Stack(
                          children: [
                            Center(
                              child: CustomPaint(
                                foregroundPainter: SlantedRectPainter(),
                                child: const SizedBox(width: 120, height: 180),
                              ),
                            ),
                            Positioned.fill(
                              child: Image.network(
                                _items[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );} return const SizedBox();
  }
}

class SlantedRectPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    Path path = Path();

    path.moveTo(width * 0.2, 0);
    path.lineTo(width, 0);
    path.lineTo(width * 0.8, height);
    path.lineTo(0, height);
    path.close();

    canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}