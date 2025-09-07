import 'package:dragon_ball_app/features/home/domain/entity/characters_entity.dart';

class CharacterState {
  List<CharactersEntity> list;
  bool hasMore;

  CharacterState({required this.list, required this.hasMore,});
}