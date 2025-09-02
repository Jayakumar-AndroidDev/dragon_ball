import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/core/local_storage/shared_pref.dart';
import 'package:flutter/material.dart';

class GetStartBtnWidget extends StatelessWidget {
  const GetStartBtnWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SharedPref.setIsFirstUser(false);
        Navigator.of(context).pushReplacementNamed(AppRoute.homePage);
      },
      child: Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      )
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
    );
  }
}