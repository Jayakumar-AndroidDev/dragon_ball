import 'package:dragon_ball_app/features/get_character_detail/data/data_source/get_character_api.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/repository/get_character_repository.dart';

class GetCharacterRepositoryImpl extends GetCharacterRepository {
  GetCharacterApi getCharacterApi;

  GetCharacterRepositoryImpl({required this.getCharacterApi});

  @override
  Future<CharacterEntity> getCharacter(String characterId) async {
    final response = await getCharacterApi.getCharacter( id: characterId);

    return response.toCharacterEntity();
  }
}
