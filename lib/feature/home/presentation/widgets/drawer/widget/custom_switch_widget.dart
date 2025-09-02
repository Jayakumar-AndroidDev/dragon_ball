import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/local_storage/shared_pref.dart';
import 'package:flutter/material.dart';

class CustomSwitchWidget extends StatefulWidget {
  const CustomSwitchWidget({super.key, required this.onChange,});

  final Function(bool isOn) onChange;

  @override
  State<CustomSwitchWidget> createState() => _CustomSwitchWidgetState();
}

class _CustomSwitchWidgetState extends State<CustomSwitchWidget> {
  bool _isOn = false;

  @override
  void initState() {
    _isOn = SharedPref.getIsLightTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        setState(() {
          _isOn = !_isOn;
          SharedPref.setIsLightTheme(_isOn);
          widget.onChange(_isOn);
        });
      },
      child: AnimatedContainer(
        width: 40,
        height: 18,
        duration: Duration(milliseconds: 100),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey.shade500),
          color: _isOn ? AppColors.customSwitchColor : Colors.transparent,
          borderRadius: BorderRadius.circular(90),
        ),
        child: AnimatedAlign(
          alignment: _isOn ? Alignment.centerRight : Alignment.centerLeft,
          duration: Duration(milliseconds: 100),
          child: Container(
            width: 15,
            height: 18,
            margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _isOn ? AppColors.bgColor : AppColors.customSwitchColor,
            ),
          ),
        ),
      ),
    );
  }
}
