import 'package:dragon_ball_app/features/get_character_detail/domain/entity/character_entity.dart';
import 'package:result_dart/result_dart.dart';

abstract class GetCharacterRepository {

  Future<Result<CharacterEntity>> getCharacter(String characterId);

}