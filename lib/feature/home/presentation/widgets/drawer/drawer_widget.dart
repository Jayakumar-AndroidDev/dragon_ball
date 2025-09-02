import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/extension/theme_state_extension.dart';
import 'package:dragon_ball_app/feature/home/presentation/widgets/drawer/widget/custom_switch_widget.dart';
import 'package:dragon_ball_app/provider/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawerPage extends ConsumerStatefulWidget {
  const DrawerPage({super.key});

  @override
  ConsumerState<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends ConsumerState<DrawerPage> with TickerProviderStateMixin {
  List<String> drawerList = ["Characters", "Planets", "Dark Theme"];
  late List<AnimationController> _slideAnimationController;
  late List<Animation<Offset>> _slideAnimationValue;

  @override
  void initState() {
    _slideAnimationController = [];
    _slideAnimationValue = [];

    for (var i = 0; i <= drawerList.length - 1; i++) {
      _slideAnimationController.add(
        AnimationController(vsync: this, duration: Duration(milliseconds: 350)),
      );
    }

    for (var i = 0; i <= drawerList.length - 1; i++) {
      _slideAnimationValue.add(
        Tween<Offset>(
          begin: Offset(0, -1),
          end: Offset.zero,
        ).animate(_slideAnimationController[i]),
      );
    }

    for (var i = 0; i <= drawerList.length - 1; i++) {
      _slideAnimationController[i].forward();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: SvgPicture.asset(
                    "assets/icon/icon_close.svg",
                    width: 18,
                    height: 18,
                    colorFilter: ColorFilter.mode(context.isLightThem ? Colors.white : AppColors.darkTextColor , BlendMode.srcIn),
                  ),
                ),
                Image.asset(
                  'assets/image/dragon_ball_title_img.png',
                  width: 160,
                  height: 160,
                ),
                const SizedBox(width: 18, height: 18),
              ],
            ),
          ),

          for (var (index, item) in drawerList.indexed) ...[
            SlideTransition(
              position: _slideAnimationValue[index],
              child: Padding(
                padding: EdgeInsets.only(
                  top: index == 0 ? 0 : 40,
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          item,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: 15,),
                        ),

                        if (item != "Dark Theme") ...[
                          SvgPicture.asset(
                            'assets/icon/icon_next.svg',
                            width: 14,
                            height: 14,
                            colorFilter: ColorFilter.mode(
                              context.isLightThem ? AppColors.darkBgColor : AppColors.darkTextColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ],

                        if (item == 'Dark Theme') ...[
                          CustomSwitchWidget(
                            onChange: (isOn) {
                                ref.read(themeProvider.notifier).changeTheme(isOn);
                            },
                          ),
                        ],
                      ],
                    ),
                    Util.heightSpace(10),
                    Container(
                      width: double.maxFinite,

                      height: 1,

                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
