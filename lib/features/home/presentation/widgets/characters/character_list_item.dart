import 'package:dragon_ball_app/core/app_route/app_route.dart';
import 'package:dragon_ball_app/core/util/util.dart';
import 'package:dragon_ball_app/features/get_character_detail/presentation/provider/get_character_provider.dart';
import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterListItem extends ConsumerWidget {
  const CharacterListItem({super.key, required this.charactersEntity,});

  final CharactersEntity charactersEntity;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoute.characterDetailPage,arguments: charactersEntity.id.toString());
        ref.read(getCharacterProvider.notifier).getCharacterDetail(charactersEntity.id.toString());
      },
      child: Stack(
        children: [
          Positioned.fill(
            bottom: 0,
            left: 0,
            top: Util.heightPercentageSpace(context, height: 0.23),
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black87,
              ),
            ),
          ),
      
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              
              children: [
                Image.network(
                  charactersEntity.image ?? "",
                  width: 160,
                  height: Util.heightPercentageSpace(context, height: 0.30),
                ),
                Text(
                  "Name:",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 16),
                ),
                Text(charactersEntity.name, style: Theme.of(context).textTheme.titleMedium),
             
                Text(
                  "${charactersEntity.race ?? ""} - ${charactersEntity.gender ?? ""}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
             
                Text(
                  "Base KI:",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 16),
                ),
      
                Text(charactersEntity.ki ?? "", style: Theme.of(context).textTheme.bodySmall),
             
                Text(
                  "Max KI:",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 16),
                ),
                Text(
                 charactersEntity.maxKi ?? "",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                
                Text(
                  "Affiliate:",
                  style: Theme.of(
                    context,
                  ).textTheme.titleLarge!.copyWith(fontSize: 16),
                ),
                Text(charactersEntity.affiliation ?? "", style: Theme.of(context).textTheme.bodySmall),
      
                Util.heightSpace(15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
