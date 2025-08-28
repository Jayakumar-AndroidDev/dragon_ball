import 'package:dragon_ball_app/core/app_color/app_colors.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/feature/get_character_detail/presentation/provider/get_character_provider.dart';
import 'package:dragon_ball_app/feature/get_character_detail/presentation/widget/character_basic_detail_widget.dart';
import 'package:dragon_ball_app/feature/get_character_detail/presentation/widget/character_description_widget.dart';
import 'package:dragon_ball_app/feature/get_character_detail/presentation/widget/character_transformation_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({super.key,required this.characterId});
 final String characterId;
  @override
  State<CharacterDetailPage> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Consumer(
            builder: (context, ref, child) {
              final character = ref.watch(getCharacterProvider(widget.characterId));

              return character.when(
                data: (data) {
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            CharacterBasicDetailWidget(
                              name: data.name ??'',
                              image: data.image ?? '',
                              ki: data.ki ?? '',
                              maxKi: data.maxKi ?? '',
                              race: data.race ?? '',
                              gender: data.gender ?? '',
                              planet: data.originPlanet ?? '',
                              affiliation: data.affiliation ?? '',
                            ),
                            CharacterDescriptionWidget(description: data.description ?? '',),
                          ],
                        ),
                      ),
                      Util.heightSpace(15),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            "Transformation",
                            style: Theme.of(
                              context,
                            ).textTheme.titleLarge!.copyWith(fontSize: 13),
                          ),
                        ),
                      ),
                      Util.heightSpace(15),
                      CharacterTransformationListWidget(
                        transformation: data.transformations ?? [],
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading: () => CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
