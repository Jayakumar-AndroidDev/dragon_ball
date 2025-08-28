import 'package:dragon_ball_app/feature/get_character_detail/domain/entity/character_entity.dart';

abstract class GetCharacterRepository {

  Future<CharacterEntity> getCharacter(String characterId);

}