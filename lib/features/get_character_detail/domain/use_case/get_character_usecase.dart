import 'package:dragon_ball_app/features/get_character_detail/domain/entity/character_entity.dart';
import 'package:dragon_ball_app/features/get_character_detail/domain/repository/get_character_repository.dart';

class GetCharacterUsecase {
  
  GetCharacterRepository getCharacterRepository;

  GetCharacterUsecase({required this.getCharacterRepository});

  Future<CharacterEntity> getCharacter(String characterId) async {
    final response = await getCharacterRepository.getCharacter(characterId);
    return response;
  }

}