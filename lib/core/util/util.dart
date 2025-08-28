import 'package:flutter/cupertino.dart';

class Util {
 static Widget widthSpace(double width) => SizedBox(width: width,);
 static Widget heightSpace(double height) => SizedBox(height: height,);
 static double heightPercentageSpace(BuildContext context,{required double height}) => MediaQuery.of(context).size.height * height;
 static double widthPercentageSpace(BuildContext context,{required double width}) => MediaQuery.of(context).size.width * width;
}