import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  const NetworkErrorWidget({super.key,required this.onTap,});

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Image.asset(
            'assets/image/connection_lost_img.gif',
            fit: BoxFit.cover,
            width: 150,
            height: 150,
          ),
        ),
        Util.heightSpace(10),
        Text("Please check your internet connection!",style: TextStyle(
                fontFamily: "mozila",
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.whiteColor,
              ),),
        Util.heightSpace(10),
        SizedBox(
          height: 35,
          child: ElevatedButton(
            onPressed: onTap,
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(AppColors.customSwitchColor),
            ),
            child: Text(
              "Retry...!",
              style: TextStyle(
                fontFamily: "mozila",
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: AppColors.whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
